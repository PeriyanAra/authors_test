import 'package:authors/authors_ui_foundations.dart';
import 'package:flutter/material.dart';

class AuthorsTheme {
  static ThemeData create({
    required AuthorsColorTheme colorTheme,
    required AuthorsTextTheme textTheme,
    AuthorsTextFieldTheme textFieldTheme = const AuthorsTextFieldTheme(),
    List<ThemeExtension<dynamic>>? themes,
    AuthorsAppBarTheme appBarTheme = const AuthorsAppBarTheme(),
  }) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: colorTheme.primary,
      brightness: colorTheme.brightness,
    ).copyWith(
      primary: colorTheme.primary,
      onPrimary: colorTheme.backgroundPrimary,
      secondary: colorTheme.remind,
      onSecondary: colorTheme.backgroundPrimary,
      error: colorTheme.warning,
      onError: colorTheme.backgroundPrimary,
      surface: colorTheme.backgroundSecondary,
      onSurface: colorTheme.textPrimary,
    );

    return ThemeData(
      brightness: colorTheme.brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorTheme.backgroundPrimary,
      canvasColor: colorTheme.backgroundPrimary,
      cardColor: colorTheme.backgroundSecondary,
      extensions: [
        colorTheme,
        textTheme,
        appBarTheme,
        textFieldTheme,
        if (themes != null) ...themes,
      ],
    );
  }
}
