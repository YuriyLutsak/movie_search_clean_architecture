import 'package:movie_search/domain/entity/hive/movie_hive/movie_hive.dart';
import 'package:movie_search/domain/entity/movie/movie.dart';
import 'package:movie_search/domain/repo/i_movie_hive_repo.dart';

abstract interface class IAddStorageUsecase {
  Future<
      ({
        bool isSuccess,
        MovieHive? movie,
        String? error,
      })> call(Movie movie);
}

class AddStorageUsecase implements IAddStorageUsecase {
  final IMovieHiveRepo iMovieHiveRepo;

  AddStorageUsecase(this.iMovieHiveRepo);

  @override
  Future<
      ({
        String? error,
        bool isSuccess,
        MovieHive? movie,
      })> call(Movie movie) {
    return iMovieHiveRepo.addMovieToHive(movie);
  }
}
