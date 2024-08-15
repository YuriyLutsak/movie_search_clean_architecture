import 'package:movie_search/domain/entity/hive/movie_hive/movie_hive.dart';
import 'package:movie_search/domain/repo/i_movie_hive_repo.dart';

abstract interface class IDeleteStorageUsecase {
  Future<
      ({
        bool isSuccess,
        List<MovieHive>? movies,
        String? error,
      })> call(int id);
}

class DeleteStorageUsecase implements IDeleteStorageUsecase {
  final IMovieHiveRepo iMovieHiveRepo;

  DeleteStorageUsecase(this.iMovieHiveRepo);

  @override
  Future<
      ({
        String? error,
        bool isSuccess,
        List<MovieHive>? movies,
      })> call(int id) async {
    return iMovieHiveRepo.deleteMovieFromHive(id);
  }
}
