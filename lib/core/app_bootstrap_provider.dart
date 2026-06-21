// core/bootstrap/app_bootstrap_provider.dart
import 'package:chathub/core/auth/auth_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chathub/services/notification_service.dart';
import 'package:chathub/services/api/auth_api.dart';// wherever authProvider lives

final appBootstrapProvider = FutureProvider<void>((ref) async {
  final notificationService = ref.read(notificationServiceProvider);

  await notificationService.initialize(
    onToken: (token) async {
      final user = ref.read(authProvider).value;
      if (user != null) {
        await ref.read(authApiProvider).updateFcmToken(token);
      }
    },
  );
});
