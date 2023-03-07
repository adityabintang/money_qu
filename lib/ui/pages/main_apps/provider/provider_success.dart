import 'package:money_qu/ui/pages/main_apps/home/home.dart';
import 'package:money_qu/ui/widget/buttons_widget.dart';
import 'package:money_qu/utils/constants.dart';
import 'package:money_qu/utils/my_import.dart';

class ProviderSuccess extends StatelessWidget {
  const ProviderSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Paket Data\nBerhasil Terbeli',
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
              'Use the money wisely and\ngrow your finance',
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
              textButton: 'Back to Home',
              onPressed: () {
                goAll(const HomePage(), context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
