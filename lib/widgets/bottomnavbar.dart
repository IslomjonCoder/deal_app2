import 'package:deal_app/bloc/navigation_cubit/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../tab_manager.dart';

class Bottomnavbar extends StatelessWidget {
  // final PageController controller;

  const Bottomnavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit,int>(
        builder: (context, state) {
          return Container(
            height: state == 3 ? 100.h : null,
            decoration: state == 3
                ? ShapeDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(-0.9, -0.44),
                      end: Alignment(1, 0.44),
                      colors: [
                        Color(0xFF4200FF),
                        Color(0xFF8C8AFF),
                        // Color(0xFF9593F0),
                        // Color(0xFFFF8E8E)
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.sp),
                        topRight: Radius.circular(20.sp),
                      ),
                    ),
                  )
                : null,
            child: Padding(
              padding: EdgeInsets.only(
                  right: 40.w, left: 40.w, top: 10.h, bottom: 30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    constraints: BoxConstraints(minWidth: 70.w),
                    child: GestureDetector(
                      behavior:  HitTestBehavior.translucent,
                      onTap: () => context.read<NavigationCubit>().changeIndex(0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                              height: 40.h,
                              child: state == 0
                                  ? CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: SvgPicture.asset(
                                          "assets/icons/active_compass.svg"),
                                    )
                                  : SvgPicture.asset(
                                      "assets/icons/compass.svg")),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Места',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFF5F5F5),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              height: 0.06,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(minWidth: 70.w),
                    child: GestureDetector(
                      behavior:  HitTestBehavior.translucent,

                      onTap: () {
                        context.read<NavigationCubit>().changeIndex(1);
                        // controller.jumpToPage(1);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 40.h,
                            child: SvgPicture.asset(
                              "assets/icons/add_box.svg",
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Поиск',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFF5F5F5),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              height: 0.06,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(minWidth: 70.w),
                    child: GestureDetector(
                      behavior:  HitTestBehavior.translucent,

                      onTap: () {
                        context.read<NavigationCubit>().changeIndex(2);
                        // controller.jumpToPage(2);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                              height: 40.h,
                              child: state >= 2
                                  ? const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Icon(Icons.person),
                                    )
                                  : const Icon(Icons.person)),
                          SizedBox(
                            height: 13.h,
                          ),
                          Text(
                            'Профиль',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFFF2F2F7),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              height: 0.06,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
