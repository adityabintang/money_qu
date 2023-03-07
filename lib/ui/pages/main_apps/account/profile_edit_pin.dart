import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_qu/ui/pages/auth/blocs/bloc.dart';
import 'package:money_qu/ui/pages/auth/blocs/bloc_event.dart';
import 'package:money_qu/ui/pages/auth/blocs/bloc_state.dart';
import 'package:money_qu/ui/pages/main_apps/account/profile_edit_success.dart';

import '../../../../utils/my_import.dart';
import '../../../widget/buttons_widget.dart';
import '../../../widget/form_field_widget.dart';

class ProfileEditPin extends StatefulWidget {
  const ProfileEditPin({Key? key}) : super(key: key);

  @override
  State<ProfileEditPin> createState() => _ProfileEditPinState();
}

class _ProfileEditPinState extends State<ProfileEditPin> {
  final oldPinController = TextEditingController(text: '');
  final newPinController = TextEditingController(text: '');

  String pin = '';

  @override
  void initState() {
    super.initState();
    final authstate = context.read<AuthBloc>().state;
    if (authstate is AuthSuccess) {
      pin = authstate.user.pin!;
      print('PIN: $pin');
    }
  }

  void pinvalidation(){
    if (oldPinController.text.isNotEmpty ||
        oldPinController.text.length == 6) {
      if (oldPinController.text == pin) {
        context.read<AuthBloc>().add(UpdatePin(
            oldPinController.text, newPinController.text));
      } else {
        showCustomSnackBar(
            context, 'Old Pin yang dimasukkan salah');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              goBack(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
            ),
          ),
          title: const Text(
            'Edit PIN',
          ),
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return _buildBody();
          },
          listener: (context, state) {
            if (state is AuthFailure) {
              showCustomSnackBar(context, state.error);
            }
            if (state is AuthSuccess) {
              goAll(const ProfileEditSuccess(), context);
            }
          },
        ));
  }

  Widget _buildBody() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24).r,
      children: [
        SizedBox(
          height: 30.h,
        ),
        Container(
          padding: EdgeInsets.all(22).r,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20).r, color: MyColors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFormFieldWidget(
                textField: 'Old PIN',
                keyboardType: TextInputType.number,
                controller: oldPinController,
                obsecureText: true,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomFormFieldWidget(
                textField: 'New PIN',
                keyboardType: TextInputType.number,
                obsecureText: true,
                controller: newPinController,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomButtonWidget(
                textButton: 'Update Now',
                onPressed: pinvalidation,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50.h,
        ),
      ],
    );
  }
}
