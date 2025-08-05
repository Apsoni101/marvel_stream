import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marvel_stream/core/services/error/failure.dart';
import 'package:marvel_stream/core/services/networking/api_client.dart';

class NetworkService {
  NetworkService({required this.apiClient});

  final ApiClient apiClient;

  Future<Either<Failure, T>> getPath<T>(
      final String path, {
        required final T Function(dynamic data) parser,
        final Map<String, dynamic>? queryParams,
      }) async {
    try {
      final Response<dynamic> response = await apiClient.dio.get(
        path,
        queryParameters: queryParams,
      );

      final Failure? statusFailure = _handleStatusCode(response.statusCode);
      if (statusFailure != null) {
        return Left<Failure, T>(statusFailure);
      }

      final Failure? dataFailure = _validateResponseData(response.data);
      if (dataFailure != null) {
        return Left<Failure, T>(dataFailure);
      }

      if (response.data == null) {
        return Left<Failure, T>(Failure("Response data is null"));
      }

      try {
        final parsedData = parser(response.data);
        return Right<Failure, T>(parsedData);
      }on Exception catch (e) {
        return Left<Failure, T>(Failure("Failed to parse response: $e"));
      }
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

  Failure? _validateResponseData(final dynamic data) {
    if (data == null) {
      return Failure("Response data is null");
    }

    if (data is Map && data.isEmpty) {
      return Failure("Response data is empty");
    }

    if (data is String && data.trim().isEmpty) {
      return Failure("Response data is empty string");
    }

    if (data is Map) {
      if (data.containsKey('data')) {
        final dynamic marvelData = data['data'];
        if (marvelData == null) {
          return Failure("Marvel API data is null");
        }

        if (marvelData is Map) {
          if (marvelData.containsKey('results')) {
            final results = marvelData['results'];
            if (results == null) {
              return Failure("Marvel API results is null");
            }
            if (results is List && results.isEmpty) {
              return Failure("No results found");
            }
          }
        }
      }

      if (data.containsKey('code')) {
        final int? code = data['code'];
        if (code != null && code != 200) {
          final dynamic status = data['status'] ?? 'Unknown error';
          return Failure("API Error ($code): $status");
        }
      }
    }

    return null;
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
