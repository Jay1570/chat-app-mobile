import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default('') String email,
    @Default('') String password,

    @Default(false) bool showPassword,

    String? emailError,
    String? passwordError,

    @Default(false) bool isLoading,
  }) = _LoginState;
}