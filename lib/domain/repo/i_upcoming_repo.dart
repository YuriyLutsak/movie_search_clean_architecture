import 'package:movie_search/domain/entity/movie/movie.dart';

abstract interface class IUpcomingRepo {
  Future<
      ({
        bool isSuccess,
        List<Movie>? movies,
        String? error,
      })> getUpcomingResult();
}
