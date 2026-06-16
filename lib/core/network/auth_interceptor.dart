import "package:dio/dio.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:chathub/core/auth/auth_notifier.dart";
import "package:chathub/core/constants/storage_keys.dart";

class AuthInterceptor extends Interceptor {
  AuthInterceptor({required this.storage, required this.authNotifier});

  final FlutterSecureStorage storage;
  final AuthNotifier authNotifier;

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
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.statusCode == 401) {
      await authNotifier.logout();
    }

    handler.next(response);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      await authNotifier.logout();
    }

    handler.next(err);
  }
}
