// lib/feature/more/presentation/bloc/more_bloc.dart
part of 'more_bloc.dart';

sealed class MoreState extends Equatable {
  const MoreState();

  @override
  List<Object> get props => <Object>[];
}

final class MoreInitial extends MoreState {}

final class SignOutInProgress extends MoreState {}

final class SignOutSuccess extends MoreState {}

final class SignOutFailure extends MoreState {

  const SignOutFailure(this.failure);
  final Failure failure;

  @override
  List<Object> get props => <Object>[failure];
}
