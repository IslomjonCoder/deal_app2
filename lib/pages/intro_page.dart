import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../colors.dart';
import '../widgets/background_gradient_overlay.dart';
import '../widgets/emojis.dart';
import '../widgets/login_button.dart';
import 'interest_page.dart';
import 'main_home_screen.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  void enterWithGoogle(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const MainHomeScreen()));
  }

  void enterWithVK(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const InterestPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BackgroundGradientOverlay(
        child: SafeArea(
          child: Column(
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
                  children: [
                    TextSpan(
                      text: 'DealMeet',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 41.sp,
                        height: 1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: ' - приложение для знакомств в ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 41.sp,
                        height: 1,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: 'бизнес сфере',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 41.sp,
                        height: 1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Встречайте людей по своим интересам, находите бизнес завтраки и другие различные мероприятия',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 21.sp,
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Spacer(),
              LoginButton(
                iconData: SvgPicture.asset("assets/icons/telegram_logo.svg"),
                name: "Вход через Telegram",
                onPressed: () => enterWithVK(context),
              ),
              SizedBox(
                height: 5.h,
              ),
              LoginButton(
                iconData: SvgPicture.asset("assets/icons/google_icon.svg"),
                name: "Вход через Google",
                onPressed: () => enterWithGoogle(context),
              ),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
