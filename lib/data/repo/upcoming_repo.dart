import 'package:movie_search/data/remote_storage/upcaming_service.dart';
import 'package:movie_search/domain/entity/movie/movie.dart';
import 'package:movie_search/domain/repo/i_upcoming_repo.dart';

class UpcomingRepo implements IUpcomingRepo {
  final UpcomingService upcomingService;

  UpcomingRepo(this.upcomingService);

  @override
  Future<
      ({
        String? error,
        bool isSuccess,
        List<Movie>? movies,
      })> getUpcomingResult() async {
    return upcomingService.getUpcomingResult();
  }
}
