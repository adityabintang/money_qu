import 'package:money_qu/ui/pages/main_apps/home/component/menus.dart';
import 'package:money_qu/ui/pages/main_apps/provider/data_provider_page.dart';
import 'package:money_qu/utils/constants.dart';
import 'package:money_qu/utils/my_import.dart';

class MoreDialogWidget extends StatelessWidget {
  const MoreDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: Container(
        height: 326.h,
        width: ScreenUtil().screenWidth,
        padding: const EdgeInsets.all(30).r,
        decoration: BoxDecoration(
            color: MyColors.lightBackground,
            borderRadius: BorderRadius.circular(40).r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Do More With Us',
              style: TextStyle(
                fontFamily: Font.poppinsSemiBold,
                fontSize: 16.sp,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 13.h,
            ),
            Wrap(
              spacing: 29.r,
              runSpacing: 19.r,
              children: [
                MenusPage(
                  title: 'Data',
                  iconUrl: Assets.icon.icData.path,
                  onTap: () => goBeliData(context),
                ),
                MenusPage(
                  title: 'Water',
                  iconUrl: Assets.icon.icWater.path,
                  onTap: (){},
                ),
                MenusPage(
                  title: 'Stream',
                  iconUrl: Assets.icon.icStream.path,
                  onTap: (){},
                ),
                MenusPage(
                  title: 'Movie',
                  iconUrl: Assets.icon.icMovie.path,
                  onTap: (){},
                ),
                MenusPage(
                  title: 'Food',
                  iconUrl: Assets.icon.icFood.path,
                  onTap: (){},
                ),
                MenusPage(
                  title: 'Travel',
                  iconUrl: Assets.icon.icTravel.path,
                  onTap: (){},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void goBeliData(BuildContext context) {
    goTo(const DataProviderPage(), context);
  }
}
