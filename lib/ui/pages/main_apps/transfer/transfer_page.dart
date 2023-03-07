import 'package:money_qu/ui/pages/main_apps/transfer/transfer_amount.dart';
import 'package:money_qu/ui/widget/buttons_widget.dart';
import 'package:money_qu/ui/widget/form_field_widget.dart';
import 'package:money_qu/ui/pages/main_apps/transfer/component/recent_user_widget.dart';
import 'package:money_qu/ui/pages/main_apps/transfer/component/result_item_widget.dart';
import 'package:money_qu/utils/constants.dart';
import 'package:money_qu/utils/my_import.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({Key? key}) : super(key: key);

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
          'Transfer',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24).r,
        children: [
          SizedBox(
            height: 40.h,
          ),
          CustomFormFieldWidget(
            textField: 'Search',
            hintText: 'by username',
            fontFamily: Font.poppinsSemiBold,
            fontSize: 16,
            fontWeight: semiBold,
          ),
          // _buildRecentUsers(),
          _buildRecentUsers(),
          SizedBox(
            height: 274.h,
          ),
          CustomButtonWidget(
            textButton: 'Continue',
            onPressed: () => goTransfer(context),
          ),
          SizedBox(
            height: 50.h,
          ),
        ],
      ),
    );
  }

  void goTransfer(BuildContext context) {
    goTo(const TransferAmountPage(), context);
  }

  Widget _buildRecentUsers() {
    return Container(
      margin: const EdgeInsets.only(top: 40).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Users',
            style: TextStyle(
              fontFamily: Font.poppinsSemiBold,
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          RecentUserWidget(
            imgUrl: Assets.img.imgDummy1.path,
            name: 'Yonna Jie',
            userName: 'yoenna',
            isVerified: true,
          ),
          RecentUserWidget(
            imgUrl: Assets.img.imgDummy3.path,
            name: 'John Hi',
            userName: 'jhi',
          ),
          RecentUserWidget(
            imgUrl: Assets.img.imgDummy4.path,
            name: 'Masayoshi',
            userName: 'form',
          ),
        ],
      ),
    );
  }

  Widget _buildResult() {
    return Container(
      margin: const EdgeInsets.only(top: 40).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Result',
            style: TextStyle(
              fontFamily: Font.poppinsSemiBold,
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          Wrap(
            spacing: 7.r,
            runSpacing: 6.r,
            children: [
              ResultItemWidget(
                imgUrl: Assets.img.imgDummy1.path,
                name: 'Yonna Jie',
                userName: 'yoenna',
                isVerified: true,
              ),
              ResultItemWidget(
                imgUrl: Assets.img.imgDummy3.path,
                name: 'John Hi',
                userName: 'jhi',
                isSelected: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
