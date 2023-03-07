import 'package:bloc/bloc.dart';
import 'package:money_qu/models/sign_in_form_model.dart';
import 'package:money_qu/models/user_model.dart';
import 'package:money_qu/services/auth.dart';
import 'package:money_qu/ui/pages/auth/blocs/bloc_event.dart';
import 'package:money_qu/ui/pages/auth/blocs/bloc_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthFetch) {
        try {
          emit(AuthLoading());
          final res = await Auth().checkEmail(event.email);

          if (res == false) {
            emit(AuthCheckEmail());
          } else {
            emit(const AuthFailure('Email Sudah Terpakai'));
          }
        } catch (e) {
          emit(AuthFailure(e.toString()));
        }
      }
      if (event is AuthRegister) {
        try {
          emit(AuthLoading());
          final user = await Auth().postRegister(event.data);
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailure(e.toString()));
        }
      }

      if (event is AuthLogin) {
        try {
          emit(AuthLoading());
          final user = await Auth().login(event.data);
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailure(e.toString()));
        }
      }

      if (event is AuthGetCurrentUser) {
        try {
          emit(AuthLoading());
          final SignInFormModel data = await Auth().getCredentialUser();
          final UserModel user = await Auth().login(data);
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailure(e.toString()));
        }
      }

      if (event is UpdateUser) {
        try {
          if (state is AuthSuccess) {
            final updatedUser = (state as AuthSuccess).user.copyWith(
                  username: event.data.username,
                  email: event.data.email,
                  name: event.data.name,
                  password: event.data.password,
                );
            emit(AuthLoading());
            await auth.updateUser(event.data);

            emit(AuthSuccess(updatedUser));
          }
        } catch (e) {
          emit(AuthFailure(e.toString()));
        }
      }
      if (event is UpdatePin) {
        try {
          if (state is AuthSuccess) {
            final updatedUser =
                (state as AuthSuccess).user.copyWith(pin: event.newPin);
            emit(AuthLoading());
            await auth.updatePIN(event.oldPin, event.newPin);

            emit(AuthSuccess(updatedUser));
          }
        } catch (e) {
          emit(AuthFailure(e.toString()));
        }
      }
      if (event is Logout) {
        try {
          emit(AuthLoading());
          await auth.logOut();

          emit(AuthInitial());
        } catch (e) {
          emit(AuthFailure(e.toString()));
        }
      }

      if (event is AuthUpdateBalance) {
        if (state is AuthSuccess) {
          final currentUser = (state as AuthSuccess).user;
          final updatedUser = currentUser.copyWith(
              balance: currentUser.balance! + event.amount);

          emit(AuthSuccess(updatedUser));
        }
      }
    });
  }
}
