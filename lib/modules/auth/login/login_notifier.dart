import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:chathub/core/auth/auth_notifier.dart";
import "package:chathub/core/constants/storage_keys.dart";
import "package:chathub/core/utils/secure_storage.dart";
import "package:chathub/services/api/auth_api.dart";

class LoginNotifier extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final response = await ref.read(authApiProvider).login(email, password);

      await ref
          .read(secureStorageProvider)
          .write(key: jwtTokenStorageKey, value: response.token);

      ref.read(authProvider.notifier).setUser(response.user);
    });
  }
}

final loginProvider = AsyncNotifierProvider<LoginNotifier, void>(
  LoginNotifier.new,
);
