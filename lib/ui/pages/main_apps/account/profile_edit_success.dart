
import 'package:money_qu/ui/pages/main_apps/home/home.dart';
import 'package:money_qu/utils/constants.dart';

import '../../../../utils/my_import.dart';
import '../../../widget/buttons_widget.dart';

class ProfileEditSuccess extends StatelessWidget {
  const ProfileEditSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nice Update!',
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
              'Your data is safe with\nour system',
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
              textButton: 'My Profile',
              onPressed: (){
                goAll(const HomePage(), context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
