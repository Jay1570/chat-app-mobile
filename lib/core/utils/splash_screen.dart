import "package:dio/dio.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:chathub/core/auth/auth_notifier.dart";

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      body: Center(
        child: authState.when(
          data: (_) => Container(
            constraints: BoxConstraints(
              maxHeight: 400,
              maxWidth: 400,
            ),
            padding: EdgeInsets.all(16),
            child: Image.asset("assets/icon/app_icon.png"),
          ),
          loading: () => Container(
            constraints: BoxConstraints(
              maxHeight: 400,
              maxWidth: 400,
            ),
            padding: EdgeInsets.all(16),
            child: Image.asset("assets/icon/app_icon.png"),
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
