import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:today_my_school/config/palette.dart';
import 'package:today_my_school/pages/sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      builder: (context, child) {
        return MaterialApp(
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            );
          },
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              foregroundColor: Palette.baseColor1,
              elevation: 0,
              titleTextStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              centerTitle: true,
            ),
            scaffoldBackgroundColor: Colors.white,
          ),
          home: const SignInPage(),
        );
      },
    );
  }
}
