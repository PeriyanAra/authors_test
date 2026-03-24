import 'package:authors/authors_ui_foundations.dart';
import 'package:authors/presentation/common.dart';
import 'package:authors/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = AuthorsTextTheme.of(context);
    final colorTheme = AuthorsColorTheme.of(context);

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return AuthorScaffold(
          appBar: AuthorsAppBar(
            title: 'Settings',
            hasBackgroundColor: false,
            systemOverlayStyle:
                state.mode == ThemeMode.dark
                    ? SystemUiOverlayStyle.light
                    : SystemUiOverlayStyle.dark,
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: Icon(Icons.arrow_back_ios, color: colorTheme.textPrimary),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Theme mode', style: textTheme.body1Medium),
                Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: colorTheme.backgroundSecondary,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => _changeTheme(context),
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color:
                                state.mode == ThemeMode.light
                                    ? AuthorsColors.yellow20
                                    : null,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.light_mode,
                            color: colorTheme.textPrimary,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _changeTheme(context),
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color:
                                state.mode == ThemeMode.dark
                                    ? AuthorsColors.yellow20
                                    : null,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.dark_mode,
                            color: colorTheme.backgroundPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _changeTheme(BuildContext context) {
    context.read<ThemeCubit>().changeThemeMode();
  }
}
