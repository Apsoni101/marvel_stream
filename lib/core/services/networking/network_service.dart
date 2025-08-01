import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marvel_stream/core/services/error/failure.dart';
import 'package:marvel_stream/core/services/networking/network_constants.dart';

class NetworkService {
  NetworkService({final Dio? dio})
    : dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: NetworkConstants.baseUrl,
              receiveTimeout: NetworkConstants.receiveTimeout,
              connectTimeout: NetworkConstants.connectTimeout,
            ),
          ) {
    this.dio.interceptors.add(LogInterceptor(responseBody: true,requestBody: true,error: true));
  }

  final Dio dio;

  Future<Either<Failure, T>> getPath<T>(
      final String path, {
        required final T Function(dynamic data) parser,
        final Map<String, dynamic>? queryParams,
      }) async {
    try {
      final Response<dynamic> response = await dio.get(
        path,
        queryParameters: queryParams,
      );

      final Failure? failure = _handleStatusCode(response.statusCode);
      if (failure != null) {
        return Left<Failure, T>(failure);
      }

      final T parsedData = parser(response.data);
      return Right<Failure, T>(parsedData);
    } on DioException catch (e) {
      return Left<Failure, T>(_handleDioError(e));
    } on Exception catch (e) {
      return Left<Failure, T>(Failure("Unexpected error: $e"));
    }
  }


  Failure? _handleStatusCode(final int? statusCode) {
    switch (statusCode) {
      case 200:
      case 201:
        return null;
      case 400:
        return Failure("Bad Request");
      case 401:
        return Failure("Unauthorized");
      case 403:
        return Failure("Forbidden");
      case 404:
        return Failure("Not Found");
      case 500:
        return Failure("Internal Server Error");
      default:
        return Failure("Unexpected error: $statusCode");
    }
  }

  Failure _handleDioError(final DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return Failure("Connection Timeout");
      case DioExceptionType.receiveTimeout:
        return Failure("Receive Timeout");
      case DioExceptionType.sendTimeout:
        return Failure("Send Timeout");
      case DioExceptionType.badResponse:
        return Failure("Bad Response: ${e.response?.statusCode ?? 'Unknown'}");
      case DioExceptionType.cancel:
        return Failure("Request Cancelled");
      case DioExceptionType.unknown:
        return Failure("Unknown Error: ${e.message}");
      case DioExceptionType.badCertificate:
        return Failure("Bad certificate: ${e.message}");
      case DioExceptionType.connectionError:
        return Failure("Connection Error: ${e.message}");
    }
  }
}
