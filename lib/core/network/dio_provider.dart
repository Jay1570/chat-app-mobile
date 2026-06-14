import "package:dio/dio.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mobile_app/auth_notifier.dart";
import "package:mobile_app/core/network/auth_interceptor.dart";
import "package:mobile_app/secure_storage.dart";

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: "https://api.example.com",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  dio.interceptors.add(AuthInterceptor(storage: ref.read(secureStorageProvider), authNotifier: ref.read(authProvider.notifier)));
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  return dio;
});
