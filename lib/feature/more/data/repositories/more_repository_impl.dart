import 'package:dartz/dartz.dart';
import 'package:marvel_stream/core/services/error/failure.dart';
import 'package:marvel_stream/feature/more/data/data_sources/more_remote_data_source.dart';
import 'package:marvel_stream/feature/more/domain/repositories/more_repository.dart';

class MoreRepositoryImpl implements MoreRepository {

  const MoreRepositoryImpl({required this.remoteDataSource});
  final MoreRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, Unit>> signOut() => remoteDataSource.signOut();
}
