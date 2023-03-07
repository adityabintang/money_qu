import 'package:equatable/equatable.dart';
import 'package:money_qu/models/edit_profile_model.dart';
import 'package:money_qu/models/sign_in_form_model.dart';
import 'package:money_qu/models/sign_up_model.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthFetch extends AuthEvent {
  final String email;

  const AuthFetch(this.email);

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'AuthFetch { email: $email }';
}

class AuthRegister extends AuthEvent {
  final SignUpModel data;

  const AuthRegister(this.data);

  @override
  List<Object> get props => [data];
}

class AuthLogin extends AuthEvent {
  final SignInFormModel data;

  const AuthLogin(this.data);

  @override
  List<Object> get props => [data];
}

class AuthGetCurrentUser extends AuthEvent {}

class UpdateUser extends AuthEvent {
  final EditProfileModel data;

  const UpdateUser(this.data);

  @override
  List<Object> get props => [data];

  @override
  String toString() => 'UpdateUser { data: $data }';
}

class AuthUpdateBalance extends AuthEvent{
  final int amount;

  const AuthUpdateBalance(this.amount);

  @override
  List<Object> get props => [amount];
}

class UpdatePin extends AuthEvent {
  final String oldPin;
  final String newPin;

  const UpdatePin(this.oldPin, this.newPin);

  @override
  List<Object> get props => [oldPin, newPin];

  @override
  String toString() => 'UpdatePin { oldpin: $oldPin, newPin: $newPin }';
}

class Logout extends AuthEvent {}
