import 'package:flutter/material.dart';

const _halfT = 0.5;

@immutable
class AuthorsColorTheme extends ThemeExtension<AuthorsColorTheme> {
  const AuthorsColorTheme({
    required this.brightness,
    required this.primary,
    required this.iconPrimary,
    required this.backgroundPrimary,
    required this.backgroundSecondary,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.warning,
    required this.success,
    required this.remind,
  });

  final Brightness brightness;
  final Color primary;
  final Color iconPrimary;
  final Color backgroundPrimary;
  final Color backgroundSecondary;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color warning;
  final Color success;
  final Color remind;

  @override
  AuthorsColorTheme copyWith({
    Color? foregroundPrimary,
    Color? primary,
    Color? iconPrimary,
    Color? backgroundPrimary,
    Color? backgroundSecondary,
    Color? warning,
    Color? success,
    Color? remind,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
  }) {
    return AuthorsColorTheme(
      brightness: brightness,
      primary: primary ?? this.primary,
      iconPrimary: iconPrimary ?? this.iconPrimary,
      backgroundPrimary: backgroundPrimary ?? this.backgroundPrimary,
      backgroundSecondary: backgroundSecondary ?? this.backgroundSecondary,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      warning: warning ?? this.warning,
      success: success ?? this.success,
      remind: remind ?? this.remind,
    );
  }

  @override
  AuthorsColorTheme lerp(ThemeExtension<AuthorsColorTheme>? other, double t) {
    if (other is! AuthorsColorTheme) {
      return this;
    }

    return AuthorsColorTheme(
      brightness: t < _halfT ? brightness : other.brightness,
      primary: Color.lerp(primary, other.primary, t)!,
      iconPrimary: Color.lerp(iconPrimary, other.iconPrimary, t)!,
      backgroundPrimary:
          Color.lerp(backgroundPrimary, other.backgroundPrimary, t)!,
      backgroundSecondary:
          Color.lerp(backgroundSecondary, other.backgroundSecondary, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      success: Color.lerp(success, other.success, t)!,
      remind: Color.lerp(remind, other.remind, t)!,
    );
  }

  static AuthorsColorTheme of(BuildContext context) {
    return Theme.of(context).extension<AuthorsColorTheme>()!;
  }
}
