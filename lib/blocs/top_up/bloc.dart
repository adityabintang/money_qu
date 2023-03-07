import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_qu/blocs/top_up/bloc_event.dart';
import 'package:money_qu/blocs/top_up/bloc_state.dart';
import 'package:money_qu/blocs/top_up/repository.dart';

class TopUpBloc extends Bloc<TopUpEvent, TopUpState> {
  TopUpBloc() : super(TopUpInitial()) {
    on<TopUpEvent>((event, emit) async {
      if (event is TopUpFetch) {
        try {
          emit(TopUpLoading());
          final res = await TopUpRepository().fetchTopUp(event.data);
          emit(TopUpLoaded(res));
        } catch (e) {
          print(e);
          emit(TopUpFailure(e.toString()));
        }
      }
    });
  }
}
