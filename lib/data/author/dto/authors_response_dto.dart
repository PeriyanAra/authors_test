import 'package:authors/data/author/dto/author_dto.dart';

class AuthorsResponseDto {
  AuthorsResponseDto({
    required this.numFound,
    required this.start,
    required this.numFoundExact,
    required this.docs,
  });

  factory AuthorsResponseDto.fromJson(Map<String, dynamic> json) {
    final rawAuthors = json['docs'];
    final parsedAuthors = <AuthorDto>[];

    if (rawAuthors is List<dynamic>) {
      for (final item in rawAuthors) {
        if (item is Map<String, dynamic>) {
          parsedAuthors.add(AuthorDto.fromJson(item));
        }
      }
    }

    return AuthorsResponseDto(
      numFound: json['numFound'],
      start: json['start'],
      numFoundExact: json['numFoundExact'],
      docs: parsedAuthors,
    );
  }

  final Object? numFound;
  final Object? start;
  final Object? numFoundExact;
  final List<AuthorDto> docs;

  Map<String, dynamic> toJson() {
    return {
      'numFound': numFound,
      'start': start,
      'numFoundExact': numFoundExact,
      'docs': docs.map((dto) => dto.toJson()).toList(),
    };
  }
}
