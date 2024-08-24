import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'pages/main_home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 927),
      child: MaterialApp(
          theme: ThemeData(
              fontFamily: "SfPro",
              primaryColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.white)),
          home: const MainHomeScreen()),
    );
  }
}
