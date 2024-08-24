import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/interests.dart';
import '../widgets/background_gradient_overlay.dart';
import '../widgets/interests_tab.dart';
import '../widgets/title.dart';

class InterestPage extends StatefulWidget {
  const InterestPage({super.key});

  @override
  State<InterestPage> createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  final userInterest = <Interests>[];
  final userInterest2 = <Interests>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: AppbarTitle(text: 'Мои интересы'),
      ),
      body: BackgroundGradientOverlay(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 16.h,
                ),
                Center(
                  child: Text(
                    'умею в',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.74),
                      fontSize: 21.sp,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w400,
                      height: 0.05,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SingleChildScrollView(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    children: [
                      for (var interest in interestList)
                        Builder(builder: (context) {
                          final isAdded = userInterest.contains(interest);
                          return InterestsTab(
                            onTap: () {
                              if (userInterest.contains(interest)) {
                                userInterest.remove(interest);
                              } else {
                                userInterest.add(interest);
                              }
                              setState(() {});
                            },
                            interest: interest,
                            isAdded: isAdded,
                          );
                        })
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'имею',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.74),
                    fontSize: 21.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  children: [
                    for (var interest in interestList2)
                      Builder(builder: (context) {
                        final isAdded = userInterest2.contains(interest);
                        return InterestsTab(
                          onTap: () {
                            if (userInterest2.contains(interest)) {
                              userInterest2.remove(interest);
                            } else {
                              userInterest2.add(interest);
                            }
                            setState(() {});
                          },
                          isAdded: isAdded,
                          interest: interest,
                        );
                      })
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: MaterialButton(
                    onPressed: () {},
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 16),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    color: Colors.white,
                    child: SizedBox(
                      width: double.infinity,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Отправится в ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 21.sp,
                                fontWeight: FontWeight.w500,
                                height: 0.05,
                              ),
                            ),
                            TextSpan(
                              text: 'DealMeet',
                              style: TextStyle(
                                color: const Color(0xB71B1F26),
                                fontSize: 21.sp,
                                fontWeight: FontWeight.w500,
                                height: 0.05,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<Interests> interestList = [
  const Interests(emoji: '💻', word: 'Технологии'),
  const Interests(emoji: '📺', word: 'Маркетинг'),
  const Interests(emoji: '🎨', word: 'Искусство'),
  const Interests(emoji: '💰', word: 'Финансы'),
  const Interests(emoji: '❤️', word: 'Здравоохранение'),
  const Interests(emoji: '⚡', word: 'Энергетика'),
  const Interests(emoji: '🌱', word: 'Э-commerce'),
  const Interests(emoji: '📚', word: 'Образование'),
];

List<Interests> interestList2 = [
  const Interests(emoji: '✨', word: 'Фриланс'),
  const Interests(emoji: '⭐', word: 'Стартапы'),
  const Interests(emoji: '🌟', word: 'Бизнесы'),
  const Interests(emoji: '🔥', word: 'Крупный бизнес'),
];
