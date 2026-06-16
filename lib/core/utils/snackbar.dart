import "package:flutter/material.dart";
import "package:chathub/main.dart";
import "package:awesome_snackbar_content/awesome_snackbar_content.dart";

class AppSnackbar {
  static void showError({
    required String message,
    ContentType contentType = ContentType.help,
  }) {
    String title = contentType == ContentType.help
        ? "Info"
        : contentType == ContentType.failure
        ? "Error"
        : contentType == ContentType.success
        ? "Success"
        : "Warning";
    rootScaffoldMessengerKey.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          /// need to set following properties for best effect of awesome_snackbar_content
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: title,
            message: message,

            contentType: contentType,
          ),
        ),
      );
  }
}
