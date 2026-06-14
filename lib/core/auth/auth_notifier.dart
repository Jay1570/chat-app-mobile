import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mobile_app/core/constants/storage_keys.dart";
import "package:mobile_app/models/user.dart";
import "package:mobile_app/secure_storage.dart";
import "package:mobile_app/services/api/auth_api.dart";

class AuthNotifier extends AsyncNotifier<User?> {
  @override
  Future<User?> build() async {
    final storage = ref.read(secureStorageProvider);

    final token = await storage.read(key: jwtTokenStorageKey);
    if (token == null) {
      return null;
    }

    return ref.read(authApiProvider).me();
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
