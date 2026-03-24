import 'package:authors/authors_ui_foundations/lib/src/themes/authors_text_field_theme.dart';
import 'package:flutter/material.dart';

class AuthorTextField extends StatefulWidget {
  const AuthorTextField({
    super.key,
    this.controller,
    this.hintText,
    this.errorMessage,
    this.suffixIcon,
    this.preffixIcon,
    this.onChanged,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? errorMessage;
  final Widget? preffixIcon;
  final Widget? suffixIcon;
  final ValueSetter<String>? onChanged;

  @override
  State<AuthorTextField> createState() => _AuthorTextFieldState();
}

class _AuthorTextFieldState extends State<AuthorTextField> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AuthorsTextFieldTheme.of(context);

    return TextField(
      controller: controller,
      style: theme.textStyle,
      cursorColor: theme.cursorColor,
      cursorHeight: theme.cursorHeight,
      cursorErrorColor: theme.cursorErrorColor,
      autocorrect: false,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        prefixIcon: widget.preffixIcon,
        suffixIcon: widget.suffixIcon,
        contentPadding: theme.contentPadding,
        hintText: widget.hintText,
        border: theme.border,
        enabledBorder: theme.enabledBorder,
        focusedBorder: theme.focusedBorder,
        errorBorder: theme.errorBorder,
        hintStyle: theme.hintStyle,
        focusedErrorBorder: theme.focusedErrorBorder,
        filled: true,
        fillColor: theme.fillColor,
        error:
            widget.errorMessage != null
                ? Row(
                  children: [
                    if (theme.errorIcon != null) ...[
                      Icon(
                        theme.errorIcon,
                        color: theme.errorIconColor,
                        size: theme.errorIconSize,
                      ),
                      const SizedBox(width: 4),
                    ],
                    Text(widget.errorMessage!, style: theme.errorTextStyle),
                  ],
                )
                : null,
      ),
    );
  }
}
