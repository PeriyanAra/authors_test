import 'package:authors/authors_app_shared/lib/src/core/di.dart';

abstract class PackageDependencies {
  Future<void> register(DI di);
}
