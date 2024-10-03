import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/interests.dart';
import '../widgets/background_gradient_overlay.dart';
import '../widgets/interests_tab.dart';
import '../widgets/title.dart';
import 'interest_page.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final userInterest = <Hobby>[];
  final userInterest2 = <Hobby>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: AppbarTitle(text: 'Ищем избранных'),
      ),
      body: BackgroundGradientOverlay(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 16.h,
                ),
                Center(
                  child: Text(
                    'кто умеет в',
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
                    spacing: 15.w,
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
                  'имеет',
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
