import 'package:authors/domain/author/author_entity.dart';
import 'package:flutter/foundation.dart';

@immutable
class AuthorsResponseEntity {
  const AuthorsResponseEntity({
    required this.numFound,
    required this.start,
    required this.numFoundExact,
    required this.docs,
  });

  final int numFound;
  final int start;
  final bool numFoundExact;
  final List<AuthorEntity> docs;

  AuthorsResponseEntity copyWith({
    int? numFound,
    int? start,
    bool? numFoundExact,
    List<AuthorEntity>? docs,
  }) {
    return AuthorsResponseEntity(
      numFound: numFound ?? this.numFound,
      start: start ?? this.start,
      numFoundExact: numFoundExact ?? this.numFoundExact,
      docs: docs ?? this.docs,
    );
  }

  @override
  String toString() {
    return 'AuthorsResponseEntity(numFound: $numFound, start: $start, numFoundExact: $numFoundExact, docs: $docs)';
  }

  @override
  bool operator ==(covariant AuthorsResponseEntity other) {
    if (identical(this, other)) return true;

    return other.numFound == numFound &&
        other.start == start &&
        other.numFoundExact == numFoundExact &&
        listEquals(other.docs, docs);
  }

  @override
  int get hashCode {
    return numFound.hashCode ^
        start.hashCode ^
        numFoundExact.hashCode ^
        docs.hashCode;
  }
}
