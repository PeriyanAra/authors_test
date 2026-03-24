import 'package:authors/authors_ui_foundations.dart';
import 'package:authors/presentation/home/cubit.dart';
import 'package:authors/presentation/home/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorsScreenListPanel extends StatelessWidget {
  const AuthorsScreenListPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = AuthorsColorTheme.of(context);

    return Column(
      children: [
        const AuthorsScreenSearchBar(),
        const SizedBox(height: 28),
        Expanded(
          child: BlocBuilder<AuthorsCubit, AuthorsState>(
            builder:
                (context, state) => switch (state) {
                  AuthorsLoaded() => AuthorsScreenLoadedContent(
                    authors: state.authors,
                  ),
                  AuthorsError() => const AuthorsScreenErrorContent(),
                  _ => Center(
                    child: CircularProgressIndicator(
                      color: colorTheme.iconPrimary,
                    ),
                  ),
                },
          ),
        ),
      ],
    );
  }
}
