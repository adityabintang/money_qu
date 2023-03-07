import 'package:money_qu/ui/pages/main_apps/pin/pin_page.dart';
import 'package:money_qu/ui/pages/main_apps/provider/component/select_package_item_widget.dart';
import 'package:money_qu/ui/pages/main_apps/provider/provider_success.dart';
import 'package:money_qu/ui/widget/buttons_widget.dart';
import 'package:money_qu/ui/widget/form_field_widget.dart';
import 'package:money_qu/utils/constants.dart';
import 'package:money_qu/utils/my_import.dart';

class SelectPackagePage extends StatelessWidget {
  const SelectPackagePage({Key? key}) : super(key: key);

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
          'Paket Data',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24).r,
        children: [
          SizedBox(
            height: 30.h,
          ),
          const CustomFormFieldWidget(
            textField: 'Phone Number',
            hintText: '+628',
          ),
          SizedBox(
            height: 40.h,
          ),
          Text(
            'Select Package',
            style: TextStyle(
              fontFamily: Font.poppinsSemiBold,
              fontSize: 16.sp,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          Wrap(
            spacing: 7.r,
            runSpacing: 17.r,
            children: const [
              SelectPackageItemWidget(
                price: 218000,
                isSelected: true,
                amount: 10,
              ),
              SelectPackageItemWidget(
                amount: 25,
                price: 420000,
              ),
              SelectPackageItemWidget(
                amount: 40,
                price: 2500000,
              ),
              SelectPackageItemWidget(
                amount: 99,
                price: 5000000,
              ),
            ],
          ),
          SizedBox(
            height: 85.h,
          ),
          CustomButtonWidget(
            textButton: 'Continue',
            onPressed: () async {
              if (await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PinPages(),
                    ),
                  ) ==
                  true) {
                await launch('https://demo.midtrans.com/');
                goAll(const ProviderSuccess(), context);
              }
            },
          ),
          SizedBox(
            height: 50.h,
          ),
        ],
      ),
    );
  }
}
