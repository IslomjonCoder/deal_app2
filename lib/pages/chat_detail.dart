import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/background_gradient_overlay.dart';
import '../widgets/message_tile.dart';

List<Message> messages = [
  Message(
    message: "Hello, how are you?",
    mine: true,
    time: DateTime(2024, 8, 25, 10, 15),
  ),
  Message(
    message: "Hello, how are you?",
    mine: true,
    time: DateTime(2024, 8, 25, 10, 17),
  ),
  Message(
    message: "Hello, how are you?",
    mine: true,
    time: DateTime(2024, 8, 25, 10, 18),
  ),
  Message(
    message: "Hello, how are you?",
    mine: true,
    time: DateTime(2024, 8, 25, 10, 20),
  ),
  Message(
    message: "I'm doing well, thanks! 😊",
    mine: false,
    time: DateTime(2024, 8, 25, 10, 22),
  ),
  Message(
    message: "What about you?",
    mine: false,
    time: DateTime(2024, 8, 25, 10, 23),
  ),
  Message(
    message: "Same here, just a bit tired.",
    mine: true,
    time: DateTime(2024, 8, 25, 10, 25),
  ),
  Message(
    message: "Let's grab some coffee ☕ later?",
    mine: false,
    time: DateTime(2024, 8, 25, 10, 30),
  ),
  Message(
    message: "Sounds like a plan!",
    mine: true,
    time: DateTime(2024, 8, 25, 10, 35),
  ),
  Message(
    message: "👍",
    mine: false,
    time: DateTime(2024, 8, 25, 10, 36),
  ),
  Message(
    message: "!!!",
    mine: false,
    time: DateTime(2024, 8, 25, 10, 37),
  ),
  Message(
    message: "I'm doing well, thanks! 😊",
    mine: false,
    time: DateTime(2024, 8, 26, 12, 00),
  ),
  Message(
    message: "What about you?",
    mine: false,
    time: DateTime(2024, 8, 26, 12, 02),
  ),
  Message(
    message: "🚀 Ready for the launch?",
    mine: true,
    time: DateTime(2024, 8, 26, 12, 05),
  ),
  Message(
    message: "Absolutely, can't wait!",
    mine: false,
    time: DateTime(2024, 8, 26, 12, 10),
  ),
  Message(
    message: "🔥🔥🔥",
    mine: true,
    time: DateTime(2024, 8, 26, 12, 12),
  ),
  Message(
    message: "Did you finish the report?",
    mine: false,
    time: DateTime(2024, 8, 27, 14, 20),
  ),
  Message(
    message: "Not yet, but almost there.",
    mine: true,
    time: DateTime(2024, 8, 27, 14, 25),
  ),
  Message(
    message: "Cool, no rush. 💼",
    mine: false,
    time: DateTime(2024, 8, 27, 14, 30),
  ),
  Message(
    message: "Thanks for understanding.",
    mine: true,
    time: DateTime(2024, 8, 27, 14, 35),
  ),
  Message(
    message: "Hey, are you free tonight?",
    mine: false,
    time: DateTime(2024, 8, 27, 16, 15),
  ),
  Message(
    message: "Yes, let's do something fun! 🎉",
    mine: true,
    time: DateTime(2024, 8, 27, 16, 20),
  ),
  Message(
    message: "Perfect! 😄",
    mine: false,
    time: DateTime(2024, 8, 27, 16, 25),
  ),
  Message(
    message: "🎨",
    mine: true,
    time: DateTime(2024, 8, 27, 18, 00),
  ),
  Message(
    message: "🏀",
    mine: false,
    time: DateTime(2024, 8, 27, 18, 05),
  ),
  Message(
    message:
        "🗓️ See you tomorrowfbdjbhjasghjagsdjhgfjhkadsgjfhkgsdjhakgjfhdgs!",
    mine: true,
    time: DateTime(2024, 8, 28, 09, 00),
  ),
];

class ChatDetail extends StatefulWidget {
  final String name;
  final int age;
  final bool isOnline = true;
  const ChatDetail({
    super.key,
    required this.name,
    required this.age,
  });

  @override
  State<ChatDetail> createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
              // Apply blur effect
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.01),
                ),
              ),
            ),
          ),
        ),
      ),
      body: BackgroundGradientOverlay(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: ListView.separated(
                controller: scrollController,
                separatorBuilder: (context, index) {
                  int height = 4;
                  if (index != messages.length) {
                    if (messages[index].mine != messages[index + 1].mine) {
                      height = 10;
                    }
                  }
                  return SizedBox(
                    height: height.h,
                  );
                },
                itemBuilder: (context, index) {
                  final message = messages[index];
                  if (index == 0 ||
                      message.time.day != messages[index - 1].time.day) {
                    print("I am here");
                    return Column(
                      children: [
                        Text(
                          '${message.time.day} в ${message.time.hour.toString().padLeft(2, "0")}:${message.time.minute.toString().padLeft(2, "0")}',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        MessageTile(message: message),
                        if (messages.length == index + 1)
                          SizedBox(
                            height: 70.h,
                          )
                      ],
                    );
                  }
                  if (messages.length == index + 1) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MessageTile(message: message),
                        SizedBox(
                          height: 70.h,
                        )
                      ],
                    );
                  }
                  return MessageTile(message: message);
                },
                itemCount: messages.length,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 16.w),
                child: TextField(
                  minLines: 1,
                  maxLines: 5,
                  controller: controller,
                  autocorrect: false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(
                      top: 11,
                      left: 16,
                      right: 12,
                      bottom: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset("assets/icons/send.svg")),
                  ),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 21.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  cursorColor: Color(0xFF007AFF),
                  cursorWidth: 2.w,
                  cursorHeight: 21.h,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 67.h, horizontal: 16.w),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  constraints: BoxConstraints(
                    minWidth: 30.sp,
                    minHeight: 30.sp,
                    // maxWidth: 55.sp,
                    // maxHeight: 55.sp
                  ),
                  decoration: ShapeDecoration(
                    color: Colors.white,
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
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    // highlightElevation: 0,
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.chevron_left,
                      size: 41.sp,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 67.h),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 8.h),
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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Badge(
                        backgroundColor: Color(0xFF0ED221),
                        smallSize: 11.sp,
                        alignment: Alignment.topLeft,
                        child: CircleAvatar(
                          radius: 16.sp,
                          backgroundImage:
                              AssetImage("assets/images/avatar.png"),
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        '${widget.name}, ${widget.age}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 21.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      MaterialButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          minWidth: 5.w,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          child: Icon(
                            size: 30,
                            Icons.keyboard_arrow_down,
                            color: Colors.black.withOpacity(0.6),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Message {
  final String message;
  final bool mine;
  final DateTime time;

  const Message(
      {required this.message, required this.mine, required this.time});
}
