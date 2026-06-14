import "dart:async";

import "package:flutter/cupertino.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:mobile_app/auth_notifier.dart";
import "package:mobile_app/models/user.dart";
import "package:mobile_app/splash_screen.dart";

class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this.ref) {
    ref.listen(authProvider, (_, _) => notifyListeners());
  }

  final Ref ref;
}

final routerNotifierProvider = Provider<RouterNotifier>(
  (ref) => RouterNotifier(ref),
);

final routerProvider = Provider<GoRouter>((ref) {
  final authNotifier = ref.read(routerNotifierProvider);
  return GoRouter(
    refreshListenable: ValueNotifier(authNotifier),
    initialLocation: "/splash",
    redirect: (context, state) {
      final auth = ref.read(authProvider);

      if (auth.isLoading) {
        return "/splash";
      }

      final loggedIn = auth.value != null;
      final isLoginRoute = state.matchedLocation == "/login";

      if (!loggedIn && !isLoginRoute) {
        final from = Uri.encodeComponent(state.uri.toString());

        return "/login?from=$from";
      }

      if (loggedIn && isLoginRoute) {
        final from = state.uri.queryParameters["from"];

        return from ?? "/home";
      }

      return null;
    },
    routes: [
      GoRoute(path: "/splash", builder: (_, __) => const SplashScreen()),
      GoRoute(path: "/login", builder: (context, state) => const SizedBox()),
      GoRoute(path: "/home", builder: (context, state) => const SizedBox()),
    ],
  );
});
