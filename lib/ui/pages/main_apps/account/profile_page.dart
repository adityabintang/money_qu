import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_qu/models/user_model.dart';
import 'package:money_qu/services/auth.dart';
import 'package:money_qu/ui/pages/auth/blocs/bloc.dart';
import 'package:money_qu/ui/pages/auth/blocs/bloc_event.dart';
import 'package:money_qu/ui/pages/auth/blocs/bloc_state.dart';
import 'package:money_qu/ui/pages/auth/sign_in.dart';
import 'package:money_qu/ui/pages/main_apps/account/profile_edit.dart';
import 'package:money_qu/ui/pages/main_apps/account/profile_edit_pin.dart';
import 'package:money_qu/ui/pages/main_apps/account/profile_menus.dart';
import 'package:money_qu/ui/pages/main_apps/pin/pin_page.dart';
import 'package:money_qu/ui/widget/buttons_widget.dart';
import '../../../../utils/my_import.dart';

class ProfilePages extends StatelessWidget {
  const ProfilePages({Key? key}) : super(key: key);

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
          'My Profile',
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AuthSuccess) {
            return _buildBody(context, state.user);
          }
          return Container();
        },
        listener: (context, state) {
          if (state is AuthFailure) {
            showCustomSnackBar(context, state.error);
          }
          if (state is AuthInitial) {
            goAll(const SignInPage(), context);
          }
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, UserModel data) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24).r,
      children: [
        SizedBox(
          height: 20.h,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 22).r,
          decoration: BoxDecoration(
            color: MyColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 120.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: data.profilePicture != null
                          ? NetworkImage(
                              data.profilePicture!,
                            )
                          : AssetImage(Assets.img.imgProfile.path)
                              as ImageProvider,
                    ),
                  ),
                  child: Visibility(
                    visible: data.verified == 1,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 28.w,
                        height: 28.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: MyColors.white),
                        child: const Icon(
                          Icons.check_circle,
                          color: MyColors.green,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                data.username.toString(),
                style: TextStyle(
                  fontFamily: Font.poppinsMedium,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              ProfileMenusItem(
                title: 'Edit Profile',
                iconUrl: Assets.icon.icEditProfile.path,
                onTap: () async {
                  if (await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PinPages(),
                        ),
                      ) ==
                      true) {
                    goTo(ProfileEditPage(), context);
                  }
                },
              ),
              ProfileMenusItem(
                title: 'My PIN',
                iconUrl: Assets.icon.icMyPin.path,
                onTap: () async {
                  if (await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PinPages(),
                        ),
                      ) ==
                      true) {
                    goTo(ProfileEditPin(), context);
                  }
                },
              ),
              ProfileMenusItem(
                title: 'Wallet Settings',
                iconUrl: Assets.icon.icSetWallet.path,
              ),
              ProfileMenusItem(
                title: 'My Rewards',
                iconUrl: Assets.icon.icMyReward.path,
              ),
              ProfileMenusItem(
                title: 'Help Center',
                iconUrl: Assets.icon.icHelp.path,
              ),
              ProfileMenusItem(
                title: 'Log Out',
                iconUrl: Assets.icon.icLogout.path,
                onTap: () async {
                  // await auth.clearCredential().then((value) {
                  //   goAll(const SignInPage(), context);
                  // });
                  context.read<AuthBloc>().add(Logout());
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 87.h,
        ),
        CustomTextButtonWidget(
          textButton: 'Report a Problem',
          onPressed: () {},
        ),
        SizedBox(
          height: 50.h,
        ),
      ],
    );
  }
}
