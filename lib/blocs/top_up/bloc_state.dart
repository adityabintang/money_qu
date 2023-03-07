import 'package:equatable/equatable.dart';

abstract class TopUpState extends Equatable {
  const TopUpState();

  @override
  List<Object> get props => [];
}

class TopUpInitial extends TopUpState {
  @override
  String toString() => 'TopUpInitial';
}

class TopUpLoading extends TopUpState{}

class TopUpFailure extends TopUpState {
  final String error;

  const TopUpFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'Failure { items: $error }';
}


class TopUpLoaded extends TopUpState {
  final String redirectUrl;

  const TopUpLoaded(this.redirectUrl);

  @override
  List<Object> get props => [redirectUrl];
}