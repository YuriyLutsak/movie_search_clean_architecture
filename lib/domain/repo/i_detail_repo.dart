import 'package:movie_search/domain/entity/movie/movie.dart';

abstract interface class IDetailRepo {
  Future<
      ({
        bool isSuccess,
        Movie? movie,
        String? error,
      })> getDetailResult(int movieId);
}
