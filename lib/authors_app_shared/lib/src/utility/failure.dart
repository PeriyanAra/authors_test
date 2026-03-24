import 'package:flutter/foundation.dart';

enum FailureReason {
  noInternet,
  timeout,
  unauthorized,
  badRequest,
  notFound,
  conflict,
  forbidden,
  tooManyRequests,
  serverError,
  sslError,
  cancelled,
  httpClientError,
  socketError,
  parseError,
  unknown,
}

@immutable
final class FailureResult implements Exception {
  const FailureResult({
    required this.reason,
    required this.message,
    this.exception,
    this.stackTrace,
    this.statusCode,
  });

  final FailureReason reason;
  final String message;
  final Object? exception;
  final StackTrace? stackTrace;
  final int? statusCode;

  @override
  String toString() => '[$reason] $message';

  FailureResult copyWith({FailureReason? reason, String? message}) {
    return FailureResult(
      reason: reason ?? this.reason,
      message: message ?? this.message,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FailureResult &&
          runtimeType == other.runtimeType &&
          reason == other.reason &&
          exception == other.exception &&
          stackTrace == other.stackTrace &&
          statusCode == other.statusCode &&
          message == other.message;

  @override
  int get hashCode => reason.hashCode ^ message.hashCode;
}
