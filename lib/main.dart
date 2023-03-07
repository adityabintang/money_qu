import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_qu/ui/pages/auth/blocs/index.dart';
import 'package:money_qu/ui/pages/onboarding/splash.dart';
import 'package:money_qu/utils/my_import.dart';

GlobalKey<ScaffoldMessengerState> scaffoldMessengerState =
    GlobalKey<ScaffoldMessengerState>();
GlobalKey<NavigatorState> navigatorState = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, __) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc()..add(AuthGetCurrentUser()),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: MyColors.lightBackground,
            appBarTheme: AppBarTheme(
              elevation: 0,
              backgroundColor: MyColors.lightBackground,
              iconTheme: const IconThemeData(color: MyColors.black),
              titleTextStyle: TextStyle(
                fontSize: 20.sp,
                color: MyColors.black,
                fontFamily: Font.poppinsSemiBold,
                fontWeight: semiBold,
              ),
              centerTitle: true,
            ),
          ),
          scaffoldMessengerKey: scaffoldMessengerState,
          navigatorKey: navigatorState,
          debugShowCheckedModeBanner: false,
          home: const SplashPage(),
        ),
      ),
    );
  }
}
