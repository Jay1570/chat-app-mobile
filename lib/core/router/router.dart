import "package:chathub/main.dart";
import "package:flutter/cupertino.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:chathub/core/auth/auth_notifier.dart";
import "package:chathub/modules/auth/login/login_screen.dart";
import "package:chathub/modules/auth/register/register_screen.dart";
import "package:chathub/core/utils/splash_screen.dart";

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
    overridePlatformDefaultLocation: true,
    navigatorKey: rootNavigatorKey,
    refreshListenable: authNotifier,
    initialLocation: "/splash",
    redirect: (context, state) {
      final auth = ref.read(authProvider);

      const publicRoutes = {
        "/login",
        "/register",
      };

      final isSplash = state.matchedLocation == "/splash";
      final from = state.uri.queryParameters["from"];
      final isPublicRoute = publicRoutes.contains(state.matchedLocation);

      if (auth.isLoading) {
        if (isSplash) return null;

        return "/splash?from=${Uri.encodeComponent(state.uri.toString())}";
      }

      final loggedIn = auth.value != null;

      if (isSplash) {
        final target = from != null
            ? Uri.decodeComponent(from)
            : (loggedIn ? "/home" : "/login");

        return target;
      }

      if (!loggedIn && !isPublicRoute) {
        return "/login?from=${Uri.encodeComponent(state.uri.toString())}";
      }

      if (loggedIn && isPublicRoute) {
        final from = state.uri.queryParameters["from"];

        return from != null && from.isNotEmpty
            ? Uri.decodeComponent(from)
            : "/home";
      }

      return null;
    },
    routes: [
      GoRoute(path: "/splash", builder: (_, _) => const SplashScreen()),
      GoRoute(path: "/login", builder: (context, state) => const LoginScreen()),
      GoRoute(path: "/home", builder: (context, state) => const SizedBox()),
      GoRoute(path: "/test", builder: (context, state) => const SizedBox()),
      GoRoute(
        path: "/register",
        builder: (context, state) => const RegisterScreen(),
      ),
    ],
  );
});
