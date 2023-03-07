import 'package:equatable/equatable.dart';
import 'package:money_qu/models/payment_method_model.dart';

abstract class PaymentMethodState extends Equatable {
  const PaymentMethodState();

  @override
  List<Object> get props => [];
}

class PaymentMethodInitial extends PaymentMethodState {
  @override
  String toString() => 'PaymentMethodInitial';
}

class PaymentMethodLoading extends PaymentMethodState {}

class PaymentMethodFailure extends PaymentMethodState {
  final String error;

  const PaymentMethodFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'Failure { items: $error }';
}

class PaymentMethodLoaded extends PaymentMethodState {
  final List<PaymentMethod> data;

  const PaymentMethodLoaded(this.data);

  @override
  List<Object> get props => [data];
}
