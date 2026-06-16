import "package:flutter/material.dart";
import "package:chathub/main.dart";

enum SnackbarType {
  success,
  error,
  warning,
  info,
}

Color _backgroundColor(
  SnackbarType type,
  ColorScheme colors,
) {
  return switch (type) {
    SnackbarType.success => colors.primaryContainer,
    SnackbarType.error => colors.errorContainer,
    SnackbarType.warning => colors.tertiaryContainer,
    SnackbarType.info => colors.secondaryContainer,
  };
}

Color _foregroundColor(
  SnackbarType type,
  ColorScheme colors,
) {
  return switch (type) {
    SnackbarType.success => colors.onPrimaryContainer,
    SnackbarType.error => colors.onErrorContainer,
    SnackbarType.warning => colors.onTertiaryContainer,
    SnackbarType.info => colors.onSecondaryContainer,
  };
}

class AppSnackbar {
  static void show({
    required String title,
    required String message,
    required SnackbarType type,
  }) {
    final context = rootNavigatorKey.currentContext;

    if (context == null) return;

    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final foregroundColor = _foregroundColor(type, colors);

    rootScaffoldMessengerKey.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: _backgroundColor(type, colors),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: foregroundColor,
                ),
              ),
              if (message.isNotEmpty)
                Text(
                  message,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: foregroundColor,
                  ),
                ),
            ],
          ),
        ),
      );
  }

  static void showError({
    required String message,
    required String title,
  }) {
    show(
      message: message,
      title: title,
      type: SnackbarType.error,
    );
  }
}
