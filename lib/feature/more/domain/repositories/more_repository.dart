import 'package:dartz/dartz.dart';
import 'package:marvel_stream/core/services/error/failure.dart';

abstract class MoreRepository {
  Future<Either<Failure, Unit>> signOut();
}