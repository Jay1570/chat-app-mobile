import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mobile_app/core/network/internet_provider.dart";
import "package:mobile_app/core/router/router.dart";
import "package:mobile_app/core/theme/app_theme.dart";
import "package:mobile_app/core/theme/theme_notifier.dart";
import "package:mobile_app/core/utils/no_internet_screen.dart";

final rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(themeProvider);

    final hasInternet = ref.watch(internetProvider).value ?? true;

    if (!hasInternet) {
      return MaterialApp(home: const NoInternetScreen());
    }


    return MaterialApp.router(
      theme: AppTheme.light(Color(settings.seedColor)),
      darkTheme: AppTheme.dark(Color(settings.seedColor)),
      themeMode: settings.mode,
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      routerConfig: ref.watch(routerProvider),
    );
  }
}
