part of 'top_rate_bloc.dart';

class TopRateState {
  final BlocStatus blocStatus;
  final List<Movie>? movies;
  final String? error;

  TopRateState({required this.blocStatus, this.movies, this.error});

  TopRateState copyWith(
      {required BlocStatus blocStatus, List<Movie>? movies, String? error}) {
    return TopRateState(
        blocStatus: blocStatus,
        movies: movies ?? this.movies,
        error: error ?? this.error);
  }
}
