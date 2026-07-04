import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.value,
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
    this.errorText,
  });

  final String value;
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
  final String? errorText;

  final bool isRequired;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(covariant AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.value != _controller.text) {
      _controller.value = _controller.value.copyWith(
        text: widget.value,
        selection: TextSelection.collapsed(
          offset: widget.value.length,
        ),
        composing: TextRange.empty,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final border =
        widget.outlineBorder ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          RichText(
            text: TextSpan(
              style: theme.textTheme.labelLarge?.copyWith(
                color: colors.onSurface,
              ),
              children: [
                TextSpan(text: widget.labelText),
                if (widget.isRequired)
                  TextSpan(
                    text: " *",
                    style: TextStyle(color: colors.error),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
        TextFormField(
          controller: _controller,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          obscureText: widget.obscureText,
          enabled: widget.enabled,
          maxLines: widget.obscureText ? 1 : widget.maxLines,
          minLines: widget.minLines,
          validator: widget.validator,
          forceErrorText: widget.errorText,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            border: border,
            enabledBorder: border.copyWith(
              borderSide: BorderSide(color: colors.outline),
            ),
            focusedBorder: border.copyWith(
              borderSide: BorderSide(
                color: colors.primary,
                width: 2,
              ),
            ),
            errorBorder: border.copyWith(
              borderSide: BorderSide(color: colors.error),
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
