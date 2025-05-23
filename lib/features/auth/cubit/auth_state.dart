part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState {}

final class AuthError extends AuthState {
  AuthError({required this.message});
  final String message;
}

final class AuthLoading extends AuthState {}



