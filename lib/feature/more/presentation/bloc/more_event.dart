part of 'more_bloc.dart';

sealed class MoreEvent extends Equatable {
  const MoreEvent();

  @override
  List<Object> get props => <Object>[];
}

class SignOutRequested extends MoreEvent {
  const SignOutRequested();
}
