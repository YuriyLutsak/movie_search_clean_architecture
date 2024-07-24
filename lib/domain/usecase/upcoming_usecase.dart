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
   var result = await iUpcomingRepo.getUpcomingResult();
   // await нужен если с result проводим еще какае-то действия перед возвратом
   return result;
  //  return iUpcomingRepo.getUpcomingResult(); // await nе нужен если сразу возвращаем результат
  }
}
