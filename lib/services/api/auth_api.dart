import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:chathub/core/network/api_client.dart";
import "package:chathub/core/utils/secure_storage.dart";
import "package:chathub/core/utils/device_helper.dart";
import "package:chathub/modules/auth/models/login_response.dart";
import "package:chathub/models/user.dart";

class RefreshResponse {
  const RefreshResponse({required this.accessToken, required this.refreshToken});

  final String accessToken;
  final String refreshToken;

  factory RefreshResponse.fromJson(Map<String, dynamic> json) {
    return RefreshResponse(
      accessToken: json["accessToken"] as String,
      refreshToken: json["refreshToken"] as String,
    );
  }
}

class AuthApi {
  AuthApi(this._apiClient, this._storage);

  final ApiClient _apiClient;
  final FlutterSecureStorage _storage;

  Future<LoginResponse> login(String email, String password) async {
    final deviceId = await DeviceHelper.getOrCreateDeviceId(_storage);
    final deviceName = await DeviceHelper.getDeviceName();
    final os = DeviceHelper.getOsName();

    return _apiClient.post(
      "/users/login",
      data: {
        "email": email,
        "password": password,
        "deviceId": deviceId,
        "deviceName": deviceName,
        "os": os,
      },
      fromJson: (json) => LoginResponse.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<LoginResponse> register(String name, String email, String password) async {
    final deviceId = await DeviceHelper.getOrCreateDeviceId(_storage);
    final deviceName = DeviceHelper.getDeviceName();
    final os = DeviceHelper.getOsName();

    return _apiClient.post(
      "/users/register",
      data: {
        "name": name,
        "email": email,
        "password": password,
        "deviceId": deviceId,
        "deviceName": deviceName,
        "os": os,
      },
      fromJson: (json) => LoginResponse.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<User> me() {
    return _apiClient.get(
      "/users/me",
      fromJson: (json) => User.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<void> updateFcmToken(String fcmToken) async {
    final deviceId = await DeviceHelper.getOrCreateDeviceId(_storage);
    await _apiClient.post(
      "/users/fcm-token",
      data: {
        "fcmToken": fcmToken,
        "deviceId": deviceId,
      },
      fromJson: (_) => null,
    );
  }

  Future<void> logout() async {
    final deviceId = await DeviceHelper.getOrCreateDeviceId(_storage);
    await _apiClient.post(
      "/users/logout",
      data: {
        "deviceId": deviceId,
      },
      fromJson: (_) => null,
    );
  }

  Future<RefreshResponse> refresh(String refreshToken) async {
    final deviceId = await DeviceHelper.getOrCreateDeviceId(_storage);
    final deviceName = DeviceHelper.getDeviceName();
    final os = DeviceHelper.getOsName();

    return _apiClient.post(
      "/users/refresh",
      data: {
        "refreshToken": refreshToken,
        "deviceId": deviceId,
        "deviceName": deviceName,
        "os": os,
      },
      fromJson: (json) => RefreshResponse.fromJson(json as Map<String, dynamic>),
    );
  }
}

final authApiProvider = Provider<AuthApi>((ref) {
  return AuthApi(ref.watch(apiClientProvider), ref.watch(secureStorageProvider));
});
