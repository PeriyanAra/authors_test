import 'package:authors/authors_app_shared/lib/src/utility/debouncer.dart';
import 'package:authors/domain/author/author_repository.dart';
import 'package:authors/presentation/home/view_models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authors_state.dart';

class AuthorsCubit extends Cubit<AuthorsState> {
  AuthorsCubit({required AuthorRepository authorRepository})
    : _authorRepository = authorRepository,
      super(AuthorsLoaded(authors: const []));

  final AuthorRepository _authorRepository;
  final _debouncer = Debouncer(delay: const Duration(milliseconds: 300));
  var _searchQuery = '';

  void onSearchChanged(String query) {
    _debouncer(() {
      _searchAuthors(query);
    });
  }

  Future<void> _searchAuthors(String query) async {
    emit(AuthorsLoading());

    _searchQuery = query;
    final response = await _authorRepository.fetchAuthors(query: query);

    response.when(
      success: (success) {
        emit(
          AuthorsLoaded(
            authors:
                success.docs.map((e) {
                  return AuthorViewModel(
                    name: e.name,
                    workCount: e.workCount,
                    birthDate: e.birthDate,
                    deathDate: e.deathDate,
                    topWork: e.topWork,
                    alternateNames: e.alternateNames,
                    topSubjects: e.topSubjects,
                    id: e.key,
                  );
                }).toList(),
          ),
        );
      },
      failure: (failure) {
        emit(AuthorsError(message: failure.toString()));
      },
    );
  }

  void refreshSearch() {
    _searchAuthors(_searchQuery);
  }

  void cancelSearch() {
    _searchQuery = '';
    emit(AuthorsLoaded(authors: const []));
  }

  @override
  Future<void> close() {
    _debouncer.dispose();

    return super.close();
  }
}
