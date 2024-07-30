import 'package:movie_search/domain/entity/movie/movie.dart';


// объявкв тнгтерфейса для связи (контракта) domain with data
abstract interface class IUpcomingRepo {
  Future<
      ({
        bool isSuccess,
        List<Movie>? movies,
        String? error,
      })> getUpcomingResult();
}
