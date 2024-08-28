import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/user.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(23.r)),
      child: Container(
        height: 405.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage(user.image),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: const FractionalOffset(0.5, 0),
                end: const FractionalOffset(0.5, 1),
                colors: [
                  const Color(0x00131313),
                  const Color(0xff76718E),
                ],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${user.name}, ${user.age} года',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  user.desc,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21.sp,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
