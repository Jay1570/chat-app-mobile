import "package:chathub/core/error_handler.dart";
import "package:chathub/core/utils/snackbar.dart";
import "package:chathub/core/widgets/app_text_field.dart";
import "package:chathub/main.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:chathub/modules/auth/register/register_notifier.dart";
import "package:go_router/go_router.dart";

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _register() async {
    try {
      await ref.read(registerProvider.notifier).register();
    } catch (e) {
      final error = resolveError(e);

      AppSnackbar.showError(message: error.message, title: error.title);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final state = ref.watch(registerProvider);
    final controller = ref.watch(registerProvider.notifier);

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
              maxHeight: 700,
              maxWidth: 400,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Register",
                  style: theme.textTheme.headlineLarge,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 24),
                AppTextField(
                  labelText: "Name",
                  hintText: "Name",
                  onChanged: controller.setName,
                  errorText: state.nameError,
                  isRequired: true,
                  textInputAction: TextInputAction.next,
                ),

                const SizedBox(height: 16),

                AppTextField(
                  labelText: "Email",
                  hintText: "Email",
                  onChanged: controller.setEmail,
                  errorText: state.emailError,
                  isRequired: true,
                  textInputAction: TextInputAction.next,
                ),

                const SizedBox(height: 16),

                AppTextField(
                  labelText: "Password",
                  hintText: "Password",
                  obscureText: true,
                  onChanged: controller.setPassword,
                  errorText: state.passwordError,
                  isRequired: true,
                  textInputAction: TextInputAction.next,
                ),

                const SizedBox(height: 16),

                AppTextField(
                  labelText: "Confirm Password",
                  hintText: "Confirm Password",
                  obscureText: !state.showConfirmPassword,
                  isRequired: true,
                  onChanged: controller.setConfirmPassword,
                  errorText: state.confirmPasswordError,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _register(),
                  suffixIcon: IconButton(
                    onPressed: controller.toggleConfirmPasswordVisibility,
                    icon: Icon(
                      state.showConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: state.isLoading ? null : _register,
                    child: state.isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(),
                          )
                        : const Text("Register"),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: TextButton(
                    onPressed: () {
                      rootNavigatorKey.currentContext?.go("/login");
                    },
                    child: const Text("Already have an account? Login"),
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
