part of 'upcoming_bloc.dart';

class UpcomingState {
  final BlocStatus blocStatus;
  final List<Movie>? movies;
  final String? error;

  UpcomingState({required this.blocStatus, this.movies, this.error});

  UpcomingState copyWith(
      {required BlocStatus blocStatus, List<Movie>? movies, String? error}) {
    return UpcomingState(
        blocStatus: blocStatus,
        movies: movies ?? this.movies,
        error: error ?? this.error);
  }
}
