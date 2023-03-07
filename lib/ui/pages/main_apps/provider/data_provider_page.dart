import 'package:money_qu/ui/pages/main_apps/provider/component/provider_widget.dart';
import 'package:money_qu/ui/pages/main_apps/provider/select_package_page.dart';
import 'package:money_qu/ui/widget/buttons_widget.dart';
import 'package:money_qu/utils/constants.dart';
import 'package:money_qu/utils/my_import.dart';

class DataProviderPage extends StatelessWidget {
  const DataProviderPage({Key? key}) : super(key: key);

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
          'Beli Data',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24).r,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Text(
            'From Wallet',
            style: TextStyle(
              fontFamily: Font.poppinsSemiBold,
              fontSize: 16.sp,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Image.asset(
                Assets.img.imgBgWallet.path,
                width: 80.w,
              ),
              SizedBox(
                width: 16.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '8008 2208 1996',
                    style: TextStyle(
                      fontFamily: Font.poppinsMedium,
                      fontSize: 16.sp,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'Balance: ${formatCurrency(180000000)}',
                    style: TextStyle(
                      color: MyColors.grey,
                      fontFamily: Font.poppins,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          Text(
            'Select Provider',
            style: TextStyle(
              fontFamily: Font.poppinsSemiBold,
              fontSize: 16.sp,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          DataProviderItemWidget(
            imgUrl: Assets.img.imgTelkomsel.path,
            nameProvider: 'Telkomsel',
            isAvailable: true,
            isSelected: true,
          ),
          DataProviderItemWidget(
            imgUrl: Assets.img.imgIndosat.path,
            nameProvider: 'Indosat Ooredoo',
            isAvailable: true,
          ),
          DataProviderItemWidget(
            imgUrl: Assets.img.imgSingtel.path,
            nameProvider: 'Singtel ID',
            isAvailable: true,
          ),
          SizedBox(
            height: 135.h,
          ),
          CustomButtonWidget(
            textButton: 'Continue',
            onPressed: () => goDataPackage(context),
          ),
          SizedBox(
            height: 57.h,
          ),
        ],
      ),
    );
  }

  goDataPackage(BuildContext context) {
    goTo(const SelectPackagePage(), context);
  }
}
