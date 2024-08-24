import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarTitle extends StatelessWidget {
  final String text;

  const AppbarTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: const Color(0xFFF2F2F7),
        fontSize: 26.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
