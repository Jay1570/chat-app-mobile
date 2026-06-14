import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mobile_app/core/auth/auth_notifier.dart";
import "package:mobile_app/core/constants/storage_keys.dart";
import "package:mobile_app/secure_storage.dart";
import "package:mobile_app/services/api/auth_api.dart";

class RegisterNotifier extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> register(String name, String email, String password) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final response = await ref
          .read(authApiProvider)
          .register(name, email, password);

      await ref
          .read(secureStorageProvider)
          .write(key: jwtTokenStorageKey, value: response.token);

      ref.read(authProvider.notifier).setUser(response.user);
    });
  }
}

final registerProvider = AsyncNotifierProvider<RegisterNotifier, void>(
  RegisterNotifier.new,
);
