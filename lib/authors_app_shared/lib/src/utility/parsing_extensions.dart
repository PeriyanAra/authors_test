extension ObjectParsingExtensions on Object? {
  double toDoubleSafe([double fallback = 0.0]) {
    if (this is double) {
      return this! as double;
    }
    if (this is int) {
      return (this! as int).toDouble();
    }
    if (this is num) {
      return (this! as num).toDouble();
    }
    if (this is String) {
      return double.tryParse(this! as String) ?? fallback;
    }
    return fallback;
  }

  int toIntSafe([int fallback = 0]) {
    if (this is int) {
      return this! as int;
    }
    if (this is num) {
      return (this! as num).toInt();
    }
    if (this is String) {
      return int.tryParse(this! as String) ?? fallback;
    }
    return fallback;
  }

  String toSafeString(String fallback) {
    if (this == null) {
      return fallback;
    }
    final stringValue = toString();
    if (stringValue.isEmpty) {
      return fallback;
    }
    return stringValue;
  }

  DateTime toDateTimeSafe([DateTime? fallback]) {
    if (this is DateTime) {
      return this! as DateTime;
    }
    if (this is String) {
      final parsed = DateTime.tryParse(this! as String);
      if (parsed != null) {
        return parsed;
      }
    }
    if (this is num) {
      return DateTime.fromMillisecondsSinceEpoch((this! as num).toInt());
    }
    return fallback ?? DateTime.fromMillisecondsSinceEpoch(0);
  }

  List<String> toStringList() {
    if (this is Iterable) {
      return (this! as Iterable)
          .whereType<String>()
          .map((item) => item)
          .toList();
    }
    return const [];
  }
}
