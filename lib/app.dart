import 'package:deal_app/pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      fontSizeResolver: FontSizeResolvers.diameter,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: "SfPro",
              primaryColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.white)),
          home: const IntroPage()),
    );
  }
}
