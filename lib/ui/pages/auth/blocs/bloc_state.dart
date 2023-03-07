import 'package:equatable/equatable.dart';
import 'package:money_qu/models/user_model.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  @override
  String toString() => 'AuthInitial';
}

class AuthLoading extends AuthState {}

class AuthFailure extends AuthState {
  final String error;

  const AuthFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'Failure { items: $error }';
}

class AuthCheckEmail extends AuthState {}

class AuthSuccess extends AuthState{
  final UserModel user;

  const AuthSuccess(this.user);

  @override
  List<Object> get props => [user];
}


