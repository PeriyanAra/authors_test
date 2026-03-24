import 'package:authors/authors_app_shared/lib/src/utility/failure.dart';
import 'package:authors/authors_app_shared/lib/src/utility/result.dart';
import 'package:authors/data/author/dto.dart';

abstract interface class AuthorDataSource {
  Future<Result<AuthorsResponseDto, FailureResult>> searchAuthors({
    required String query,
  });
}
