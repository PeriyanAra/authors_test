import 'package:authors/authors_app_shared/lib/authors_app_shared.dart';
import 'package:authors/data/author/data_source/author_remote_data_source.dart';
import 'package:authors/domain/author/author_entity.dart';
import 'package:authors/domain/author/authors_response_entity.dart';

class AuthorRepository {
  AuthorRepository({required AuthorRemoteDataSource authorRemoteDataSource})
    : _authorRemoteDataSource = authorRemoteDataSource;

  final AuthorRemoteDataSource _authorRemoteDataSource;

  Future<Result<AuthorsResponseEntity, FailureResult>> fetchAuthors({
    required String query,
  }) async {
    final remoteResponse = await _authorRemoteDataSource.searchAuthors(
      query: query,
    );

    return remoteResponse.when(
      success: (data) {
        final docs =
            data.docs
                .map(
                  (dto) => AuthorEntity(
                    key: dto.key.toSafeString(''),
                    name: dto.name.toSafeString('Unknown'),
                    topSubjects: dto.topSubjects.toStringList(),
                    topWork: dto.topWork.toSafeString(''),
                    type: dto.type.toSafeString('author'),
                    workCount: dto.workCount.toIntSafe(),
                    ratingsAverage: dto.ratingsAverage.toDoubleSafe(),
                    ratingsSortable: dto.ratingsSortable.toDoubleSafe(),
                    ratingsCount: dto.ratingsCount.toIntSafe(),
                    ratingsCount1: dto.ratingsCount1.toIntSafe(),
                    ratingsCount2: dto.ratingsCount2.toIntSafe(),
                    ratingsCount3: dto.ratingsCount3.toIntSafe(),
                    ratingsCount4: dto.ratingsCount4.toIntSafe(),
                    ratingsCount5: dto.ratingsCount5.toIntSafe(),
                    wantToReadCount: dto.wantToReadCount.toIntSafe(),
                    alreadyReadCount: dto.alreadyReadCount.toIntSafe(),
                    currentlyReadingCount:
                        dto.currentlyReadingCount.toIntSafe(),
                    readinglogCount: dto.readinglogCount.toIntSafe(),
                    version: dto.version.toIntSafe(),
                    alternateNames: dto.alternateNames.toStringList(),
                    birthDate: dto.birthDate.toSafeString(''),
                    deathDate: dto.deathDate.toSafeString(''),
                  ),
                )
                .toList();

        return Result.success(
          AuthorsResponseEntity(
            numFound: data.numFound.toIntSafe(),
            start: data.start.toIntSafe(),
            numFoundExact: data.numFoundExact == true,
            docs: docs,
          ),
        );
      },
      failure: Result.failure,
    );
  }
}
