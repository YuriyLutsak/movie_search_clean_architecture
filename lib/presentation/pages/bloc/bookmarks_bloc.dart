import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_search/domain/entity/movie/movie.dart';
import 'package:movie_search/util/bloc_status.dart';

part 'bookmarks_event.dart';

part 'bookmarks_state.dart';

class BookmarksBloc extends Bloc<BookmarksEvent, BookmarksState> {
  BookmarksBloc() : super(BookmarksState(blocStatus: BlocStatus.NONE)) {
    on<GetBookmarksEvent>((event, emit) {
      try {
        // Здесь вы должны получить фактический список фильмов. В данный момент используется заглушка.
        // Замените на реальную логику получения данных.
        List<Movie> movies = event.movies;

        emit(
          state.copyWith(
            blocStatus: BlocStatus.LOADED,
            movies: movies,
            error: null,
          ),
        );
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
