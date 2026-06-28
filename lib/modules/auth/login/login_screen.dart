import "package:chathub/core/error_handler.dart";
import "package:chathub/core/utils/snackbar.dart";
import "package:chathub/core/widgets/app_text_field.dart";
import "package:chathub/main.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:chathub/modules/auth/login/login_notifier.dart";

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _login() async {
    try {
      await ref.read(loginProvider.notifier).login();
    } catch (e) {
      final error = resolveError(e);
      debugPrint("$e");
      AppSnackbar.showError(message: error.message, title: error.title);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final loginState = ref.watch(loginProvider);
    final controller = ref.watch(loginProvider.notifier);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colors.surfaceContainer,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            constraints: BoxConstraints(
              maxHeight: 500,
              maxWidth: 400,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: theme.textTheme.headlineLarge,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 24),

                AppTextField(
                  hintText: "Email",
                  labelText: "Email",
                  onChanged: controller.setEmail,
                  errorText: loginState.emailError,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  isRequired: true,
                ),

                const SizedBox(height: 16),

                AppTextField(
                  hintText: "Password",
                  labelText: "Password",
                  onChanged: controller.setPassword,
                  errorText: loginState.passwordError,
                  textInputAction: TextInputAction.done,
                  obscureText: !loginState.showPassword,
                  isRequired: true,
                  suffixIcon: IconButton(
                    onPressed: ref
                        .read(loginProvider.notifier)
                        .togglePasswordVisibility,
                    icon: Icon(
                      loginState.showPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  onFieldSubmitted: (_) => _login(),
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: loginState.isLoading ? null : _login,
                    child: loginState.isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(),
                          )
                        : const Text("Login"),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: TextButton(
                    onPressed: () {
                      rootNavigatorKey.currentContext?.push("/register");
                    },
                    child: const Text("Create an account"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
