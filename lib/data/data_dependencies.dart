import 'package:authors/authors_app_shared/lib/authors_app_shared.dart';
import 'package:authors/data/author/data_source.dart';
import 'package:authors/data/author/service.dart';

class DataDependencies extends PackageDependencies {
  @override
  Future<void> register(DI di) async {
    di
      ..registerLazySingleton(Client.createStagingClient)
      ..registerLazySingleton<AuthorApiService>(() {
        return AuthorApiService.create(client: di());
      })
      ..registerLazySingleton<AuthorRemoteDataSource>(() {
        return AuthorRemoteDataSource(apiService: di());
      });
  }
}
