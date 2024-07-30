part of 'detail_page_bloc.dart';

class DetailState {
  final BlocStatus blocStatus;
  final Movie? movie;
  final String? error;

  DetailState({required this.blocStatus, this.movie, this.error});

  DetailState copyWith(
      {required BlocStatus blocStatus, Movie? movie, String? error}) {
    return DetailState(
        blocStatus: blocStatus,
        movie: movie ?? this.movie,
        error: error ?? this.error);
  }
}
