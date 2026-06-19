import "package:chathub/core/constants/regex.dart";
import "package:chathub/modules/auth/register/register_state.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:chathub/core/auth/auth_notifier.dart";
import "package:chathub/core/constants/storage_keys.dart";
import "package:chathub/core/utils/secure_storage.dart";
import "package:chathub/services/api/auth_api.dart";

class RegisterNotifier extends Notifier<RegisterState> {
  @override
  RegisterState build() => const RegisterState();

  void resetState() {
    state = const RegisterState();
  }

  void setName(String value) {
    state = state.copyWith(
      name: value,
      nameError: null,
    );
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

  void setConfirmPassword(String value) {
    state = state.copyWith(
      confirmPassword: value,
      confirmPasswordError: null,
    );
  }

  void toggleConfirmPasswordVisibility() {
    state = state.copyWith(
      showConfirmPassword: !state.showConfirmPassword,
    );
  }

  Future<void> register() async {
    String? nameError;
    String? emailError;
    String? passwordError;
    String? confirmPasswordError;

    if (state.name.trim().isEmpty) {
      nameError = "Name is required";
    }

    if (state.email.trim().isEmpty) {
      emailError = "Email is required";
    } else if (!emailRegex.hasMatch(state.email.trim())) {
      emailError = "Please enter a valid email address";
    }

    if (state.password.isEmpty) {
      passwordError = "Password is required";
    } else if (!passwordRegex.hasMatch(state.password)) {
      passwordError =
          "Password must contain uppercase, lowercase, number, special character and be at least 8 characters";
    }

    if (state.confirmPassword.isEmpty) {
      confirmPasswordError = "Please confirm your password";
    } else if (state.confirmPassword != state.password) {
      confirmPasswordError = "Passwords do not match";
    }

    if (nameError != null ||
        emailError != null ||
        passwordError != null ||
        confirmPasswordError != null) {
      state = state.copyWith(
        nameError: nameError,
        emailError: emailError,
        passwordError: passwordError,
        confirmPasswordError: confirmPasswordError,
      );
      return;
    }

    try {
      state = state.copyWith(isLoading: true);

      final response = await ref
          .read(authApiProvider)
          .register(
            state.name.trim(),
            state.email.trim(),
            state.password,
          );

      await ref
          .read(secureStorageProvider)
          .write(
            key: jwtTokenStorageKey,
            value: response.token,
          );

      ref.read(authProvider.notifier).setUser(response.user);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}

final registerProvider = NotifierProvider<RegisterNotifier, RegisterState>(
  RegisterNotifier.new,
);
