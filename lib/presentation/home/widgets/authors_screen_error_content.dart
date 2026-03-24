import 'package:authors/authors_ui_foundations.dart';
import 'package:authors/presentation/home/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorsScreenErrorContent extends StatelessWidget {
  const AuthorsScreenErrorContent({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = AuthorsColorTheme.of(context);
    final textTheme = AuthorsTextTheme.of(context);

    return Column(
      children: [
        const SizedBox(height: 48),
        Icon(Icons.error_outline_rounded, size: 48, color: colorTheme.warning),
        const SizedBox(height: 12),
        Center(
          child: Text(
            'Something went wrong',
            style: textTheme.body2Regular.copyWith(
              color: colorTheme.textSecondary,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: ElevatedButton(
            onPressed: () {
              context.read<AuthorsCubit>().refreshSearch();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: colorTheme.primary,
              foregroundColor: colorTheme.backgroundPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('Retry'),
          ),
        ),
      ],
    );
  }
}
