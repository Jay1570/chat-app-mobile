import "package:chathub/core/constants/base_url.dart";
import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:chathub/core/auth/auth_notifier.dart";
import "package:chathub/core/network/auth_interceptor.dart";
import "package:chathub/core/utils/secure_storage.dart";

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: apiUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      validateStatus: (_) => true,
    ),
  );

  dio.interceptors.add(
    AuthInterceptor(
      storage: ref.read(secureStorageProvider),
      authNotifier: ref.read(authProvider.notifier),
      dio: dio,
    ),
  );
  dio.interceptors.add(
    LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (object) {
        if (kDebugMode) {
          debugPrint(object.toString());
        }
      },
    ),
  );

  return dio;
});
