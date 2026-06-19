import "package:chathub/core/constants/regex.dart";
import "package:chathub/core/network/web_socket.dart";
import "package:chathub/modules/auth/login/login_state.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:chathub/core/auth/auth_notifier.dart";
import "package:chathub/core/constants/storage_keys.dart";
import "package:chathub/core/utils/secure_storage.dart";
import "package:chathub/services/api/auth_api.dart";

class LoginNotifier extends Notifier<LoginState> {
  @override
  LoginState build() => const LoginState();

  void resetState() {
    state = const LoginState();
  }

  void setEmail(String value) {
    state = state.copyWith(
      email: value,
      emailError: null,
    );
  }

  void setPassword(String value) {
    state = state.copyWith(
      password: value,
      passwordError: null,
    );
  }

  void togglePasswordVisibility() {
    state = state.copyWith(
      showPassword: !state.showPassword,
    );
  }

  Future<void> login() async {
    String? emailError;
    String? passwordError;

    if (state.email.isEmpty) {
      emailError = "Email is required";
    } else if (!emailRegex.hasMatch(state.email)) {
      emailError = "Please enter a valid email address";
    }

    if (state.password.isEmpty) {
      passwordError = "Password is required";
    }

    if (emailError != null || passwordError != null) {
      state = state.copyWith(
        emailError: emailError,
        passwordError: passwordError,
      );
      return;
    }

    try {
      state = state.copyWith(isLoading: true);

      final response = await ref
          .read(authApiProvider)
          .login(state.email, state.password);

      await ref
          .read(secureStorageProvider)
          .write(key: jwtTokenStorageKey, value: response.token);

      ref.read(authProvider.notifier).setUser(response.user);

      await ref
          .read(webSocketProvider)
          .connect(
            token: response.token,
          );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}

final loginProvider = NotifierProvider<LoginNotifier, LoginState>(
  LoginNotifier.new,
);
