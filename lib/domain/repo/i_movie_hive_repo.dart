import 'package:movie_search/domain/entity/hive/movie_hive/movie_hive.dart';
import 'package:movie_search/domain/entity/movie/movie.dart';

abstract interface class IMovieHiveRepo {
  Future<
      ({
        bool isSuccess,
        List<MovieHive>? movies,
        String? error,
      })> getAllMoviesFromHive();

  Future<
      ({
        bool isSuccess,
        List< MovieHive>? movies,
        String? error,
      })> addMovieToHive(Movie movie);

  Future<
      ({
        bool isSuccess,
        List<MovieHive>? movies,
        String? error,
      })> deleteMovieFromHive(int id);
}
