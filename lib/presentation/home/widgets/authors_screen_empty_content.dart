import 'package:authors/authors_ui_foundations.dart';
import 'package:flutter/material.dart';

class AuthorsScreenEmptyContent extends StatelessWidget {
  const AuthorsScreenEmptyContent({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = AuthorsColorTheme.of(context);
    final textTheme = AuthorsTextTheme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.search_off_rounded,
              size: 48,
              color: colorTheme.iconPrimary,
            ),
            const SizedBox(height: 12),
            Text(
              'No authors found',
              style: textTheme.body2Regular.copyWith(
                color: colorTheme.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
