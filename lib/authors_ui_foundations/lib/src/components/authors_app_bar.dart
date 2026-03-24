import 'package:authors/authors_ui_foundations/lib/src/themes/authors_app_bar_theme.dart';
import 'package:authors/authors_ui_foundations/lib/src/themes/authors_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthorsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthorsAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.systemOverlayStyle,
    this.hasBackgroundColor = true,
  });

  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool hasBackgroundColor;
  final SystemUiOverlayStyle? systemOverlayStyle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final textTheme = AuthorsTextTheme.of(context);
    final appBarTheme = AuthorsAppBarTheme.of(context);

    return AppBar(
      backgroundColor:
          hasBackgroundColor ? appBarTheme.backgroundColor : Colors.transparent,
      title: Text(title ?? '', style: textTheme.body1Regular),
      centerTitle: appBarTheme.centerTitle,
      actions: actions,
      surfaceTintColor: Colors.transparent,
      actionsIconTheme: IconThemeData(
        color: appBarTheme.actionsIconColor,
        size: appBarTheme.actionsIconSize,
      ),
      actionsPadding: appBarTheme.actionsPadding,
      systemOverlayStyle: systemOverlayStyle,
      leading: leading,
    );
  }
}
