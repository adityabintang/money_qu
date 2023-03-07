import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_qu/ui/pages/auth/blocs/bloc.dart';
import 'package:money_qu/ui/pages/auth/blocs/bloc_state.dart';
import 'package:money_qu/ui/widget/input_number_widget.dart';
import '../../../../utils/my_import.dart';

class PinPages extends StatefulWidget {
  const PinPages({Key? key}) : super(key: key);

  @override
  State<PinPages> createState() => _PinPagesState();
}

class _PinPagesState extends State<PinPages> {
  final TextEditingController pinController = TextEditingController(text: '');
  String pin = '';
  bool isWrongPIN = false;

  addPin(String? number) {
    if (pinController.text.length < 6) {
      setState(() {
        pinController.text = pinController.text + number!;
      });
    }
    if (pinController.text.length == 6) {
      if (pinController.text == pin) {
        Navigator.pop(context, true);
      } else {
        setState(() {
          isWrongPIN = true;
        });
        showCustomSnackBar(
            context, 'PIN yang anda masukkan salah. Silakan coba lagi.');
      }
    }
  }

  deleteNumber() {
    if (pinController.text.isNotEmpty) {
      setState(() {
        isWrongPIN = false;
        pinController.text =
            pinController.text.substring(0, pinController.text.length - 1);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    final authstate = context.read<AuthBloc>().state;
    if (authstate is AuthSuccess) {
      pin = authstate.user.pin!;
      print('PIN: $pin');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkBackground,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 58),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sha PIN',
                style: TextStyle(
                  color: MyColors.white,
                  fontSize: 20.sp,
                  fontWeight: semiBold,
                  fontFamily: Font.poppinsSemiBold,
                ),
              ),
              SizedBox(
                height: 72.h,
              ),
              SizedBox(
                width: 200.w,
                child: TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.none,
                  enabled: false,
                  controller: pinController,
                  cursorColor: MyColors.grey,
                  obscuringCharacter: '*',
                  style: TextStyle(
                      fontFamily: Font.poppinsMedium,
                      fontWeight: medium,
                      color: isWrongPIN ? MyColors.red : MyColors.white,
                      fontSize: 36.sp,
                      letterSpacing: 16.r),
                  decoration: const InputDecoration(
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: MyColors.grey),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 66.h,
              ),
              Wrap(
                spacing: 40,
                runSpacing: 40,
                children: [
                  InputNumberButton(
                    onTap: () {
                      addPin('1');
                    },
                    title: '1',
                  ),
                  InputNumberButton(
                    onTap: () {
                      addPin('2');
                    },
                    title: '2',
                  ),
                  InputNumberButton(
                    onTap: () {
                      addPin('3');
                    },
                    title: '3',
                  ),
                  InputNumberButton(
                    onTap: () {
                      addPin('4');
                    },
                    title: '4',
                  ),
                  InputNumberButton(
                    onTap: () {
                      addPin('5');
                    },
                    title: '5',
                  ),
                  InputNumberButton(
                    onTap: () {
                      addPin('6');
                    },
                    title: '6',
                  ),
                  InputNumberButton(
                    onTap: () {
                      addPin('7');
                    },
                    title: '7',
                  ),
                  InputNumberButton(
                    onTap: () {
                      addPin('8');
                    },
                    title: '8',
                  ),
                  InputNumberButton(
                    onTap: () {
                      addPin('9');
                    },
                    title: '9',
                  ),
                  SizedBox(
                    height: 60.h,
                    width: 60.w,
                  ),
                  InputNumberButton(
                    onTap: () {
                      addPin('0');
                    },
                    title: '0',
                  ),
                  GestureDetector(
                    onTap: deleteNumber,
                    child: Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyColors.blackButton,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: MyColors.white,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
