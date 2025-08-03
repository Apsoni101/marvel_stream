import 'package:dartz/dartz.dart';
import 'package:marvel_stream/core/services/error/failure.dart';
import 'package:marvel_stream/feature/home/domain/entities/movie_entity.dart';
import 'package:marvel_stream/feature/home/domain/repositories/movie_list_repo.dart';

class MoviesUseCase {
  MoviesUseCase({required this.repository});

  final MovieListRepository repository;

  Future<Either<Failure, List<MovieEntity>>> getAllMovies() =>
      repository.getAllMovies();
}
