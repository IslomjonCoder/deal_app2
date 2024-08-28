import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors.dart';

class LoginButton extends StatelessWidget {
  final Widget iconData;
  final String name;
  final VoidCallback onPressed;
  const LoginButton(
      {super.key,
      required this.iconData,
      required this.name,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0x26000000),
              blurRadius: 20.sp,
              offset: Offset(0, 5.sp),
              spreadRadius: 0,
            )
          ],
        ),
        child: MaterialButton(
          onPressed: onPressed,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          elevation: 0,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
          ),
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(height: 29.h, child: iconData),
              Expanded(
                child: Center(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: CustomColors.cb71b1f26,
                      fontSize: 21.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
