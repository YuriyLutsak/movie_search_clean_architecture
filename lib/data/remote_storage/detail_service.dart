import 'package:dio/dio.dart';
import 'package:movie_search/data/network_service/movie_search_api_service.dart';
import 'package:movie_search/domain/entity/movie/movie.dart';

import '../../util/constants.dart';

final class DetailService {
  Future<
      ({
        bool isSuccess,
        Movie? movie,
        String? error,
      })> getDetailResult(int movieId) async {
    try {
      Response? response = await get('/movie/$movieId', queryParameters: {
        'language': 'en-US',
        "api_key": kApiKey,
      });

      var result = response!.data as Map<String, dynamic>;
      Movie movie = Movie.fromJson(result);

      return (isSuccess: true, movie: movie, error: null);
    } on DioException catch (e) {
      final errorResult = e.response!.data as Map<String, dynamic>;
      return (
        isSuccess: false,
        movie: null,
        error: errorResult['status_message']?.toString() ??
            'Unknown error occurred in detail service'
      );
    }
  }
}
