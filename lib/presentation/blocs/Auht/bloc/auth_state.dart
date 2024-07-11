part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {
  final User user;

  AuthLoaded({required this.user});
}

class AuthError extends AuthState {
  final String errorMessage;

  AuthError({required this.errorMessage});
}
