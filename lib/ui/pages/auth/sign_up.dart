// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_qu/models/sign_up_model.dart';
import 'package:money_qu/ui/pages/auth/blocs/index.dart';
import 'package:money_qu/ui/pages/auth/sign_in.dart';
import 'package:money_qu/ui/pages/auth/set_profile.dart';

import '../../../utils/my_import.dart';
import '../../widget/buttons_widget.dart';
import '../../widget/form_field_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool obsecureText = true;

  bool validate() {
    if (emailController.text.isEmpty ||
        passwdController.text.isEmpty ||
        fullNameController.text.isEmpty) {
      return false;
    }
    return true;
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwdController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  void goSignIn() => goTo(const SignInPage(), context);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            showCustomSnackBar(context, state.error);
          }
          if (state is AuthCheckEmail) {
            goTo(
                SetProfilePage(
                  data: SignUpModel(
                    name: fullNameController.text,
                    email: emailController.text,
                    password: passwdController.text,
                    pin: '',
                  ),
                ),
                context);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return _buildBody();
        },
      ),
    );
  }

  Widget _buildBody() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24).r,
      children: [
        Container(
          width: 155.w,
          height: 50.h,
          margin: const EdgeInsets.only(top: 100, bottom: 100).r,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                Assets.img.imgLogoLight.path,
              ),
            ),
          ),
        ),
        Text(
          'Join Us to Unlock\nYour Growth',
          style: TextStyle(
            fontWeight: semiBold,
            fontFamily: Font.poppinsSemiBold,
            fontSize: 20.sp,
          ),
        ),
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
              ///Field Full Name
              CustomFormFieldWidget(
                textField: 'Full Name',
                controller: fullNameController,
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: 16.h,
              ),

              ///Field Email Address
              CustomFormFieldWidget(
                textField: 'Email Address',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 16.h,
              ),

              ///Field Password
              CustomFormFieldWidget(
                textField: 'Password',
                controller: passwdController,
                obsecureText: obsecureText,
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 30.h,
              ),

              ///Button Sign In
              CustomButtonWidget(
                textButton: 'Continue',
                onPressed: () {
                  if (validate()) {
                    context.read<AuthBloc>()
                      ..add(AuthFetch(emailController.text));
                  } else {
                    showCustomSnackBar(context, 'Semua field harus diisi');
                  }
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50.h,
        ),

        ///Create New Account
        CustomTextButtonWidget(
          textButton: 'Sign In',
          onPressed: goSignIn,
        ),
        SizedBox(
          height: 50.h,
        ),
      ],
    );
  }
}
