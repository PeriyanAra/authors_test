import 'package:authors/data/author/dto.dart';
import 'package:chopper/chopper.dart';

part 'author_api_service.chopper.dart';

@ChopperApi()
abstract class AuthorApiService extends ChopperService {
  static AuthorApiService create({ChopperClient? client}) {
    return _$AuthorApiService(client);
  }

  @GET(path: 'search/authors.json')
  Future<Response<AuthorsResponseDto>> searchAuthors(@Query('q') String query);
}
