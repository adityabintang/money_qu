import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_qu/models/user_model.dart';
import 'package:money_qu/ui/pages/auth/blocs/bloc.dart';
import 'package:money_qu/ui/pages/auth/blocs/index.dart';
import 'package:money_qu/ui/pages/main_apps/account/profile_page.dart';
import 'package:money_qu/ui/pages/main_apps/home/component/menus.dart';
import 'package:money_qu/ui/pages/main_apps/home/component/menus_send_again.dart';
import 'package:money_qu/ui/pages/main_apps/home/component/menus_tips.dart';
import 'package:money_qu/ui/pages/main_apps/home/component/menus_transaction.dart';
import 'package:money_qu/ui/pages/main_apps/home/component/more_dialog_widget.dart';
import 'package:money_qu/ui/pages/main_apps/top_up/top_up_page.dart';
import 'package:money_qu/ui/pages/main_apps/transfer/transfer_page.dart';
import 'package:money_qu/utils/constants.dart';
import '../../../../utils/my_import.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void goTopUp(BuildContext context) {
    print('topup');
    goTo(const TopUpPage(), context);
  }

  void goTransfer(BuildContext context) {
    print('transfer');
    goTo(const TransferPage(), context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24).r,
        children: [
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthSuccess) {
                return _buildProfile(context, state.user);
              }
              return Container();
            },
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthSuccess) {
                return _buildWalletCard(state.user);
              }
              return Container();
            },
          ),

          _buildLevel(),
          _buildServices(context),
          _latestTransaction(),
          _buildSendAgain(),
          _buildFriendlyTips(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Image.asset(
          Assets.icon.icAdd.path,
          width: 24.w,
          height: 24.h,
        ),
        backgroundColor: MyColors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: MyColors.white,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6.w,
        child: BottomNavigationBar(
          backgroundColor: MyColors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: MyColors.blue,
          elevation: 0,
          unselectedItemColor: MyColors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(
            color: MyColors.blue,
            fontFamily: Font.poppinsMedium,
            fontWeight: medium,
            fontSize: 10.sp,
          ),
          unselectedLabelStyle: TextStyle(
            color: MyColors.black,
            fontFamily: Font.poppinsMedium,
            fontWeight: medium,
            fontSize: 10.sp,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                Assets.icon.icOverview.path,
                width: 20.w,
                color: MyColors.blue,
              ),
              label: 'Overview',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                Assets.icon.icHistory.path,
                width: 20.w,
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                Assets.icon.icStats.path,
                width: 20.w,
              ),
              label: 'Statistic',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                Assets.icon.icReward.path,
                width: 20.w,
              ),
              label: 'Reward',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfile(BuildContext context, UserModel data) {
    return Container(
      margin: const EdgeInsets.only(top: 40).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Howdy,',
                style: TextStyle(
                  fontFamily: Font.poppins,
                  fontSize: 16.sp,
                  color: MyColors.grey,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                data.name!,
                style: TextStyle(
                    fontFamily: Font.poppinsSemiBold,
                    fontSize: 16.sp,
                    fontWeight: semiBold),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfilePages()));
            },
            child: Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: data.profilePicture == null ? AssetImage(
                    Assets.img.imgProfile.path,
                  ) : NetworkImage(
                    data.profilePicture!,
                  ) as ImageProvider,
                ),
              ),
              child: Visibility(
                visible: data.verified == 1,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 16.w,
                    height: 16.h,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: MyColors.white),
                    child: const Icon(
                      Icons.check_circle,
                      color: MyColors.green,
                      size: 14,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWalletCard(UserModel data) {
    return Container(
      width: double.infinity.w,
      height: 240.h,
      padding: const EdgeInsets.all(30).r,
      margin: const EdgeInsets.only(top: 30).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28).r,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            Assets.img.imgBgCard.path,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.name!,
            style: TextStyle(
              color: MyColors.white,
              fontFamily: Font.poppinsMedium,
              fontWeight: medium,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(
            height: 28.h,
          ),
          Text(
            '**** **** **** ${data.cardNumber!.substring(12, 16)}',
            style: TextStyle(
              color: MyColors.white,
              fontFamily: Font.poppinsMedium,
              fontWeight: medium,
              fontSize: 18.sp,
              letterSpacing: 5.r,
            ),
          ),
          SizedBox(
            height: 21.h,
          ),
          Text(
            'Balance',
            style: TextStyle(
              fontFamily: Font.poppins,
              color: MyColors.white,
              fontSize: 14.sp,
            ),
          ),
          Text(
            formatCurrency(data.balance ?? 0),
            style: TextStyle(
              fontFamily: Font.poppinsSemiBold,
              color: MyColors.white,
              fontSize: 24.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLevel() {
    return Container(
      margin: EdgeInsets.only(top: 20).r,
      padding: EdgeInsets.all(22).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20).r,
        color: MyColors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Level 1',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: Font.poppinsMedium,
                  fontWeight: medium,
                ),
              ),
              const Spacer(),
              Text(
                '55% ',
                style: TextStyle(
                  color: MyColors.green,
                  fontSize: 14.sp,
                  fontFamily: Font.poppinsSemiBold,
                  // fontWeight: semiBold,
                ),
              ),
              Text(
                'of ${formatCurrency(20000)}',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: Font.poppinsSemiBold,
                  // fontWeight: semiBold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(55).r,
            child: const LinearProgressIndicator(
              backgroundColor: MyColors.lightBackground,
              minHeight: 5,
              value: 0.55,
              valueColor: AlwaysStoppedAnimation(MyColors.green),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildServices(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Do Something',
            style: TextStyle(
                fontFamily: Font.poppinsSemiBold,
                fontSize: 16.sp,
                fontWeight: semiBold),
          ),
          SizedBox(
            height: 14.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MenusPage(
                title: 'Top Up',
                iconUrl: Assets.icon.icTopup.path,
                onTap: () => goTopUp(context),
              ),
              MenusPage(
                title: 'Send',
                iconUrl: Assets.icon.icSend.path,
                onTap: () => goTransfer(context),
              ),
              MenusPage(
                title: 'Withdraw',
                iconUrl: Assets.icon.icWithdraw.path,
                onTap: () {},
              ),
              MenusPage(
                title: 'More',
                iconUrl: Assets.icon.icMore.path,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => const MoreDialogWidget());
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _latestTransaction() {
    return Container(
      margin: const EdgeInsets.only(top: 30).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest Transaction',
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: Font.poppinsSemiBold,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(22).r,
            margin: EdgeInsets.only(top: 14).r,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20).r,
                color: MyColors.white),
            child: Column(
              children: [
                MenusTransactionPage(
                  title: 'Top Up',
                  iconUrl: Assets.icon.icTransTopup.path,
                  amount: '+${formatCurrency(450000, symbol: '')}',
                  dateTime: 'Yesterday',
                ),
                MenusTransactionPage(
                  title: 'Cashback',
                  iconUrl: Assets.icon.icTransCashback.path,
                  amount: '+${formatCurrency(22000, symbol: '')}',
                  dateTime: 'Sep 11',
                ),
                MenusTransactionPage(
                  title: 'Withdraw',
                  iconUrl: Assets.icon.icTransWithdraw.path,
                  amount: '-${formatCurrency(5000, symbol: '')}',
                  dateTime: 'Sep 2',
                ),
                MenusTransactionPage(
                  title: 'Transfer',
                  iconUrl: Assets.icon.icTransTf.path,
                  amount: '-${formatCurrency(123500, symbol: '')}',
                  dateTime: 'Augst 27',
                ),
                MenusTransactionPage(
                  title: 'Electric',
                  iconUrl: Assets.icon.icTransElectric.path,
                  amount: '-${formatCurrency(12300000, symbol: '')}',
                  dateTime: 'Feb 13',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSendAgain() {
    return Container(
      margin: const EdgeInsets.only(top: 30).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send Again',
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: Font.poppinsSemiBold,
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                MenuSendAgainPage(
                    imgUrl: Assets.img.imgDummy1.path, username: 'Yuanita'),
                MenuSendAgainPage(
                    imgUrl: Assets.img.imgDummy2.path, username: 'Jani'),
                MenuSendAgainPage(
                    imgUrl: Assets.img.imgDummy3.path, username: 'Urip'),
                MenuSendAgainPage(
                    imgUrl: Assets.img.imgDummy4.path, username: 'Masa'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFriendlyTips() {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
        bottom: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Friendly Tips',
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: Font.poppinsSemiBold,
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          Wrap(
            spacing: 7.r,
            runSpacing: 6.r,
            children: [
              MenusTipsPage(
                imgUrl: Assets.img.imgTips1.path,
                title: 'Best tips for using a credit card',
                url: 'https://www.google.com',
              ),
              MenusTipsPage(
                imgUrl: Assets.img.imgTips2.path,
                title: 'Spot the good pie of finance model',
                url: 'https://www.google.com',
              ),
              MenusTipsPage(
                imgUrl: Assets.img.imgTips3.path,
                title: 'Great hack to get better advices',
                url: 'https://www.google.com',
              ),
              MenusTipsPage(
                imgUrl: Assets.img.imgTips4.path,
                title: 'Save more penny buy this instead',
                url: 'https://www.google.com',
              ),
            ],
          )
        ],
      ),
    );
  }
}
