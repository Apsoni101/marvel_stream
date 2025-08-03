import 'package:dartz/dartz.dart';
import 'package:marvel_stream/core/services/error/failure.dart';
import 'package:marvel_stream/feature/home/data/data_sources/movie_data_source.dart';
import 'package:marvel_stream/feature/home/domain/entities/movie_entity.dart';
import 'package:marvel_stream/feature/home/domain/repositories/movie_list_repo.dart';

class MovieListRepositoryImpl implements MovieListRepository {
  MovieListRepositoryImpl({required this.remoteDataSource});

  final MovieListRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<MovieEntity>>> getAllMovies() =>
      remoteDataSource.getAllMovies();
}
