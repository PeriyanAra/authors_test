import 'package:flutter/foundation.dart';

sealed class Result<T, E extends Exception> {
  const Result();

  const factory Result.success(T data) = _Success;
  const factory Result.failure(E error) = _Failure;

  bool get isSuccess => this is _Success<T, E>;

  bool get isFailure => this is _Failure<T, E>;

  T get success {
    if (this is _Success<T, E>) {
      return (this as _Success<T, E>).data;
    }
    throw StateError('Called `success` on a Failure');
  }

  E get failure {
    if (this is _Failure<T, E>) {
      return (this as _Failure<T, E>).error;
    }
    throw StateError('Called `failure` on a Success');
  }

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(E error) failure,
  }) {
    switch (this) {
      case _Success():
        return success((this as _Success<T, E>).data);
      case _Failure():
        return failure((this as _Failure<T, E>).error);
    }
  }
}

@immutable
final class _Success<T, E extends Exception> extends Result<T, E> {
  const _Success(this.data);
  final T data;

  @override
  String toString() => 'Success($data)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _Success<T, E> &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => data.hashCode;
}

@immutable
final class _Failure<T, E extends Exception> extends Result<T, E> {
  const _Failure(this.error);
  final E error;

  @override
  String toString() => 'Failure($error)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _Failure<T, E> &&
          runtimeType == other.runtimeType &&
          error == other.error;

  @override
  int get hashCode => error.hashCode;
}
