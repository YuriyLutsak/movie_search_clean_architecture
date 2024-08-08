part of 'bookmarks_bloc.dart';

class BookmarksState {
  final BlocStatus blocStatus;
  final List<Movie>? movies;
  final String? error;

  BookmarksState({required this.blocStatus, this.movies, this.error});

  BookmarksState copyWith(
      {required BlocStatus blocStatus, List<Movie>? movies, String? error}) {
    return BookmarksState(
        blocStatus: blocStatus,
        movies: movies ?? this.movies,
        error: error ?? this.error);
  }
}
