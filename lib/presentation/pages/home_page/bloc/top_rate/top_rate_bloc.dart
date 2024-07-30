import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_search/util/bloc_status.dart';

import '../../../../../domain/entity/movie/movie.dart';
import '../../../../../domain/usecase/top_rate_usecase.dart';

part 'top_rate_event.dart';

part 'top_rate_state.dart';

class TopRateBloc extends Bloc<TopRateEvent, TopRateState> {
  final ITopRateUsecase _topRateUsecase;

  TopRateBloc(this._topRateUsecase)
      : super(TopRateState(blocStatus: BlocStatus.NONE)) {
    on<GetTopRateEvent>((event, emit) async {
      emit(state.copyWith(blocStatus: BlocStatus.LOADING));
      final result = await _topRateUsecase.call();
      // mapping result in state from usecase
      if (result.isSuccess) {
        emit(state.copyWith(
          blocStatus: BlocStatus.LOADED,
          movies: result.movies,
        ));
      } else {
        emit(state.copyWith(
          blocStatus: BlocStatus.ERROR,
          movies: null,
          error: result.error,
        ));
      }
    });
  }
}
