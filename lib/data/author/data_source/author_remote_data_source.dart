import 'package:authors/authors_app_shared/lib/src/utility/failure.dart';
import 'package:authors/authors_app_shared/lib/src/utility/result.dart';
import 'package:authors/data/author/data_source/author_data_source.dart';
import 'package:authors/data/author/dto/authors_response_dto.dart';
import 'package:authors/data/author/service.dart';

final class AuthorRemoteDataSource implements AuthorDataSource {
  AuthorRemoteDataSource({required AuthorApiService apiService})
    : _apiService = apiService;

  final AuthorApiService _apiService;

  @override
  Future<Result<AuthorsResponseDto, FailureResult>> searchAuthors({
    required String query,
  }) async {
    try {
      final response = await _apiService.searchAuthors(query);
      final body = response.body;

      if (body == null) {
        return Result.failure(_apiFailure('Search payload is empty'));
      }

      return Result.success(body);
    } catch (error, stackTrace) {
      return Result.failure(
        _remoteFailure('Failed to search authors', error, stackTrace),
      );
    }
  }

  FailureResult _remoteFailure(
    String message,
    Object error,
    StackTrace stackTrace,
  ) {
    return FailureResult(
      reason: FailureReason.serverError,
      message: message,
      exception: error,
      stackTrace: stackTrace,
    );
  }

  FailureResult _apiFailure(String message) {
    return FailureResult(reason: FailureReason.unknown, message: message);
  }
}
