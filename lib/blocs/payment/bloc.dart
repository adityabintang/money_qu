import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_qu/blocs/payment/bloc_event.dart';
import 'package:money_qu/blocs/payment/bloc_state.dart';
import 'package:money_qu/blocs/payment/repository.dart';

class PaymentMethodBloc extends Bloc<PaymentMethodEvent, PaymentMethodState> {
  PaymentMethodBloc() : super(PaymentMethodInitial()) {
    on<PaymentMethodEvent>((event, emit) async {
      if (event is PaymentMethodFetch) {
        try {
          emit(PaymentMethodLoading());
          final res = await PaymentMethodRepo().fetchPaymentMethod();
          emit(PaymentMethodLoaded(res));
        } catch (e) {
          print(e);
          emit(PaymentMethodFailure(e.toString()));
        }
      }
    });
  }
}
