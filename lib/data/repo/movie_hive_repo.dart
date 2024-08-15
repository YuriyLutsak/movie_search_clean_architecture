import 'package:movie_search/data/local_storage/hive_servise.dart';
import 'package:movie_search/domain/entity/hive/movie_hive/movie_hive.dart';
import 'package:movie_search/domain/entity/movie/movie.dart';
import 'package:movie_search/domain/repo/i_movie_hive_repo.dart';

class MovieHiveRepo implements IMovieHiveRepo {
  final HiveService hiveService;

  MovieHiveRepo(this.hiveService);

  @override
  Future<
      ({
        String? error,
        bool isSuccess,
        List<MovieHive>? movies,
      })> getAllMoviesFromHive() async {
    try {
      var movies = await hiveService.getAllMovies();
      return (
        isSuccess: true,
        movies: movies,
        error: null,
      );
    } catch (e) {
      return (
        isSuccess: false,
        movies: null,
        error: e.toString(),
      );
    }
  }

  @override
  Future<
      ({
        String? error,
        bool isSuccess,
        List<MovieHive>? movies,
      })> addMovieToHive(Movie movie) async {
    try {
      var movieHive = MovieHive.fromMovie(movie);
      await hiveService.addMovie(movieHive);
      var movies = await hiveService.getAllMovies();
      return (
        isSuccess: true,
        movies: movies,
        error: null,
      );
    } catch (e) {
      return (
        isSuccess: false,
        movies: null,
        error: e.toString(),
      );
    }
  }

  @override
  Future<
      ({
        String? error,
        bool isSuccess,
        MovieHive? movie,
      })> deleteMovieFromHive(int id) async {
    try {
      await hiveService.deleteMovie(id);
      return (
        isSuccess: true,
        movie: null,
        error: null,
      );
    } catch (e) {
      return (
        isSuccess: true,
        movie: null,
        error: 'movie deleted from hive. ${e.toString()}',
      );
    }
  }
}
