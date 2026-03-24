import 'package:authors/authors_app_shared/lib/src/core.dart';

class CoreDependencies extends PackageDependencies {
  @override
  Future<void> register(DI di) async {
    di
      ..registerLazySingleton<CustomJsonDecoder>(() => CustomJsonDecoder([]))
      ..registerLazySingleton<JsonStringConverter>(
        () => JsonStringConverter(jsonDecoder: di()),
      );
  }
}
