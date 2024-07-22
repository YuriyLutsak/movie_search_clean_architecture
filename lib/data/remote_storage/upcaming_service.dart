import 'package:dio/dio.dart';
import 'package:movie_search/util/constants.dart';
import 'package:movie_search/data/network_service/movie_search_api_service.dart';
import 'package:movie_search/domain/entity/movie/movie.dart';

final class UpcomingService {
  Future<
      ({
        bool isSuccess,
        List<Movie>? movies,
        String? error,
      })> getUpcomingResult() async {
    try {
      Response? response = await get('/movie/upcoming', queryParameters: {
        "api_key": kApiKey,
      });

      var result = response!.data as Map<String, dynamic>;
      List<dynamic> moviesInJson = result['results'];
      List<Movie> movies = moviesInJson
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList();

      return (isSuccess: true, movies: movies, error: null);
    } on DioException catch (e) {
      final errorResult = e.response?.data as Map<String, dynamic>;
      return (
        isSuccess: false,
        movies: null,
        error: errorResult['status_message']?.toString() ?? 'Unknown error occurred in upcoming service'
      );
    }
  }
}