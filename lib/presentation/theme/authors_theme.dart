import 'package:authors/authors_ui_foundations.dart';
import 'package:authors/presentation/theme/authors_colors.dart';
import 'package:flutter/material.dart';

class AuthorsAppTheme {
  static ThemeData light() {
    final colorTheme = _lightColorTheme();
    final textTheme = _textTheme(textColor: colorTheme.textPrimary);

    return AuthorsTheme.create(
      colorTheme: colorTheme,
      textTheme: textTheme,
      textFieldTheme: _textFieldTheme(colorTheme),
    );
  }

  static AuthorsColorTheme _lightColorTheme() {
    return const AuthorsColorTheme(
      brightness: Brightness.light,
      primary: AuthorsColors.white,
      iconPrimary: AuthorsColors.gray60,
      backgroundPrimary: AuthorsColors.yellow20,
      backgroundSecondary: AuthorsColors.gray20,
      textPrimary: AuthorsColors.black,
      textSecondary: AuthorsColors.gray60,
      textTertiary: AuthorsColors.gray50,
      success: AuthorsColors.green50,
      remind: AuthorsColors.orange40,
      warning: AuthorsColors.red40,
    );
  }

  static ThemeData dark() {
    final colorTheme = _darkColorTheme();
    final textTheme = _textTheme(textColor: colorTheme.textPrimary);
    return AuthorsTheme.create(
      colorTheme: colorTheme,
      textTheme: textTheme,
      textFieldTheme: _textFieldTheme(colorTheme),
    );
  }

  static Color appBackground(ThemeMode mode) {
    if (mode == ThemeMode.dark) {
      return _darkColorTheme().backgroundPrimary;
    }

    return _lightColorTheme().backgroundPrimary;
  }

  static AuthorsColorTheme _darkColorTheme() {
    return const AuthorsColorTheme(
      brightness: Brightness.dark,
      primary: AuthorsColors.white,
      iconPrimary: AuthorsColors.gray60,
      backgroundPrimary: AuthorsColors.gray100,
      backgroundSecondary: AuthorsColors.gray95,
      textPrimary: AuthorsColors.white,
      textSecondary: AuthorsColors.gray60,
      textTertiary: AuthorsColors.gray50,
      success: AuthorsColors.green50,
      remind: AuthorsColors.orange40,
      warning: AuthorsColors.red40,
    );
  }

  static AuthorsTextTheme _textTheme({required Color textColor}) {
    final textTheme = AuthorsTextTheme(
      textColor: textColor,
      fontFamily: 'OpenSans',
    );

    return textTheme;
  }

  static AuthorsTextFieldTheme _textFieldTheme(AuthorsColorTheme colorTheme) {
    final borderRadius = BorderRadius.circular(30.0);

    return AuthorsTextFieldTheme(
      border: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide.none,
      ),
      cursorColor: colorTheme.textSecondary,
      fillColor: colorTheme.backgroundSecondary,
      hintStyle: TextStyle(color: colorTheme.textSecondary),
      textStyle: TextStyle(color: colorTheme.textPrimary),
    );
  }
}
