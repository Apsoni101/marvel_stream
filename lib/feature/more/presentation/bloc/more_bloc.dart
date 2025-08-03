import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_stream/core/services/error/failure.dart';
import 'package:marvel_stream/feature/more/domain/use_cases/more_usecase.dart';

part 'more_event.dart';
part 'more_state.dart';

class MoreBloc extends Bloc<MoreEvent, MoreState> {

  MoreBloc({required this.moreRepositoryUseCase}) : super(MoreInitial()) {
    on<SignOutRequested>(_onSignOutRequested);
  }
  final MoreRepositoryUseCase moreRepositoryUseCase;

  Future<void> _onSignOutRequested(
      final SignOutRequested event,
      final Emitter<MoreState> emit,
      ) async {
    emit(SignOutInProgress());
    final Either<Failure, Unit> result = await moreRepositoryUseCase.signOut();
    result.fold(
          (final Failure failure) => emit(SignOutFailure(failure)),
          (_) => emit(SignOutSuccess()),
    );
  }
}
