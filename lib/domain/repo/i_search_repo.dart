import 'package:movie_search/domain/entity/movie/movie.dart';

abstract interface class ISearchRepo {
  Future<
      ({
        bool isSuccess,
        List<Movie>? movies,
        String? error,
      })> getSearchResult(String query);
}
