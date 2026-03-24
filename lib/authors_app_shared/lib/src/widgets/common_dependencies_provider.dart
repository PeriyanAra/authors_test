import 'package:authors/authors_app_shared/lib/authors_app_shared.dart';
import 'package:authors/presentation/common/cubits/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CommonDependenciesProvider extends StatelessWidget {
  const CommonDependenciesProvider({
    super.key,
    required this.di,
    required this.child,
  });

  final DI di;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: BlocFactory(di: di)),
        BlocProvider.value(value: di<ThemeCubit>()..loadThemeMode()),
      ],
      child: child,
    );
  }
}
