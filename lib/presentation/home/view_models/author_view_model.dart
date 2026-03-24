class AuthorViewModel {
  AuthorViewModel({
    required this.id,
    required this.name,
    required this.workCount,
    required this.birthDate,
    required this.deathDate,
    required this.topWork,
    this.alternateNames,
    this.topSubjects,
  });

  final String id;
  final String name;
  final int workCount;
  final String birthDate;
  final String deathDate;
  final String topWork;
  final List<String>? alternateNames;
  final List<String>? topSubjects;

  AuthorViewModel copyWith({
    String? name,
    int? workCount,
    String? birthDate,
    String? deathDate,
    String? image,
    String? topWork,
    List<String>? alternateNames,
    List<String>? topSubjects,
  }) {
    return AuthorViewModel(
      id: id,
      name: name ?? this.name,
      workCount: workCount ?? this.workCount,
      birthDate: birthDate ?? this.birthDate,
      deathDate: deathDate ?? this.deathDate,
      topWork: topWork ?? this.topWork,
      alternateNames: alternateNames ?? this.alternateNames,
      topSubjects: topSubjects ?? this.topSubjects,
    );
  }

  @override
  String toString() {
    return 'AuthorViewModel(key: $id, name: $name, workCount: $workCount, birthDate: $birthDate, deathDate: $deathDate, topWork: $topWork, alternateNames: $alternateNames, topSubjects: $topSubjects)';
  }
}
