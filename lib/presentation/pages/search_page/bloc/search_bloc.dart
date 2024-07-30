import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_search/domain/entity/movie/movie.dart';
import 'package:movie_search/domain/usecase/search_usecase.dart';
import 'package:movie_search/util/bloc_status.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ISearchUsecase _searchUsecase;

  SearchBloc(this._searchUsecase)
      : super(SearchState(blocStatus: BlocStatus.NONE)) {
    on<GetSearchEvent>((event, emit) async {
      emit(state.copyWith(blocStatus: BlocStatus.LOADING));
      final result = await _searchUsecase.call(event.query);

      if (result.isSuccess) {
        emit(
          state.copyWith(
            blocStatus: BlocStatus.LOADED,
            movies: result.movies,
            error: null,
          ),
        );
      } else {
        state.copyWith(
          blocStatus: BlocStatus.ERROR,
          movies: null,
          error: result.error,
        );
      }
    });
  }
}