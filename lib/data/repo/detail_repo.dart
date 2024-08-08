import 'package:movie_search/data/remote_storage/detail_service.dart';
import 'package:movie_search/domain/entity/movie/movie.dart';
import 'package:movie_search/domain/repo/i_detail_repo.dart';

class DetailRepo implements IDetailRepo {
  final DetailService detailService;

  DetailRepo(this.detailService);

  @override
  Future<
      ({
        String? error,
        bool isSuccess,
        Movie? movie,
      })> getDetailResult(int movieId) {
    return detailService.getDetailResult(movieId);
  }
}
