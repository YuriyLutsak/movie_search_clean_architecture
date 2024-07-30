import 'package:movie_search/domain/entity/movie/movie.dart';
import 'package:movie_search/domain/repo/i_search_repo.dart';

abstract interface class ISearchUsecase {
  Future<
      ({
        bool isSuccess,
        List<Movie>? movies,
        String? error,
      })> call(String query);
}

class SearchUsecase implements ISearchUsecase {
  final ISearchRepo searchRepo;

  SearchUsecase(this.searchRepo);

  @override
  Future<
      ({
        String? error,
        bool isSuccess,
        List<Movie>? movies,
      })> call(String query) {
    return searchRepo.getSearchResult(query);
    // await nе нужен если сразу возвращаем результат
  }
}
