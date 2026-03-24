import 'package:authors/authors_ui_foundations.dart';
import 'package:authors/presentation/home/cubit/authors_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorsScreenSearchBar extends StatefulWidget {
  const AuthorsScreenSearchBar({super.key});

  @override
  State<AuthorsScreenSearchBar> createState() => _AuthorsScreenSearchBarState();
}

class _AuthorsScreenSearchBarState extends State<AuthorsScreenSearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = AuthorsColorTheme.of(context);

    return AuthorTextField(
      controller: _controller,
      hintText: 'Search',
      onChanged: (value) {
        context.read<AuthorsCubit>().onSearchChanged(value);
      },
      suffixIcon: ValueListenableBuilder(
        valueListenable: _controller,
        builder: (context, value, child) {
          return value.text.isNotEmpty
              ? IconButton(
                icon: Icon(Icons.close_rounded, color: colorTheme.iconPrimary),
                onPressed: _onClearPresed,
              )
              : const SizedBox.shrink();
        },
      ),
      preffixIcon: Icon(Icons.search_rounded, color: colorTheme.iconPrimary),
    );
  }

  void _onClearPresed() {
    _controller.clear();

    FocusScope.of(context).unfocus();
    context.read<AuthorsCubit>().cancelSearch();
  }
}
