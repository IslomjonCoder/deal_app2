import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../pages/chat_detail.dart';

class MessageTile extends StatelessWidget {
  final Message message;

  const MessageTile({super.key, required this.message});

  bool isMessageSingleWithEmoji(String message) {
    print("Message:$message length: ${message.length}");
    final nonEmojiRegExp = RegExp(
      r'^[a-zA-Z0-9\s\p{P}]+$',
      // Match letters, digits, spaces, and punctuation
      unicode: true,
    );
    if (message.length > 2) {
      return false;
    }
    return !nonEmojiRegExp.hasMatch(message);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.mine ? Alignment.centerLeft : Alignment.centerRight,
      child: Wrap(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 10.h,
            ),
            decoration: ShapeDecoration(
              color: message.mine ? Color(0xFF7DE0FF) : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            child: Text(
              message.message,
              softWrap: true,
              overflow: TextOverflow.clip,
              style: TextStyle(
                color: Colors.black,
                fontSize:
                    isMessageSingleWithEmoji(message.message) ? 34.sp : 21.sp,
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
