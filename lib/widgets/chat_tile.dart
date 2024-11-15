import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatTile extends StatelessWidget {
  final String image;
  final String name;
  final String message;
  final String time;
  final VoidCallback onTap;
  final int unreadMessages;
  final bool isOnline;

  const ChatTile({
    super.key,
    required this.image,
    required this.message,
    required this.name,
    required this.time,
    required this.onTap,
    required this.isOnline,
    required this.unreadMessages,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
        child: Row(
          children: [
            Badge(
              backgroundColor:
                  isOnline ? const Color(0xFF0ED221) : Colors.transparent,
              smallSize: 11.r,
              alignment: Alignment.topLeft,
              child: CircleAvatar(
                radius: 26.sp,
                backgroundImage: NetworkImage(image),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 250.w,
                  child: Text(
                    message,
                    style: TextStyle(
                      color: Colors.black,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 21.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
            const Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  time,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: const Color(0xFF5D6CF5),
                  radius: 11.h,
                  child: Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
