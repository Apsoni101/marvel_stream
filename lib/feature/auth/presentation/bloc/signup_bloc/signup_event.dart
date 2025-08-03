part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object?> get props => <Object?>[];
}

final class EmailChanged extends SignupEvent {
  const EmailChanged({required this.email});

  final String email;

  @override
  List<Object?> get props => <String?>[email];
}

final class PasswordChanged extends SignupEvent {
  const PasswordChanged({required this.password});

  final String password;

  @override
  List<Object?> get props => <String?>[password];
}

class ValidateAndSignup extends SignupEvent {
  const ValidateAndSignup({required this.email, required this.password});

  final String email;
  final String password;
}

class ResetValidationErrors extends SignupEvent {}

final class OnGoogleSignupEvent extends SignupEvent {
  const OnGoogleSignupEvent();

  @override
  List<Object?> get props => <Object>[];
}

class LogoutEvent extends SignupEvent {
  const LogoutEvent();
}
