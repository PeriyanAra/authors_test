import 'package:authors/authors_app_shared/lib/authors_app_shared.dart';
import 'package:authors/data.dart';
import 'package:authors/domain.dart';

class DomainDependencies extends PackageDependencies {
  @override
  Future<void> register(DI di) async {
    di.registerLazySingleton<AuthorRepository>(() {
      return AuthorRepository(
        authorRemoteDataSource: di<AuthorRemoteDataSource>(),
      );
    });
  }
}
