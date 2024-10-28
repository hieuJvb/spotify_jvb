
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String message;

  const AuthSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class AuthFailure extends AuthState {
  final String message;

  const AuthFailure(this.message);

  @override
  List<Object> get props => [message];
}

class AuthPasswordVisibilityChanged extends AuthState {
  final bool isPasswordVisible;

  AuthPasswordVisibilityChanged(this.isPasswordVisible);

  @override
  List<Object> get props => [isPasswordVisible];
}
