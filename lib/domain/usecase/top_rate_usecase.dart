import 'package:movie_search/domain/entity/movie/movie.dart';

import '../repo/i_top_rate_repo.dart';

abstract interface class ITopRateUsecase {
  Future<
      ({
        bool isSuccess,
        List<Movie>? movies,
        String? error,
      })> call();
}

class TopRateUsecase implements ITopRateUsecase {
  final ITopRateRepo iTopRateRepo;

  TopRateUsecase(this.iTopRateRepo);

  @override
  Future<({String? error, bool isSuccess, List<Movie>? movies})> call() async {
    // await нужен если с result проводим еще какае-то действия перед возвратом
    return iTopRateRepo.getTopRateResult();
  }
}
