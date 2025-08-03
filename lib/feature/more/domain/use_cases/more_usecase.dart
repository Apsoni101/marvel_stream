import 'package:dartz/dartz.dart';
import 'package:marvel_stream/core/services/error/failure.dart';
import 'package:marvel_stream/feature/more/domain/repositories/more_repository.dart';

class MoreRepositoryUseCase {
  const MoreRepositoryUseCase(this.repository);

  final MoreRepository repository;

  Future<Either<Failure, Unit>> signOut()  =>  repository.signOut();
}
