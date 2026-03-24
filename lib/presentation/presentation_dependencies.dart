import 'package:authors/authors_app_shared/lib/authors_app_shared.dart';
import 'package:authors/presentation/common.dart';
import 'package:authors/presentation/home/cubit/authors_cubit.dart';

class PresentationDependencies extends PackageDependencies {
  @override
  Future<void> register(DI di) async {
    di
      ..registerLazySingleton<AuthorsCubit>(
        () => AuthorsCubit(authorRepository: di()),
      )
      ..registerLazySingleton<ThemeCubit>(() => ThemeCubit(preferences: di()));
  }
}
