import 'package:dartz/dartz.dart';
import 'package:marvel_stream/core/services/error/failure.dart';
import 'package:marvel_stream/core/services/networking/network_constants.dart';
import 'package:marvel_stream/core/services/networking/network_service.dart';
import 'package:marvel_stream/feature/home/data/models/movie_model.dart';

abstract class MovieListRemoteDataSource {
  Future<Either<Failure, List<MovieItemModel>>> getAllMovies();
}

class MovieListRemoteDataSourceImpl implements MovieListRemoteDataSource {
  MovieListRemoteDataSourceImpl({required this.networkService});

  final NetworkService networkService;

  @override
  Future<Either<Failure, List<MovieItemModel>>> getAllMovies() =>
      networkService.getPath<List<MovieItemModel>>(
        NetworkConstants.movies,
        parser: (final dynamic data) {
          final List<dynamic> dataList = data['data'];
          final List<Map<String, dynamic>> list =
              List<Map<String, dynamic>>.from(dataList);
          return list.map(MovieItemModel.fromJson).toList();
        },
      );
}
