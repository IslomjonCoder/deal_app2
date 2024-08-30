import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/background_gradient_overlay.dart';
import '../widgets/emojis.dart';
import '../widgets/login_button.dart';
import 'main_home_screen.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  void enterWithGoogle(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const MainHomeScreen()));
  }

  void enterWithVK(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      body: BackgroundGradientOverlay(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                EmojiLayout(),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Image.asset(
                    "assets/icons/d_icon.png",
                    height: 120.h,
                    width: 120.h,
                  ),
                ),
                SizedBox(
                  height: 9.h,
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(height: 0.95.sp),
                    children: [
                      TextSpan(
                        text: 'DealMeet',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 41.sp,
                          // height: 1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: ' - приложение для знакомств в ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 41.sp,
                          // height: 1,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'бизнес сфере',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 41.sp,
                          // height: 1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Встречайте людей по своим интересам, находите бизнес завтраки и другие различные мероприятия',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 21.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.2),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(maxHeight: 54.h),
                ),
                LoginButton(
                  iconData: SvgPicture.asset("assets/icons/telegram_logo.svg"),
                  name: "Вход через Telegram",
                  onPressed: () => enterWithVK(context),
                ),
                SizedBox(
                  height: 10.h,
                ),
                LoginButton(
                  iconData: SvgPicture.asset("assets/icons/google_icon.svg"),
                  name: "Вход через Google",
                  onPressed: () => enterWithGoogle(context),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
