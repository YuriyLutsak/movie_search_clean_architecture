import 'package:movie_search/domain/entity/hive/movie_hive/movie_hive.dart';
import 'package:movie_search/domain/repo/i_movie_hive_repo.dart';

abstract interface class IGetStoredUsecase {
  Future<
      ({
        bool isSuccess,
        List<MovieHive>? movies,
        String? error,
      })> call();
}

class GetStoredUsecase implements IGetStoredUsecase {
  final IMovieHiveRepo iMovieHiveRepo;

  GetStoredUsecase(this.iMovieHiveRepo);

  @override
  Future<({String? error, bool isSuccess, List<MovieHive>? movies})>
      call() async {
    return iMovieHiveRepo.getAllMoviesFromHive();
  }
}
