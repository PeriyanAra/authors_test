import 'package:flutter/material.dart';

class AuthorsAppBarTheme extends ThemeExtension<AuthorsAppBarTheme> {
  const AuthorsAppBarTheme({
    this.centerTitle = true,
    this.leadingIconColor,
    this.backgroundColor,
    this.actionsIconColor,
    this.leadingIconSize = _leadingIconSize,
    this.actionsPadding = _actionsPadding,
    this.actionsIconSize = _actionsIconSize,
  });

  final bool centerTitle;
  final Color? leadingIconColor;
  final Color? actionsIconColor;
  final double leadingIconSize;
  final EdgeInsetsGeometry actionsPadding;
  final double actionsIconSize;
  final Color? backgroundColor;

  static const _leadingIconSize = 24.0;
  static const _actionsPadding = EdgeInsets.only(right: 16);
  static const _actionsIconSize = 32.0;

  @override
  ThemeExtension<AuthorsAppBarTheme> copyWith() {
    return AuthorsAppBarTheme(
      centerTitle: centerTitle,
      leadingIconColor: leadingIconColor,
      leadingIconSize: leadingIconSize,
      actionsPadding: actionsPadding,
      actionsIconColor: actionsIconColor,
      backgroundColor: backgroundColor,
      actionsIconSize: actionsIconSize,
    );
  }

  @override
  ThemeExtension<AuthorsAppBarTheme> lerp(
    covariant ThemeExtension<AuthorsAppBarTheme>? other,
    double t,
  ) {
    if (other is! AuthorsAppBarTheme) {
      return this;
    }

    return AuthorsAppBarTheme(
      centerTitle: centerTitle,
      leadingIconColor: leadingIconColor,
      actionsIconColor: actionsIconColor,
      backgroundColor: backgroundColor,
      leadingIconSize: leadingIconSize,
      actionsPadding: actionsPadding,
    );
  }

  static AuthorsAppBarTheme of(BuildContext context) {
    return Theme.of(context).extension<AuthorsAppBarTheme>()!;
  }
}
