import 'package:authors/authors_app_shared/lib/authors_app_shared.dart';
import 'package:authors/authors_ui_foundations.dart';
import 'package:authors/presentation/common.dart';
import 'package:authors/presentation/home/cubit/authors_cubit.dart';
import 'package:authors/presentation/home/widgets/authors_screen_list_panel.dart';
import 'package:authors/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthorsScreen extends StatelessWidget {
  const AuthorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<BlocFactory>().get<AuthorsCubit>(),
      child: const _AuthorsScreenContentBuilder(),
    );
  }
}

class _AuthorsScreenContentBuilder extends StatelessWidget {
  const _AuthorsScreenContentBuilder();

  @override
  Widget build(BuildContext context) {
    final colorTheme = AuthorsColorTheme.of(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AuthorScaffold(
        backgroundColor: colorTheme.backgroundPrimary,
        appBar: AuthorsAppBar(
          title: 'Authors',
          hasBackgroundColor: false,
          systemOverlayStyle:
              context.watch<ThemeCubit>().state.mode == ThemeMode.dark
                  ? SystemUiOverlayStyle.light
                  : SystemUiOverlayStyle.dark,
          actions: [
            IconButton(
              onPressed: () {
                context.push(settingsPath);
              },
              icon: Icon(Icons.settings, color: colorTheme.textPrimary),
            ),
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: AuthorsScreenListPanel(),
        ),
      ),
    );
  }
}
