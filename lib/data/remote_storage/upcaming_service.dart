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

//
// import 'package:dio/dio.dart';
// import 'package:movie_search/util/constants.dart';
// import 'package:movie_search/domain/entity/movie/movie.dart';
//
// import '../network_service/network_service.dart';
//
// Future<Response?> get(
//     String path, {
//       Map<String, dynamic>? queryParameters,
//     }) async {
//   try {
//     Response response = await NetworkService.instance.dio
//         .get('$kBaseUrl$path', queryParameters: queryParameters);
//     return response;
//   } catch (e) {
//     print('Error in get method: $e');
//     return null;
//   }
// }
//
// final class UpcomingService {
//   Future<
//       ({
//       bool isSuccess,
//       List<Movie>? movies,
//       String? error,
//       })> getUpcomingResult() async {
//     try {
//       Response? response = await get('/movie/upcoming', queryParameters: {
//         "api_key": kApiKey,
//       });
//
//       if (response == null) {
//         return (
//         isSuccess: false,
//         movies: null,
//         error: 'Response is null'
//         );
//       }
//
//       var result = response.data as Map<String, dynamic>;
//       List<dynamic> moviesInJson = result['results'];
//       List<Movie> movies = moviesInJson
//           .map((e) => Movie.fromJson(e as Map<String, dynamic>))
//           .toList();
//
//       return (isSuccess: true, movies: movies, error: null);
//     } on DioException catch (e) {
//       final errorResult = e.response?.data as Map<String, dynamic>?;
//       return (
//       isSuccess: false,
//       movies: null,
//       error: errorResult?['status_message']?.toString() ?? 'Unknown error occurred in upcoming service'
//       );
//     } catch (e) {
//       print('Unknown error: $e');
//       return (
//       isSuccess: false,
//       movies: null,
//       error: 'An unexpected error occurred'
//       );
//     }
//   }
// }
