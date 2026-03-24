part of 'authors_cubit.dart';

@immutable
sealed class AuthorsState {}

final class AuthorsLoading extends AuthorsState {
  AuthorsLoading();
}

final class AuthorsLoaded extends AuthorsState {
  AuthorsLoaded({required this.authors});

  final List<AuthorViewModel> authors;
}

final class AuthorsError extends AuthorsState {
  AuthorsError({required this.message});

  final String message;
}
