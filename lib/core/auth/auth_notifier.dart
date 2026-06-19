import "package:chathub/core/network/web_socket.dart";
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
    if (token == null) {
      return null;
    }

    try {
      final response = await ref.read(authApiProvider).me();
      await ref.read(webSocketProvider).connect(token: token);
      return response;
    } on ApiException {
      await storage.delete(key: jwtTokenStorageKey);

      return null;
    }
  }

  void setUser(User user) {
    state = AsyncData(user);
  }

  Future<void> logout() async {
    await ref.read(secureStorageProvider).delete(key: jwtTokenStorageKey);
    await ref.read(webSocketProvider).disconnect();
    state = const AsyncData(null);
  }
}

final authProvider = AsyncNotifierProvider<AuthNotifier, User?>(
  AuthNotifier.new,
);
