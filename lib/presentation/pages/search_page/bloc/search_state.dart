part of 'search_bloc.dart';

class SearchState {
  final BlocStatus blocStatus;
  final List<Movie>? movies;
  final String? error;

  SearchState({required this.blocStatus, this.movies, this.error});

  SearchState copyWith(
      {required BlocStatus blocStatus, List<Movie>? movies, String? error}) {
    return SearchState(
        blocStatus: blocStatus,
        movies: movies ?? this.movies,
        error: error ?? this.error);
  }
}
