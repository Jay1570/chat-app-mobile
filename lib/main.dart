import "package:chathub/core/app_bootstrap_provider.dart";
import "package:chathub/core/theme/text_theme.dart";
import "package:chathub/core/url_strategy/url_strategy.dart";
import "package:chathub/firebase_options.dart";
import "package:firebase_core/firebase_core.dart";
import "package:firebase_crashlytics/firebase_crashlytics.dart";
import "package:flutter/foundation.dart";
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb || defaultTargetPlatform != TargetPlatform.linux) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  useUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;

  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(appBootstrapProvider);
    final settings = ref.watch(themeProvider);

    final hasInternet = ref.watch(connectivityProvider).value ?? true;
    final textTheme = createTextTheme(context, "Roboto", "Roboto");

    return MaterialApp.router(
      theme: AppTheme.light(Color(settings.seedColor), textTheme),
      darkTheme: AppTheme.dark(Color(settings.seedColor), textTheme),
      themeMode: settings.mode,
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      routerConfig: ref.watch(routerProvider),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        if (!hasInternet) {
          return const NoInternetScreen();
        }
        return child!;
      },
    );
  }
}
