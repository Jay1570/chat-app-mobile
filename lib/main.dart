import "package:chathub/core/url_strategy/url_strategy.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:chathub/core/network/internet_provider.dart";
import "package:chathub/core/router/router.dart";
import "package:chathub/core/theme/app_theme.dart";
import "package:chathub/core/theme/theme_notifier.dart";
import "package:chathub/core/utils/no_internet_screen.dart";
import "package:go_router/go_router.dart";

final rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
final rootNavigatorKey = GlobalKey<NavigatorState>();

void main() {
  useUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;

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
      debugShowCheckedModeBanner: false,
    );
  }
}
