import 'package:movie_search/domain/entity/movie/movie.dart';
import 'package:movie_search/domain/repo/i_detail_repo.dart';

abstract interface class IDetailUsecase {
  Future<
      ({
        bool isSuccess,
        Movie? movie,
        String? error,
      })> call(int movieId);
}

class DetailUsecase implements IDetailUsecase {
  final IDetailRepo detailRepo;

  DetailUsecase(this.detailRepo);

  @override
  Future<
      ({
        bool isSuccess,
        Movie? movie,
        String? error,
      })> call(int movieId) {
    return detailRepo.getDetailResult(movieId);
  }
}
