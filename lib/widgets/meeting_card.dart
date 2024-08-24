import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MeetingCard extends StatelessWidget {
  final DateTime time;
  final String price;
  final ImageProvider image;
  final String title;
  final String description;
  final String address;

  const MeetingCard({
    super.key,
    required this.address,
    required this.price,
    required this.title,
    required this.time,
    required this.description,
    required this.image,
  });

  void goToMeeting(BuildContext context) {}

  String timeToString() {
    final hour =
        "${time.hour.toString().padLeft(2, "0")}:${time.minute.toString().padLeft(2, "0")}";

    return '🕤 $hour ${time.day} августа ';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 273.h,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 160.h,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: image,
                fit: BoxFit.fitHeight,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.32),
                  topRight: Radius.circular(24.32),
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 9.sp),
              child: Align(
                alignment: const Alignment(0, 0.3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25.sp),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: FittedBox(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 19.w, vertical: 8.h),
                            decoration: ShapeDecoration(
                              color: Colors.white.withOpacity(0.2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.75),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              price,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 38.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x26000000),
                            blurRadius: 20,
                            offset: Offset(0, 5),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.sp),
                        child: Center(
                          child: Text(
                            timeToString(),
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w500,
                              // height: 0,
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
          Align(
            alignment: const Alignment(0, 1.4),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(24.sp))),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 14.w, right: 14.w, top: 18.h, bottom: 8.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            title,
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            description,
                            softWrap: true,
                            style: TextStyle(
                              color: const Color(0xFF626262),
                              fontSize: 16.sp,
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                          Text(
                            '📍$address',
                            softWrap: true,
                            style: TextStyle(
                              color: Color(0xFF4A4A4A),
                              fontSize: 16.sp,
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => goToMeeting(context),
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFF007AFF)),
                        child: Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: SvgPicture.asset(
                              height: 25.sp, "assets/icons/right_chevron.svg"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
