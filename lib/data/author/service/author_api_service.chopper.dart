// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'author_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$AuthorApiService extends AuthorApiService {
  _$AuthorApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = AuthorApiService;

  @override
  Future<Response<AuthorsResponseDto>> searchAuthors(String query) {
    final Uri $url = Uri.parse('search/authors.json');
    final Map<String, dynamic> $params = <String, dynamic>{'q': query};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<AuthorsResponseDto, AuthorsResponseDto>($request);
  }
}
