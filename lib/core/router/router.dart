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
    navigatorKey: rootNavigatorKey,
    refreshListenable: authNotifier,
    initialLocation: "/splash",
    redirect: (context, state) {
      final auth = ref.read(authProvider);

      final isSplash = state.matchedLocation == "/splash";

      const publicRoutes = {"/login", "/register"};
      final isPublicRoute = publicRoutes.contains(state.matchedLocation);

      if (auth.isLoading) {
        return isSplash ? null : "/splash";
      }

      final loggedIn = auth.value != null;

      if (isSplash) {
        return loggedIn ? "/home" : "/login";
      }

      if (!loggedIn && !isPublicRoute) {
        final from = Uri.encodeComponent(state.uri.toString());
        return "/login?from=$from";
      }

      if (loggedIn && isPublicRoute) {
        final from = state.uri.queryParameters["from"];

        if (from != null && from.isNotEmpty) {
          return Uri.decodeComponent(from);
        }

        return "/home";
      }

      return null;
    },
    routes: [
      GoRoute(path: "/splash", builder: (_, _) => const SplashScreen()),
      GoRoute(path: "/login", builder: (context, state) => const LoginScreen()),
      GoRoute(path: "/home", builder: (context, state) => const SizedBox()),
      GoRoute(
        path: "/register",
        builder: (context, state) => const RegisterScreen(),
      ),
    ],
  );
});
