import 'package:movie_search/domain/entity/movie/movie.dart';
import 'package:movie_search/domain/repo/i_upcoming_repo.dart';

abstract interface class IUpcomingUsecase {
  Future<
      ({
        bool isSuccess,
        List<Movie>? movies,
        String? error,
      })> call();
}

class UpcomingUsecase implements IUpcomingUsecase {
  final IUpcomingRepo iUpcomingRepo;

  UpcomingUsecase(this.iUpcomingRepo);

  @override
  Future<
      ({
        String? error,
        bool isSuccess,
        List<Movie>? movies,
      })> call() async {
    return iUpcomingRepo.getUpcomingResult(); // await nе нужен
  }
}
