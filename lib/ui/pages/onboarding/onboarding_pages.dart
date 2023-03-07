// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:money_qu/ui/pages/auth/sign_in.dart';
import 'package:money_qu/ui/pages/auth/sign_up.dart';
import 'package:money_qu/ui/widget/buttons_widget.dart';
import 'package:money_qu/utils/constants.dart';
import 'package:money_qu/utils/my_import.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  bool isClicked(int index) {
    return currentIndex == index;
  }

  List<String> titles = [
    'Grow Your\nFinancial Today',
    'Build From\nZero to Freedom',
    'Start Together'
  ];

  List<String> subTitles = [
    'Our system is helping you to\nachieve a better goal',
    'We provide tips for you so that\nyou can adapt easier',
    'We will guide you to where\nyou wanted it too'
  ];

  void goSignIn() => goAll(SignInPage(), context);

  void goSignUp() => goAll(SignUpPage(), context);

  void nextPage() => carouselController.nextPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider(
                  carouselController: carouselController,
                  items: [
                    Image.asset(
                      Assets.img.imgOnboarding1.path,
                      height: 331.h,
                    ),
                    Image.asset(
                      Assets.img.imgOnboarding2.path,
                      height: 331.h,
                    ),
                    Image.asset(
                      Assets.img.imgOnboarding3.path,
                      height: 331.h,
                    ),
                  ],
                  options: CarouselOptions(
                      height: 331.h,
                      viewportFraction: 1,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, _) {
                        setState(() {
                          currentIndex = index;
                        });
                      }),
                ),
                SizedBox(
                  height: 80.h,
                ),
                Container(
                  margin: REdgeInsets.symmetric(horizontal: 24).r,
                  padding:
                      REdgeInsets.symmetric(horizontal: 22, vertical: 24).r,
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.circular(20).r,
                  ),
                  child: Column(
                    children: [
                      Text(
                        titles[currentIndex],
                        style: TextStyle(
                          fontFamily: Font.poppinsSemiBold,
                          fontSize: 20.sp,
                          fontWeight: semiBold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      Text(
                        subTitles[currentIndex],
                        style: TextStyle(
                          color: MyColors.grey,
                          fontFamily: Font.poppins,
                          fontSize: 16.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: isClicked(2) ? 38.h : 50.h,
                      ),
                      isClicked(2)
                          ? Column(
                              children: [
                                CustomButtonWidget(
                                  textButton: 'Get Started',
                                  onPressed: goSignUp,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                SizedBox(
                                  width: double.infinity.w,
                                  height: 24.h,
                                  child: MaterialButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: goSignIn,
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: Font.poppins,
                                        color: MyColors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                Container(
                                  height: 12.h,
                                  width: 12.w,
                                  margin: EdgeInsets.only(right: 10).r,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isClicked(0)
                                        ? MyColors.blue
                                        : MyColors.lightBackground,
                                  ),
                                ),
                                Container(
                                  height: 12.h,
                                  width: 12.w,
                                  margin: EdgeInsets.only(right: 10).r,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isClicked(1)
                                        ? MyColors.blue
                                        : MyColors.lightBackground,
                                  ),
                                ),
                                Container(
                                  height: 12.h,
                                  width: 12.w,
                                  margin: EdgeInsets.only(right: 10).r,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isClicked(2)
                                        ? MyColors.blue
                                        : MyColors.lightBackground,
                                  ),
                                ),
                                Spacer(),
                                CustomButtonWidget(
                                  width: 150,
                                  textButton: 'Continue',
                                  onPressed: nextPage,
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
