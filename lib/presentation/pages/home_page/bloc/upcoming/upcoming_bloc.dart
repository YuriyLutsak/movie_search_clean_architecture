import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_search/domain/entity/movie/movie.dart';
import 'package:movie_search/domain/usecase/upcoming_usecase.dart';

import '../../../../../util/bloc_status.dart';

part 'upcoming_event.dart';

part 'upcoming_state.dart';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  final IUpcomingUsecase _upcomingUsecase;

  UpcomingBloc(this._upcomingUsecase)
      : super(UpcomingState(blocStatus: BlocStatus.NONE)) {
    on<GetUpcomingEvent>((event, emit) async {
      emit(
        state.copyWith(blocStatus: BlocStatus.LOADING),
      );
      // maping result in state from usecase
      final result = await _upcomingUsecase.call(); // call method call from usecase
      if (result.isSuccess) {
        emit(state.copyWith(
          blocStatus: BlocStatus.LOADED,
          movies: result.movies,
        ));
      } else {
        emit(state.copyWith(
          blocStatus: BlocStatus.ERROR,
          error: result.error,
        ));
      }
    });
  }
}
