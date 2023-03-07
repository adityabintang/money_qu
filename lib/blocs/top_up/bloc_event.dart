import 'package:equatable/equatable.dart';
import 'package:money_qu/models/top_up_model.dart';

abstract class TopUpEvent extends Equatable {
  const TopUpEvent();

  @override
  List<Object> get props => [];
}

class TopUpFetch extends TopUpEvent{
  final TopUpModel data;

  const TopUpFetch(this.data);

  @override
  List<Object> get props => [data];
}
