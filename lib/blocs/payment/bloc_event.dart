import 'package:equatable/equatable.dart';

abstract class PaymentMethodEvent extends Equatable{
  const PaymentMethodEvent();


  @override
  List<Object> get props => [];
}

class PaymentMethodFetch extends PaymentMethodEvent{}