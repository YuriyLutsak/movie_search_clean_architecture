import 'package:dio/dio.dart';
import 'package:movie_search/util/constants.dart';
import 'package:movie_search/data/network_service/network_service.dart';

Future<Response?> get(
  String path, {
  Map<String, dynamic>? queryParameters,
}) async {
  Response response = await NetworkService.instance.dio
      .get('$kBaseUrl$path', queryParameters: queryParameters);
}
