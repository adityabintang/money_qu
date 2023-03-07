
import 'package:money_qu/ui/pages/main_apps/home/home.dart';
import 'package:money_qu/utils/constants.dart';
import '../../../utils/my_import.dart';
import '../../widget/buttons_widget.dart';

class SuccessSignupPage extends StatefulWidget {
  const SuccessSignupPage({Key? key}) : super(key: key);

  @override
  State<SuccessSignupPage> createState() => _SuccessSignupPageState();
}

class _SuccessSignupPageState extends State<SuccessSignupPage> {

  void goHome()=> goAll(const HomePage(), context);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Akun Berhasil\nTerdaftar',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                fontFamily: Font.poppinsSemiBold,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 26.h,
            ),
            Text(
              'Grow your finance start\ntogether with us',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                color: MyColors.grey,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            CustomButtonWidget(
              width: 183,
              textButton: 'Get Started',
              onPressed: goHome,
            ),
          ],
        ),
      ),
    );
  }
}
