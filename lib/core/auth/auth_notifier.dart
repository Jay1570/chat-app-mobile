import "package:chathub/core/network/api_exception.dart";
import "package:chathub/core/network/web_socket.dart";
import "package:chathub/services/notification_service.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:chathub/core/constants/storage_keys.dart";
import "package:chathub/models/user.dart";
import "package:chathub/core/utils/secure_storage.dart";
import "package:chathub/services/api/auth_api.dart";

class AuthNotifier extends AsyncNotifier<User?> {
  @override
  Future<User?> build() async {
    final storage = ref.read(secureStorageProvider);
    final token = await storage.read(key: jwtTokenStorageKey);

    if (token == null) return null;

    try {
      final authApi = ref.read(authApiProvider);
      final response = await authApi.me();
      await ref.read(webSocketProvider).connect(token: token);

      final fcmToken = ref.read(notificationServiceProvider).cachedToken;
      if (fcmToken != null) {
          await authApi.updateFcmToken(fcmToken);
      }

      return response;
    } on ApiException {
      await storage.delete(key: jwtTokenStorageKey);
      await storage.delete(key: refreshTokenStorageKey);
      return null;
    }
  }

  Future<void> setUser({
    required String accessToken,
    required String refreshToken,
    required User user,
  }) async {
    state = AsyncData(user);
    final storage = ref.read(secureStorageProvider);
    await storage.write(key: jwtTokenStorageKey, value: accessToken);
    await storage.write(key: refreshTokenStorageKey, value: refreshToken);
    await ref.read(webSocketProvider).connect(token: accessToken);

    final fcmToken = ref.read(notificationServiceProvider).cachedToken;
    if (fcmToken != null) {
        await ref.read(authApiProvider).updateFcmToken(fcmToken);
    }
  }

  Future<void> logout() async {
    if (state.value == null) return;
    try {
      await ref.read(authApiProvider).logout();
    } catch (_) {
      // Ignore network errors on logout to ensure local clean up still succeeds
    }
    final storage = ref.read(secureStorageProvider);
    await storage.delete(key: jwtTokenStorageKey);
    await storage.delete(key: refreshTokenStorageKey);
    await ref.read(webSocketProvider).disconnect();
    state = const AsyncData(null);
  }
}

final authProvider = AsyncNotifierProvider<AuthNotifier, User?>(
  AuthNotifier.new,
);

