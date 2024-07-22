import 'package:dio/dio.dart';

final class NetworkService {
  NetworkService._() {
    dio = Dio();
  }

  late final Dio dio;
  static final NetworkService instance = NetworkService._();
}