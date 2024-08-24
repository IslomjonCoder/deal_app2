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
                height: 20.h,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 120.w, maxHeight: 120.h),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(1, 0),
                    end: Alignment(0, 1),
                    colors: [
                      CustomColors.c0400cf,
                      CustomColors.ce900eb,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'D',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 77.sp,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
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
                height: 10.h,
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
                iconData: Icon(
                  FontAwesomeIcons.vk,
                  size: 29.sp,
                  color: const Color(0xff1976D2),
                ),
                name: "Вход через VK",
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
