import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.enabled = true,
    this.maxLines = 1,
    this.minLines,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.outlineBorder,
    this.isRequired = false,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;

  final String? labelText;
  final String? hintText;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  final bool obscureText;
  final bool enabled;

  final int? maxLines;
  final int? minLines;

  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;

  final OutlineInputBorder? outlineBorder;

  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final border =
        outlineBorder ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          RichText(
            text: TextSpan(
              style: theme.textTheme.labelLarge?.copyWith(
                color: colors.onSurface,
              ),
              children: [
                TextSpan(text: labelText),
                if (isRequired)
                  TextSpan(
                    text: " *",
                    style: TextStyle(
                      color: colors.error,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          obscureText: obscureText,
          enabled: enabled,
          maxLines: obscureText ? 1 : maxLines,
          minLines: minLines,
          validator: validator,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,

            border: border,

            enabledBorder: border.copyWith(
              borderSide: BorderSide(
                color: colors.outline,
              ),
            ),

            focusedBorder: border.copyWith(
              borderSide: BorderSide(
                color: colors.primary,
                width: 2,
              ),
            ),

            errorBorder: border.copyWith(
              borderSide: BorderSide(
                color: colors.error,
              ),
            ),

            focusedErrorBorder: border.copyWith(
              borderSide: BorderSide(
                color: colors.error,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
