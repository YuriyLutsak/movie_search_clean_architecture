import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_search/domain/entity/movie/movie.dart';
import 'package:movie_search/util/bloc_status.dart';

import '../../../../domain/usecase/detail_usecase.dart';

part 'detail_page_event.dart';

part 'detail_page_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final IDetailUsecase _detailUsecase;

  DetailBloc(this._detailUsecase)
      : super(DetailState(blocStatus: BlocStatus.NONE)) {
    on<GetDetailPageEvent>((event, emit) async {
      emit(state.copyWith(blocStatus: BlocStatus.LOADING));
      final result = await _detailUsecase.call(event.filmId);

      if (result.isSuccess) {
        emit(
          state.copyWith(
            blocStatus: BlocStatus.LOADED,
            movie: result.movie,
          ),
        );
      } else {
        (
          state.copyWith(
            blocStatus: BlocStatus.ERROR,
            movie: null,
            error: result.error,
          ),
        );
      }
    });
  }
}
