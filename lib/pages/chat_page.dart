import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/chat_tile.dart';
import '../widgets/title.dart';
import 'chat_detail.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(bottom: 5.h, top: 5.h),
            child: const AppbarTitle(text: "Чаты")),
        SizedBox(
          height: 5.h,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(20.r))),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ChatTile(
                  isOnline: Random().nextBool(),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ChatDetail(name: 'Георгий', age: 24),
                        ));
                  },
                  image: "assets/images/avatar.png",
                  message: 'Пока изучаю вопрос, ожидайте',
                  name: 'Георгий',
                  unreadMessages: 1,
                  time: 'Сейчас',
                );
              },
              itemCount: 10,
            ),
          ),
        ),
      ],
    );
  }
}
