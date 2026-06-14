import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mobile_app/core/network/api_client.dart";
import "package:mobile_app/modules/auth/models/login_response.dart";
import "package:mobile_app/models/user.dart";

class AuthApi {
  AuthApi(this._apiClient);

  final ApiClient _apiClient;

  Future<LoginResponse> login(String email, String password) {
    return _apiClient.post(
      "/users/login",
      data: {"email": email, "password": password},
      fromJson: (json) => LoginResponse.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<LoginResponse> register(String name, String email, String password) {
    return _apiClient.post(
      "/users/register",
      data: {"name": name, "email": email, "password": password},
      fromJson: (json) => LoginResponse.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<User> me() {
    return _apiClient.get(
      "/users/me",
      (json) => User.fromJson(json as Map<String, dynamic>),
    );
  }
}

final authApiProvider = Provider<AuthApi>((ref) {
  return AuthApi(ref.watch(apiClientProvider));
});
