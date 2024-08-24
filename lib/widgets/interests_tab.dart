import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/interests.dart';

class InterestsTab extends StatelessWidget {
  final VoidCallback onTap;
  final bool isAdded;
  final Interests interest;

  const InterestsTab(
      {super.key,
      required this.onTap,
      required this.interest,
      required this.isAdded});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isAdded ? Colors.white : Colors.transparent,
            border: isAdded
                ? null
                : Border.all(
                    width: 1,
                    color: Colors.black.withOpacity(0.2),
                  ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                interest.emoji,
                style: TextStyle(
                  color: const Color(0xFFF2F2F7),
                  fontSize: 21.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 7.w,
              ),
              Text(
                interest.word,
                style: TextStyle(
                  color: isAdded ? Colors.black : const Color(0xFFF2F2F7),
                  fontSize: 21.sp,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
