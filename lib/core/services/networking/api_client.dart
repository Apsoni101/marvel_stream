import 'package:dio/dio.dart';
import 'package:marvel_stream/core/services/networking/network_constants.dart';

class ApiClient {
  ApiClient({
    final String? baseUrl,
    final Duration? connectTimeout,
    final Duration? receiveTimeout,
    final Dio? dio,
  }) : dio =
           dio ??
           _createDio(
             baseUrl ?? NetworkConstants.baseUrlMovies,
             connectTimeout ?? NetworkConstants.connectTimeout,
             receiveTimeout ?? NetworkConstants.receiveTimeout,
           );

  factory ApiClient.marvelMovie() =>
      ApiClient(baseUrl: NetworkConstants.baseUrlMovies);

  factory ApiClient.marvelComics() =>
      ApiClient(baseUrl: NetworkConstants.baseUrlComics);

  final Dio dio;

  static Dio _createDio(
    final String baseUrl,
    final Duration connectTimeout,
    final Duration receiveTimeout,
  ) {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
      ),
    );

    dio.interceptors.add(
      LogInterceptor(responseBody: true, requestBody: true, error: true),
    );

    return dio;
  }
}
