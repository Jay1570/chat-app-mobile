import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mobile_app/core/constants/storage_keys.dart";
import "package:mobile_app/core/network/api_exception.dart";
import "package:mobile_app/models/user.dart";
import "package:mobile_app/core/utils/secure_storage.dart";
import "package:mobile_app/services/api/auth_api.dart";

class AuthNotifier extends AsyncNotifier<User?> {
  @override
  Future<User?> build() async {
    final storage = ref.read(secureStorageProvider);

    final token = await storage.read(key: jwtTokenStorageKey);
    if (token == null) {
      return null;
    }

    try {
      return await ref.read(authApiProvider).me();
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

    state = const AsyncData(null);
  }
}

final authProvider = AsyncNotifierProvider<AuthNotifier, User?>(
  AuthNotifier.new,
);
