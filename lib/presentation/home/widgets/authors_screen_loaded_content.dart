import 'package:authors/authors_ui_foundations.dart';
import 'package:authors/presentation/home/cubit.dart';
import 'package:authors/presentation/home/view_models.dart';
import 'package:authors/presentation/home/widgets.dart';
import 'package:authors/presentation/home/widgets/author_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorsScreenLoadedContent extends StatefulWidget {
  const AuthorsScreenLoadedContent({super.key, required this.authors});

  final List<AuthorViewModel> authors;

  @override
  State<AuthorsScreenLoadedContent> createState() =>
      _AuthorsScreenLoadedContentState();
}

class _AuthorsScreenLoadedContentState
    extends State<AuthorsScreenLoadedContent> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = AuthorsColorTheme.of(context);

    return RefreshIndicator(
      onRefresh: () async => context.read<AuthorsCubit>().refreshSearch(),
      color: colorTheme.iconPrimary,
      backgroundColor: colorTheme.backgroundSecondary,
      child:
          widget.authors.isEmpty
              ? const AuthorsScreenEmptyContent()
              : ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                separatorBuilder:
                    (context, index) => const SizedBox(height: 16),
                padding: const EdgeInsets.symmetric(vertical: 20),
                itemCount: widget.authors.length,
                itemBuilder: (context, index) {
                  if (index == widget.authors.length) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final author = widget.authors[index];
                  return AuthorCard(author: author);
                },
              ),
    );
  }
}
