import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:chathub/core/network/api_client.dart";
import "package:chathub/modules/auth/models/login_response.dart";
import "package:chathub/models/user.dart";

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

  Future<void> updateFcmToken(String? fcmToken) async {
    await _apiClient.post(
      "/users/fcm-token",
      data: {
        "token": fcmToken,
      },
      fromJson: (_) => null,
    );
  }
}

final authApiProvider = Provider<AuthApi>((ref) {
  return AuthApi(ref.watch(apiClientProvider));
});
