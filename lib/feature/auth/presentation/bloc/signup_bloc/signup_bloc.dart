import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_stream/core/extensions/string_extensions.dart';
import 'package:marvel_stream/core/services/error/failure.dart' show Failure;
import 'package:marvel_stream/feature/auth/domain/entities/user_entity.dart';
import 'package:marvel_stream/feature/auth/domain/use_cases/auth_usecase.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc({required this.authUseCase}) : super(SignupUser.initial()) {
    on<EmailChanged>(_emailChanged);
    on<PasswordChanged>(_passwordChanged);
    on<ResetValidationErrors>(_resetValidationErrors);
    on<ValidateAndSignup>(_validateAndSignup);
  }

  final AuthUseCase authUseCase;

  Future<void> _emailChanged(
    final EmailChanged event,
    final Emitter<SignupState> emit,
  ) async {
    final SignupState currentState = state;
    if (currentState is SignupUser) {
      final String newEmail = event.email.trim();
      final bool isValid = newEmail.isNotEmpty;
      final bool showError = !isValid && newEmail != currentState.email;

      emit(
        currentState.copyWith(
          emailValid: !showError, // Valid if we shouldn't show error
          email: newEmail,
        ),
      );
    }
  }

  Future<void> _passwordChanged(
    final PasswordChanged event,
    final Emitter<SignupState> emit,
  ) async {
    final SignupState currentState = state;
    if (currentState is SignupUser) {
      final bool isValid = event.password.trim().isNotEmpty;
      emit(
        currentState.copyWith(
          passwordValid: isValid,
          password: event.password.trim(),
        ),
      );
    }
  }

  Future<void> _resetValidationErrors(
    final ResetValidationErrors event,
    final Emitter<SignupState> emit,
  ) async {
    if (state is SignupUser) {
      emit(
        (state as SignupUser).copyWith(emailValid: true, passwordValid: true),
      );
    }
  }

  Future<void> _validateAndSignup(
    final ValidateAndSignup event,
    final Emitter<SignupState> emit,
  ) async {
    final SignupState currentState = state;
    if (currentState is SignupUser) {
      final String email = currentState.email;
      final String password = currentState.password;
      final bool emailValid = email.isValidEmail;
      final bool passwordValid = password.isValidPassword;

      if (!emailValid || !passwordValid) {
        emit(
          currentState.copyWith(
            email: email,
            password: password,
            emailValid: email.isNotEmpty,
            passwordValid: password.isNotEmpty,
          ),
        );
        return;
      }

      emit(SignupLoading());

      final Either<Failure, UserEntity> result = await authUseCase
          .signUpWithEmail(email, password);

      result.fold(
        (final Failure failure) => emit(SignupError(message: failure.message)),
        (final _) => emit(SignupSuccess()),
      );
    }
  }
}
