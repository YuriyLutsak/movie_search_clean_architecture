import 'package:movie_search/data/remote_storage/search_service.dart';
import 'package:movie_search/domain/entity/movie/movie.dart';
import 'package:movie_search/domain/repo/i_search_repo.dart';

class SearchRepo implements ISearchRepo {
  final SearchService searchService;

  SearchRepo(this.searchService);

  @override
  Future<
      ({
        String? error,
        bool isSuccess,
        List<Movie>? movies,
      })> getSearchResult(String query) {
    return searchService.getSearchResult(query);
  }
}
