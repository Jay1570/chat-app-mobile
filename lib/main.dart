import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mobile_app/router.dart";

final rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      routerConfig: ref.watch(routerProvider));
  }
}
