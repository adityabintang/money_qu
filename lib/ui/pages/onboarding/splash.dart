import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_qu/ui/pages/auth/blocs/bloc.dart';
import 'package:money_qu/ui/pages/auth/blocs/bloc_state.dart';
import 'package:money_qu/ui/pages/main_apps/home/home.dart';
import 'package:money_qu/ui/pages/onboarding/onboarding_pages.dart';

import '../../../utils/my_import.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          goAll(HomePage(), context);
        }

        if (state is AuthFailure) {
          goAll(OnBoardingPage(), context);
        }
      },
      child: Scaffold(
        backgroundColor: MyColors.darkBackground,
        body: Center(
          child: Container(
            width: 155.w,
            height: 50.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.img.imgLogoDark.path),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
