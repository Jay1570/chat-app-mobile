import "package:chathub/core/network/web_socket.dart";
import "package:chathub/services/notification_service.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:chathub/core/constants/storage_keys.dart";
import "package:chathub/core/network/api_exception.dart";
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

      // No more notificationService.initialize() here.
      final fcmToken = ref.read(notificationServiceProvider).cachedToken;
      if (fcmToken != null) {
        await authApi.updateFcmToken(fcmToken);
      }

      return response;
    } on ApiException {
      await storage.delete(key: jwtTokenStorageKey);
      return null;
    }
  }

  Future<void> setUser({required String token, required User user}) async {
    state = AsyncData(user);
    await ref
        .read(secureStorageProvider)
        .write(key: jwtTokenStorageKey, value: token);
    await ref.read(webSocketProvider).connect(token: token);

    final fcmToken = ref.read(notificationServiceProvider).cachedToken;
    if (fcmToken != null) {
      await ref.read(authApiProvider).updateFcmToken(fcmToken);
    }
  }

  Future<void> logout() async {
    await ref.read(secureStorageProvider).delete(key: jwtTokenStorageKey);
    await ref.read(webSocketProvider).disconnect();
    await ref.read(authApiProvider).updateFcmToken(null);
    state = const AsyncData(null);
  }
}

final authProvider = AsyncNotifierProvider<AuthNotifier, User?>(
  AuthNotifier.new,
);
