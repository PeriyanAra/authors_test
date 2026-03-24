import 'package:authors/authors_ui_foundations/lib/src/themes/authors_color_theme.dart';
import 'package:flutter/material.dart';

class AuthorScaffold extends StatelessWidget {
  const AuthorScaffold({
    this.backgroundColor,
    this.backgroundGradient,
    this.padding,
    this.appBar,
    this.body,
    this.resizeToAvoidBottomInset,
    this.backgroundImagePath,
    super.key,
  });

  final Color? backgroundColor;
  final Gradient? backgroundGradient;
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final EdgeInsets? padding;
  final bool? resizeToAvoidBottomInset;
  final String? backgroundImagePath;

  @override
  Widget build(BuildContext context) {
    final colorTheme = AuthorsColorTheme.of(context);

    return Scaffold(
      backgroundColor: backgroundColor ?? colorTheme.backgroundPrimary,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: appBar,
      body: Container(
        padding: padding,
        decoration: BoxDecoration(gradient: backgroundGradient),
        child: body,
      ),
    );
  }
}
