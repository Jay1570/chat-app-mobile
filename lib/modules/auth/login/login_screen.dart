import "package:chathub/core/constants/regex.dart";
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
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    await ref
        .read(loginProvider.notifier)
        .login(_emailController.text.trim(), _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final loginState = ref.watch(loginProvider);

    ref.listen(loginProvider, (_, next) {
      next.whenOrNull(
        error: (error, _) {
          final errorInfo = resolveError(error);

          AppSnackbar.showError(
            title: errorInfo.title,
            message: errorInfo.message,
          );
        },
      );
    });

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
            child: Form(
              key: _formKey,
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
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    isRequired: true,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Email is required";
                      }

                      if (!emailRegex.hasMatch(value.trim())) {
                        return "Please enter a valid email address";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  AppTextField(
                    hintText: "Password",
                    labelText: "Password",
                    controller: _passwordController,
                    obscureText: true,
                    isRequired: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }

                      return null;
                    },
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
                        rootNavigatorKey.currentContext?.go("/register");
                      },
                      child: const Text("Create an account"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
