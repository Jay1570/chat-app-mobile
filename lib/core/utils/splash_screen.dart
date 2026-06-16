import "package:dio/dio.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:chathub/core/auth/auth_notifier.dart";
import "dart:math" as math;

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      body: Center(
        child: authState.when(
          data: (_) => const SizedBox(),
          loading: () => TweenAnimationBuilder<double>(
            tween: Tween(begin: 1.2, end: 1.0),
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeOut,
            builder: (context, value, child) {
              return Transform.rotate(
                angle: (value - 1.0) * 2 * math.pi,
                child: Transform.scale(scale: value, child: child),
              );
            },
            child: Image.asset(
              "assets/icon/app_icon.png",
              width: 140,
              height: 140,
            ),
          ),
          error: (error, _) {
            final isNetworkError =
                error is DioException &&
                (error.type == DioExceptionType.connectionError ||
                    error.type == DioExceptionType.connectionTimeout ||
                    error.type == DioExceptionType.receiveTimeout);

            if (isNetworkError) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.wifi_off, size: 64),
                  const SizedBox(height: 16),
                  const Text("No Internet Connection"),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: () {
                      ref.invalidate(authProvider);
                    },
                    child: const Text("Retry"),
                  ),
                ],
              );
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline, size: 64),
                const SizedBox(height: 16),
                Text(error.toString()),
              ],
            );
          },
        ),
      ),
    );
  }
}
