import 'package:deal_app/bloc/profile/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/auth_bloc/auth_bloc.dart';
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
  final userInterest = <Hobby>[];
  final userInterest2 = <Hobby>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const AppbarTitle(text: 'Мои интересы'),
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
                    runSpacing: 6.sp,
                    spacing: 6.sp,
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
                  runSpacing: 6.sp,
                  spacing: 6.sp,
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
                    onPressed: () {
                      final id = context.read<ProfileBloc>().state.user!.id;
                      context.read<ProfileBloc>().add(
                          UpdateHobby(userInterest + userInterest2, id: id));

                      Navigator.pop(context);
                    },
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
                      child: Center(
                        child: Text(
                          'Начать поиск',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 21.sp,
                            fontWeight: FontWeight.w500,
                            height: 0.05,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<Hobby> interestList = [
  const Hobby(emoji: '💻', word: 'Технологии'),
  const Hobby(emoji: '📺', word: 'Маркетинг'),
  const Hobby(emoji: '🎨', word: 'Искусство'),
  const Hobby(emoji: '💰', word: 'Финансы'),
  const Hobby(emoji: '❤️', word: 'Здравоохранение'),
  const Hobby(emoji: '⚡', word: 'Энергетика'),
  const Hobby(emoji: '🌱', word: 'Э-commerce'),
  const Hobby(emoji: '📚', word: 'Образование'),
];

List<Hobby> interestList2 = [
  const Hobby(emoji: '✨', word: 'Фриланс'),
  const Hobby(emoji: '⭐', word: 'Стартапы'),
  const Hobby(emoji: '🌟', word: 'Бизнесы'),
  const Hobby(emoji: '🔥', word: 'Крупный бизнес'),
];
