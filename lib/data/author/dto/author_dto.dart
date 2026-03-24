class AuthorDto {
  AuthorDto({
    this.alternateNames,
    this.birthDate,
    this.deathDate,
    this.key,
    this.name,
    this.topSubjects,
    this.topWork,
    this.type,
    this.workCount,
    this.ratingsAverage,
    this.ratingsSortable,
    this.ratingsCount,
    this.ratingsCount1,
    this.ratingsCount2,
    this.ratingsCount3,
    this.ratingsCount4,
    this.ratingsCount5,
    this.wantToReadCount,
    this.alreadyReadCount,
    this.currentlyReadingCount,
    this.readinglogCount,
    this.version,
  });

  factory AuthorDto.fromJson(Map<String, dynamic> json) {
    return AuthorDto(
      alternateNames: json['alternate_names'] is List<dynamic>
          ? List<Object?>.from(json['alternate_names'] as List<dynamic>)
          : null,
      birthDate: json['birth_date'],
      deathDate: json['death_date'],
      key: json['key'],
      name: json['name'],
      topSubjects: json['top_subjects'] is List<dynamic>
          ? List<Object?>.from(json['top_subjects'] as List<dynamic>)
          : null,
      topWork: json['top_work'],
      type: json['type'],
      workCount: json['work_count'],
      ratingsAverage: json['ratings_average'],
      ratingsSortable: json['ratings_sortable'],
      ratingsCount: json['ratings_count'],
      ratingsCount1: json['ratings_count_1'],
      ratingsCount2: json['ratings_count_2'],
      ratingsCount3: json['ratings_count_3'],
      ratingsCount4: json['ratings_count_4'],
      ratingsCount5: json['ratings_count_5'],
      wantToReadCount: json['want_to_read_count'],
      alreadyReadCount: json['already_read_count'],
      currentlyReadingCount: json['currently_reading_count'],
      readinglogCount: json['readinglog_count'],
      version: json['_version_'],
    );
  }

  final List<Object?>? alternateNames;
  final Object? birthDate;
  final Object? deathDate;
  final Object? key;
  final Object? name;
  final List<Object?>? topSubjects;
  final Object? topWork;
  final Object? type;
  final Object? workCount;
  final Object? ratingsAverage;
  final Object? ratingsSortable;
  final Object? ratingsCount;
  final Object? ratingsCount1;
  final Object? ratingsCount2;
  final Object? ratingsCount3;
  final Object? ratingsCount4;
  final Object? ratingsCount5;
  final Object? wantToReadCount;
  final Object? alreadyReadCount;
  final Object? currentlyReadingCount;
  final Object? readinglogCount;
  final Object? version;

  Map<String, dynamic> toJson() {
    return {
      'alternate_names': alternateNames,
      'birth_date': birthDate,
      'death_date': deathDate,
      'key': key,
      'name': name,
      'top_subjects': topSubjects,
      'top_work': topWork,
      'type': type,
      'work_count': workCount,
      'ratings_average': ratingsAverage,
      'ratings_sortable': ratingsSortable,
      'ratings_count': ratingsCount,
      'ratings_count_1': ratingsCount1,
      'ratings_count_2': ratingsCount2,
      'ratings_count_3': ratingsCount3,
      'ratings_count_4': ratingsCount4,
      'ratings_count_5': ratingsCount5,
      'want_to_read_count': wantToReadCount,
      'already_read_count': alreadyReadCount,
      'currently_reading_count': currentlyReadingCount,
      'readinglog_count': readinglogCount,
      '_version_': version,
    };
  }
}
