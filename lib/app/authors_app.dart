import 'package:authors/authors_app_shared/lib/authors_app_shared.dart';
import 'package:authors/presentation/common.dart';
import 'package:authors/presentation/router/app_router.dart';
import 'package:authors/presentation/theme/authors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorsApp extends StatefulWidget {
  const AuthorsApp({super.key, required this.di});
  final DI di;

  @override
  State<AuthorsApp> createState() => _AuthorsAppState();
}

class _AuthorsAppState extends State<AuthorsApp> {
  final _router = AppRouter().config();

  @override
  Widget build(BuildContext context) {
    return CommonDependenciesProvider(
      di: widget.di,
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            color: AuthorsAppTheme.appBackground(state.mode),
            debugShowCheckedModeBanner: false,
            routerConfig: _router,
            theme: AuthorsAppTheme.light(),
            darkTheme: AuthorsAppTheme.dark(),
            themeMode: state.mode,
          );
        },
      ),
    );
  }
}
