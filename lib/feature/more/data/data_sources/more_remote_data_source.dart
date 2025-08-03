import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:marvel_stream/core/services/error/failure.dart';
import 'package:marvel_stream/core/services/firebase/firebase_auth_service.dart';

sealed class MoreRemoteDataSource {
  Future<Either<Failure, Unit>> signOut();
}

class MoreRemoteDataSourceImpl implements MoreRemoteDataSource {
  const MoreRemoteDataSourceImpl({required this.firebaseAuthService});

  final FirebaseAuthService firebaseAuthService;

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await firebaseAuthService.signOut();
      return const Right<Failure, Unit>(unit);
    } on FirebaseAuthException catch (e) {
      return Left<Failure, Unit>(
        Failure(e.message ?? 'Sign out failed', errorCode: e.code),
      );
    } on Exception catch (e) {
      return Left<Failure, Unit>(Failure('Unexpected error: $e'));
    }
  }
}
