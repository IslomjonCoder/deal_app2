import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderChoose extends StatelessWidget {
  const GenderChoose({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GenderButton(emoji: "👧", text: "Женский"),
        GenderButton(emoji: "👦", text: 'Мужской'),
      ],
    );
  }
}

class GenderButton extends StatelessWidget {
  final String emoji;
  final String text;
  const GenderButton({super.key, required this.emoji, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 179.sp, minHeight: 125.sp),
      // padding: const EdgeInsets.only(
      //   top: 10,
      //   left: 16,
      //   right: 16,
      //   bottom: 16,
      // ),
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.800000011920929),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 20,
            offset: Offset(0, 5),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            emoji,
            style: TextStyle(
              fontSize: 65.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 21.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 16.sp,
          )
        ],
      ),
    );
  }
}
