import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default('') String name,
    @Default('') String email,
    @Default('') String password,
    @Default('') String confirmPassword,

    @Default(false) bool showConfirmPassword,

    String? nameError,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,

    @Default(false) bool isLoading,
  }) = _RegisterState;
}
