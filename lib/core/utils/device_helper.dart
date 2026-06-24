import "dart:io";
import "package:chathub/core/constants/storage_keys.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:flutter/foundation.dart";
import "package:device_info_plus/device_info_plus.dart";
import "package:uuid/uuid.dart";

class DeviceHelper {
  static final _deviceInfo = DeviceInfoPlugin();

  static Future<String> getOrCreateDeviceId(
    FlutterSecureStorage storage,
  ) async {
    String? deviceId = await storage.read(key: deviceIdStorageKey);
    if (deviceId == null) {
      deviceId = const Uuid().v4();
      await storage.write(key: deviceIdStorageKey, value: deviceId);
    }
    return deviceId;
  }

  static String getOsName() {
    if (kIsWeb) return "Web";
    if (Platform.isAndroid) return "Android";
    if (Platform.isIOS) return "iOS";
    if (Platform.isMacOS) return "macOS";
    if (Platform.isWindows) return "Windows";
    if (Platform.isLinux) return "Linux";
    return "Unknown";
  }

  static Future<String> getDeviceName() async {
    try {
      if (kIsWeb) {
        final info = await _deviceInfo.webBrowserInfo;
        return info.browserName.name;
      }
      if (Platform.isAndroid) {
        final info = await _deviceInfo.androidInfo;
        return info.model;
      }
      if (Platform.isIOS) {
        final info = await _deviceInfo.iosInfo;
        return info.model;
      }
      if (Platform.isMacOS) {
        final info = await _deviceInfo.macOsInfo;
        return info.modelName;
      }
      if (Platform.isWindows) {
        final info = await _deviceInfo.windowsInfo;
        return info.computerName;
      }
      if (Platform.isLinux) {
        final info = await _deviceInfo.linuxInfo;
        return info.prettyName;
      }
    } catch (_) {}
    return "${getOsName()} Device";
  }
}
