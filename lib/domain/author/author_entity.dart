import 'package:flutter/foundation.dart';

@immutable
class AuthorEntity {
  const AuthorEntity({
    required this.alternateNames,
    required this.birthDate,
    required this.deathDate,
    required this.key,
    required this.name,
    required this.topSubjects,
    required this.topWork,
    required this.type,
    required this.workCount,
    required this.ratingsAverage,
    required this.ratingsSortable,
    required this.ratingsCount,
    required this.ratingsCount1,
    required this.ratingsCount2,
    required this.ratingsCount3,
    required this.ratingsCount4,
    required this.ratingsCount5,
    required this.wantToReadCount,
    required this.alreadyReadCount,
    required this.currentlyReadingCount,
    required this.readinglogCount,
    required this.version,
  });

  final List<String> alternateNames;
  final String birthDate;
  final String deathDate;
  final String key;
  final String name;
  final List<String> topSubjects;
  final String topWork;
  final String type;
  final int workCount;
  final double ratingsAverage;
  final double ratingsSortable;
  final int ratingsCount;
  final int ratingsCount1;
  final int ratingsCount2;
  final int ratingsCount3;
  final int ratingsCount4;
  final int ratingsCount5;
  final int wantToReadCount;
  final int alreadyReadCount;
  final int currentlyReadingCount;
  final int readinglogCount;
  final int version;

  AuthorEntity copyWith({
    List<String>? alternateNames,
    String? birthDate,
    String? deathDate,
    String? key,
    String? name,
    List<String>? topSubjects,
    String? topWork,
    String? type,
    int? workCount,
    double? ratingsAverage,
    double? ratingsSortable,
    int? ratingsCount,
    int? ratingsCount1,
    int? ratingsCount2,
    int? ratingsCount3,
    int? ratingsCount4,
    int? ratingsCount5,
    int? wantToReadCount,
    int? alreadyReadCount,
    int? currentlyReadingCount,
    int? readinglogCount,
    int? version,
  }) {
    return AuthorEntity(
      alternateNames: alternateNames ?? this.alternateNames,
      birthDate: birthDate ?? this.birthDate,
      deathDate: deathDate ?? this.deathDate,
      key: key ?? this.key,
      name: name ?? this.name,
      topSubjects: topSubjects ?? this.topSubjects,
      topWork: topWork ?? this.topWork,
      type: type ?? this.type,
      workCount: workCount ?? this.workCount,
      ratingsAverage: ratingsAverage ?? this.ratingsAverage,
      ratingsSortable: ratingsSortable ?? this.ratingsSortable,
      ratingsCount: ratingsCount ?? this.ratingsCount,
      ratingsCount1: ratingsCount1 ?? this.ratingsCount1,
      ratingsCount2: ratingsCount2 ?? this.ratingsCount2,
      ratingsCount3: ratingsCount3 ?? this.ratingsCount3,
      ratingsCount4: ratingsCount4 ?? this.ratingsCount4,
      ratingsCount5: ratingsCount5 ?? this.ratingsCount5,
      wantToReadCount: wantToReadCount ?? this.wantToReadCount,
      alreadyReadCount: alreadyReadCount ?? this.alreadyReadCount,
      currentlyReadingCount:
          currentlyReadingCount ?? this.currentlyReadingCount,
      readinglogCount: readinglogCount ?? this.readinglogCount,
      version: version ?? this.version,
    );
  }

  @override
  bool operator ==(covariant AuthorEntity other) {
    if (identical(this, other)) return true;

    return other.key == key &&
        listEquals(other.alternateNames, alternateNames) &&
        other.birthDate == birthDate &&
        other.deathDate == deathDate &&
        other.name == name &&
        listEquals(other.topSubjects, topSubjects) &&
        other.topWork == topWork &&
        other.type == type &&
        other.workCount == workCount &&
        other.ratingsAverage == ratingsAverage &&
        other.ratingsSortable == ratingsSortable &&
        other.ratingsCount == ratingsCount &&
        other.ratingsCount1 == ratingsCount1 &&
        other.ratingsCount2 == ratingsCount2 &&
        other.ratingsCount3 == ratingsCount3 &&
        other.ratingsCount4 == ratingsCount4 &&
        other.ratingsCount5 == ratingsCount5 &&
        other.wantToReadCount == wantToReadCount &&
        other.alreadyReadCount == alreadyReadCount &&
        other.currentlyReadingCount == currentlyReadingCount &&
        other.readinglogCount == readinglogCount &&
        other.version == version;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        alternateNames.hashCode ^
        birthDate.hashCode ^
        deathDate.hashCode ^
        name.hashCode ^
        topSubjects.hashCode ^
        topWork.hashCode ^
        type.hashCode ^
        workCount.hashCode ^
        ratingsAverage.hashCode ^
        ratingsSortable.hashCode ^
        ratingsCount.hashCode ^
        ratingsCount1.hashCode ^
        ratingsCount2.hashCode ^
        ratingsCount3.hashCode ^
        ratingsCount4.hashCode ^
        ratingsCount5.hashCode ^
        wantToReadCount.hashCode ^
        alreadyReadCount.hashCode ^
        currentlyReadingCount.hashCode ^
        readinglogCount.hashCode ^
        version.hashCode;
  }

  @override
  String toString() {
    return 'AuthorEntity(alternateNames: $alternateNames, birthDate: $birthDate, deathDate: $deathDate, key: $key, name: $name, topSubjects: $topSubjects, topWork: $topWork, type: $type, workCount: $workCount, ratingsAverage: $ratingsAverage, ratingsSortable: $ratingsSortable, ratingsCount: $ratingsCount, ratingsCount1: $ratingsCount1, ratingsCount2: $ratingsCount2, ratingsCount3: $ratingsCount3, ratingsCount4: $ratingsCount4, ratingsCount5: $ratingsCount5, wantToReadCount: $wantToReadCount, alreadyReadCount: $alreadyReadCount, currentlyReadingCount: $currentlyReadingCount, readinglogCount: $readinglogCount, version: $version)';
  }
}
