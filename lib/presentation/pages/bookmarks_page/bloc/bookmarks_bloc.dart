import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_search/dependency_injection.dart' as di;
import 'package:movie_search/domain/entity/movie/movie.dart';
import 'package:movie_search/domain/usecase/hive_usecases/get_stored_usecase.dart';
import 'package:movie_search/util/bloc_status.dart';

import '../../../../domain/usecase/hive_usecases/add_stored_usecase.dart';
import '../../../../domain/usecase/hive_usecases/delete_stored_usecase.dart';

part 'bookmarks_event.dart';

part 'bookmarks_state.dart';

class BookmarksBloc extends Bloc<BookmarksEvent, BookmarksState> {
  final IGetStoredUsecase _getStoredUsecase = di.getIt.get();
  final IAddStorageUsecase _addStorageUsecase = di.getIt.get();
  final IDeleteStorageUsecase _deleteStorageUsecase = di.getIt.get();

  BookmarksBloc() : super(BookmarksState(blocStatus: BlocStatus.NONE)) {
    on<GetBookmarksEvent>((event, emit) async {
      emit(state.copyWith(blocStatus: BlocStatus.LOADING));
      try {
        var result = await _getStoredUsecase.call();
        List<Movie> movies = (result.movies ?? [])
            .map((movieHive) => Movie.fromMovieHive(movieHive))
            .toList();

        if (result.isSuccess) {
          emit(state.copyWith(
            blocStatus: BlocStatus.LOADED,
            movies: movies,
            error: null,
          ));
        }
      } catch (e) {
        emit(
          state.copyWith(
            blocStatus: BlocStatus.ERROR,
            movies: null,
            error: e.toString(),
          ),
        );
      }
    });

    on<AddToBookMarksEvent>((event, emit) {
      try {
        // Предполагаем, что state.movies не равен null и инициализирован
        final updatedMovies = List<Movie>.from(state.movies ?? []);
        updatedMovies.add(event.movie);

        emit(
          state.copyWith(
            blocStatus: BlocStatus.LOADED,
            movies: updatedMovies,
            error: null,
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(
            blocStatus: BlocStatus.ERROR,
            movies: state.movies,
            error: e.toString(),
          ),
        );
      }
    });

    on<RemoveFromBookmarksEvent>((event, emit) {
      try {
        // Предполагаем, что state.movies не равен null и инициализирован
        final updatedMovies = List<Movie>.from(state.movies ?? []);
        updatedMovies.remove(event.movie);

        emit(
          state.copyWith(
            blocStatus: BlocStatus.LOADED,
            movies: updatedMovies,
            error: null,
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(
            blocStatus: BlocStatus.ERROR,
            movies: state.movies,
            error: e.toString(),
          ),
        );
      }
    });
  }
}
