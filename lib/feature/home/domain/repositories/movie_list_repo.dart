import 'package:dartz/dartz.dart';
import 'package:marvel_stream/core/services/error/failure.dart';
import 'package:marvel_stream/feature/home/domain/entities/movie_entity.dart';

abstract class MovieListRepository {
  Future<Either<Failure, List<MovieEntity>>> getAllMovies();
}
