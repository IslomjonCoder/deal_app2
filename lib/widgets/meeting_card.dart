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

  void goToMeeting(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      context: context,
      builder: (context) => myDialogWidget(),
    );
  }

  String timeToString() {
    final hour = "${time.hour.toString().padLeft(2, "0")}:${time.minute.toString().padLeft(2, "0")}";

    return '🕤 $hour ${time.day} августа';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24.r)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          imageHeader(),
          contentWidget(context),
        ],
      ),
    );
  }

  Widget myDialogWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        imageHeader(),
        dialogContentWidget(),
      ],
    );
  }

  Widget imageHeader() {
    return Container(
      width: double.infinity,
      height: 160.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image,
          fit: BoxFit.fitWidth,
        ),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(24.r),
        //     topRight: Radius.circular(24.r),
        //   ),
        // ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: Align(
        alignment: const Alignment(0, 0.33),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25.sp),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: FittedBox(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 8.h),
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
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
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
              child: Center(
                child: Text(
                  timeToString(),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    // height: 0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget dialogContentWidget() {
    return Align(
      // alignment: const Alignment(0, 0.95),
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(24.sp))),
        child: Padding(
          padding: EdgeInsets.only(left: 14.w, right: 14.w, top: 10.h, bottom: 8.h),
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
                        height: 0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    Text(
                      description,
                      softWrap: true,
                      style: TextStyle(
                        color: const Color(0xFF626262),
                        fontSize: 16.sp,
                        height: 0,
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
                        color: const Color(0xFF4A4A4A),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: TextButton.icon(
                        style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color(0xFF007AFF))),
                        iconAlignment: IconAlignment.end,
                        label: const Text(
                          'Записаться',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        icon: SvgPicture.asset(height: 25.sp, "assets/icons/right_chevron.svg"),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget contentWidget(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: EdgeInsets.only(left: 14.w, right: 14.w, top: 10.h, bottom: 8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      height: 0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 9.h),
                  Text(
                    description,
                    softWrap: true,
                    style: TextStyle(
                      color: const Color(0xFF626262),
                      fontSize: 16.sp,
                      height: 0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 9.h),
                  Text(
                    '📍$address',
                    softWrap: true,
                    style: TextStyle(
                      color: const Color(0xFF4A4A4A),
                      fontSize: 16.sp,
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
                decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF007AFF)),
                child: Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: SvgPicture.asset(height: 25.sp, "assets/icons/right_chevron.svg"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
