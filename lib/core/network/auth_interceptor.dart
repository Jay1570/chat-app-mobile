import "package:awesome_snackbar_content/awesome_snackbar_content.dart";
import "package:dio/dio.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:mobile_app/core/auth/auth_notifier.dart";
import "package:mobile_app/core/constants/storage_keys.dart";
import "package:mobile_app/snackbar.dart";

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
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      await authNotifier.logout();
    }

    final message = err.response?.data["message"] ?? "Something went wrong";

    AppSnackbar.showError(
      message: message.toString(),
      contentType: ContentType.failure,
    );

    handler.next(err);
  }
}
