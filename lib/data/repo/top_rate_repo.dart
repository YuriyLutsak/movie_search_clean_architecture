import 'package:movie_search/data/remote_storage/top_rate_service.dart';
import 'package:movie_search/domain/entity/movie/movie.dart';

import '../../domain/repo/i_top_rate_repo.dart';

class TopRateRepo implements ITopRateRepo {
  final TopRateService topRateService;

  TopRateRepo(this.topRateService);

  @override
  Future<
      ({
        String? error,
        bool isSuccess,
        List<Movie>? movies,
      })> getTopRateResult() {
    return topRateService.getTopRateResult();
  }
}
