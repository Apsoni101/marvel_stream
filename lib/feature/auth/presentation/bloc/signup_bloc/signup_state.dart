part of 'signup_bloc.dart';

@immutable
sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object?> get props => <Object?>[];
}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {}

final class SignupUser extends SignupState {
  const SignupUser({
    required this.email,
    required this.password,
    required this.passwordValid,
    required this.emailValid,
  });

  factory SignupUser.initial() => const SignupUser(
    email: '',
    password: '',
    passwordValid: true,
    emailValid: true,
  );

  final String email;
  final String password;
  final bool passwordValid;
  final bool emailValid;

  SignupUser copyWith({
    final String? email,
    final String? password,
    final bool? passwordValid,
    final bool? emailValid,
  }) => SignupUser(
    email: email ?? this.email,
    password: password ?? this.password,
    passwordValid: passwordValid ?? this.passwordValid,
    emailValid: emailValid ?? this.emailValid,
  );

  @override
  List<Object?> get props => <Object?>[
    email,
    password,
    passwordValid,
    emailValid,
  ];
}

final class SignupError extends SignupState {
  const SignupError({required this.message});

  final String message;

  @override
  List<Object?> get props => <Object?>[message];
}