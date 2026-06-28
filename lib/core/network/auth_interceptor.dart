import "package:dio/dio.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:chathub/core/auth/auth_notifier.dart";
import "package:chathub/core/constants/storage_keys.dart";
import "package:chathub/core/utils/device_helper.dart";
import "package:chathub/services/api/auth_api.dart";

class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required this.storage,
    required this.authNotifier,
    required this.dio,
  });

  final FlutterSecureStorage storage;
  final AuthNotifier authNotifier;
  final Dio dio;

  Future<RefreshResponse?>? _refreshFuture;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await storage.read(key: jwtTokenStorageKey);

    if (token != null) {
      options.headers["Authorization"] = token;
    }

    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.statusCode == 401) {
      final options = response.requestOptions;

      if (options.path.endsWith("/refresh") ||
          options.path.endsWith("/login") ||
          options.path.endsWith("/register")) {
        handler.next(response);
        return;
      }

      if (options.extra['retried'] == true) {
        await authNotifier.logout();
        handler.next(response);
        return;
      }

      final refreshToken = await storage.read(key: refreshTokenStorageKey);
      if (refreshToken == null) {
        await authNotifier.logout();
        handler.next(response);
        return;
      }

      _refreshFuture ??= _refresh(refreshToken);
      final refreshResult = await _refreshFuture;
      _refreshFuture = null;

      if (refreshResult != null) {
        await storage.write(
          key: jwtTokenStorageKey,
          value: refreshResult.accessToken,
        );
        await storage.write(
          key: refreshTokenStorageKey,
          value: refreshResult.refreshToken,
        );

        try {
          options.extra['retried'] = true;
          final retryResponse = await _retry(
            options,
            refreshResult.accessToken,
          );
          handler.next(retryResponse);
          return;
        } catch (_) {
          handler.next(response);
          return;
        }
      } else {
        await authNotifier.logout();
      }
    }

    handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Network-level errors (timeout, no connection) — no 401 handling needed here
    // since validateStatus: (_) => true means HTTP errors never reach onError
    handler.next(err);
  }

  Future<RefreshResponse?> _refresh(String refreshToken) async {
    try {
      final deviceId = await DeviceHelper.getOrCreateDeviceId(storage);
      final deviceName = await DeviceHelper.getDeviceName();
      final os = DeviceHelper.getOsName();

      final response = await dio.post<Map<String, dynamic>>(
        "/users/refresh",
        data: {
          "refreshToken": refreshToken,
          "deviceId": deviceId,
          "deviceName": deviceName,
          "os": os,
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        final success = response.data!["success"] as bool? ?? false;
        if (success) {
          final data = response.data!["data"] as Map<String, dynamic>;
          return RefreshResponse.fromJson(data);
        }
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  Future<Response<dynamic>> _retry(
    RequestOptions requestOptions,
    String newAccessToken,
  ) {
    final headers = Map<String, dynamic>.from(requestOptions.headers);
    headers["Authorization"] = newAccessToken;

    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        method: requestOptions.method,
        headers: headers,
      ),
    );
  }
}
