import "package:dio/dio.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mobile_app/core/auth/auth_notifier.dart";
import "package:mobile_app/core/network/auth_interceptor.dart";
import "package:mobile_app/core/utils/secure_storage.dart";

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: "http://192.168.100.20:5000/api",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      validateStatus: (_) => true,
    ),
  );

  dio.interceptors.add(AuthInterceptor(storage: ref.read(secureStorageProvider), authNotifier: ref.read(authProvider.notifier)));
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  return dio;
});
