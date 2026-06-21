import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationService {
  String? _cachedToken;
  StreamSubscription<String>? _tokenRefreshSub;
  StreamSubscription<RemoteMessage>? _messageSub;
  bool _initialized = false;
  Future<void>? _initializing;

  String? get cachedToken => _cachedToken;

  Future<void> initialize({
    required Future<void> Function(String token) onToken,
  }) async {
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.linux) return;
    if (_initialized) return;
    if (_initializing != null) return _initializing;

    _initializing = _doInitialize(onToken);
    try {
      await _initializing;
    } finally {
      _initializing = null;
    }
  }

  Future<void> _doInitialize(
    Future<void> Function(String token) onToken,
  ) async {
    try {
      final messaging = FirebaseMessaging.instance;
      final settings = await messaging.requestPermission();
      if (settings.authorizationStatus == AuthorizationStatus.denied) {
        debugPrint('Notification permission denied');
        return;
      }

      final token = await messaging.getToken(
        vapidKey: kIsWeb
            ? "BDLGs4p_DyPl11WgsQrfVCYhUKFB6lAxDNrBzx57tCHHSvs5J7NejSiEKBlrnI7ApD_CGg2PN4zXB5hkiMIl8F0"
            : null,
      );

      if (token == null || token.isEmpty) {
        debugPrint('FCM token empty — will retry on next initialize() call');
        return;
      }

      _cachedToken = token;
      debugPrint(token);
      await onToken("FCM Token:- $token");

      _tokenRefreshSub = messaging.onTokenRefresh.listen((t) async {
        if (t.isNotEmpty) {
          _cachedToken = t;
          await onToken(t);
        }
      });

      _messageSub = FirebaseMessaging.onMessage.listen((message) {
        debugPrint("Notification received: ${message.notification?.title}");
      });

      _initialized = true;
    } catch (e, st) {
      debugPrint('GET TOKEN ERROR: $e');
      debugPrint('$st');
    }
  }

  Future<void> deleteToken({
    required Future<void> Function() deleteToken,
  }) async {
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.linux) return;
    await FirebaseMessaging.instance.deleteToken();
    _cachedToken = null;
    await deleteToken();
    await dispose();
  }

  Future<void> dispose() async {
    await _tokenRefreshSub?.cancel();
    await _messageSub?.cancel();
    _tokenRefreshSub = null;
    _messageSub = null;
    _initialized = false;
    _initializing = null;
  }
}

final notificationServiceProvider = Provider<NotificationService>((ref) {
  final service = NotificationService();

  ref.onDispose(() {
    unawaited(service.dispose());
  });

  return service;
});
