import 'dart:math';
import 'package:deal_app/bloc/chat_bloc/chat_bloc.dart';
import 'package:deal_app/models/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            padding: EdgeInsets.only(top: 2.h),
            child: const AppbarTitle(text: "Чаты")),
        SizedBox(
          height: 10.h,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(30.r))),
            child: BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                final chats = state.chats;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final chat = chats[index];
                    return ChatTile(
                      isOnline: Random().nextBool(),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ChatDetail(name: chat.title, age: 24),
                            ));
                      },
                      image: chat.avatar,
                      message: chat.lastMessage,
                      name: chat.title,
                      unreadMessages: 1,
                      time: DateTime.now().toString(),
                    );
                  },
                  itemCount: chats.length,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
