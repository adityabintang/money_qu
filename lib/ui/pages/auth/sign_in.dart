// ignore_for_file: prefer_const_constructors

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_qu/models/sign_in_form_model.dart';
import 'package:money_qu/ui/pages/auth/blocs/bloc.dart';
import 'package:money_qu/ui/pages/auth/blocs/bloc_event.dart';
import 'package:money_qu/ui/pages/auth/blocs/bloc_state.dart';
import 'package:money_qu/ui/pages/auth/sign_up.dart';
import 'package:money_qu/ui/pages/main_apps/home/home.dart';
import 'package:money_qu/ui/widget/buttons_widget.dart';
import 'package:money_qu/ui/widget/form_field_widget.dart';
import '../../../utils/my_import.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool obsecureText = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwdController = TextEditingController();

  void goSignUp() => goTo(SignUpPage(), context);

  void goHome() {
    if (validate()) {
      context.read<AuthBloc>().add(AuthLogin(
            SignInFormModel(
              email: emailController.text,
              password: passwdController.text
            ),
          ));
    }else{
      showCustomSnackBar(context, 'Email dan Password invalid atau tidak boleh kosong');
    }
  }

  bool validate() {
    if (emailController.text.isEmpty || passwdController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            goAll(const HomePage(), context);
          }
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
          'Sign In &\nGrow Your Finance',
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
                height: 8.h,
              ),

              ///Button Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: MyColors.blue,
                    fontFamily: Font.poppins,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),

              ///Button Sign In
              CustomButtonWidget(
                textButton: 'Sign In',
                onPressed: goHome,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50.h,
        ),

        ///Create New Account
        CustomTextButtonWidget(
          textButton: 'Create New Account',
          onPressed: goSignUp,
        ),
        SizedBox(
          height: 25.h,
        ),
      ],
    );
  }
}
