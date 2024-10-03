import 'dart:convert';

import 'package:deal_app/config/datasource.dart';
import 'package:deal_app/models/chat.dart';
import 'package:deal_app/models/message.dart';
import 'package:deal_app/services/profile_service.dart';
// import 'package:deal_app/pages/chat_detail.dart';
import 'package:http/http.dart' as http;

class ChatService {
  Future<DataSource> sendMessage({
    required String content,
    required DateTime dateTime,
    required String senderId,
    required String whoId,
  }) async {
    final response = await http.post(
      Uri.parse('http://5.35.81.3:8080/Chat/send-message'),
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "content": content,
        "dateTime": dateTime.toIso8601String(),
        "senderId": senderId,
        "whoId": whoId
      }),
    );

    if (response.statusCode == 200) {
      return DataSuccess<Message>(
        data: Message.fromJson(jsonDecode(response.body)),
        message: "Message send success",
      );
    }

    return DataFailure(message: "Something got wrong ${response.body}");
  }

  Future<DataSource> getAllMessage({
    required String senderId,
    required String whoId,
  }) async {
    final allMessages = <Message>[];
    final response = await http.get(
      Uri.parse(
          'http://5.35.81.3:8080/Chat/get-message-all-user?sender=$senderId&who=$whoId'),
      headers: {
        'accept': 'text/plain',
      },
    );

    final response2 = await http.get(
      Uri.parse(
          'http://5.35.81.3:8080/Chat/get-message-all-user?sender=$whoId&who=$senderId'),
      headers: {
        'accept': 'text/plain',
      },
    );

    if (response.statusCode == 200) {
      final messages = List<Message>.from(
          jsonDecode(response.body).map((x) => Message.fromJson(x)));
      allMessages.addAll(messages);
    }

    if (response2.statusCode == 200) {
      final messages2 = List<Message>.from(
          jsonDecode(response2.body).map((x) => Message.fromJson(x)));
      allMessages.addAll(messages2);
    }
    allMessages.sort(
      (a, b) => a.dateTime.compareTo(b.dateTime),
    );
    if (allMessages.isNotEmpty) {
      return DataSuccess<List<Message>>(
        data: allMessages,
        message: "Message fetch success",
      );
    }

    return DataFailure(message: "Something got wrong ${response.body}");
  }

  Future<DataSource> getALlChats(List<String> ids, String myId) async {
    final chats = <Chat>[];
    print("chats ${chats.length}");
    for (var id in ids) {
      final response = await getAllMessage(senderId: myId, whoId: id);
      final user = await ProfileService().getMe(id);
      if (response is DataSuccess && user is DataSuccess) {
        final chat = response.data as List<Message>;

        chats.add(Chat(
            id: user.data!.id,
            title: user.data!.name,
            avatar: user.data!.avatar,
            lastMessage: chat.last.content));
      } else {
        print("Log: Chat service Error ${response.message} ${user.message} ");
      }
    }

    if (chats.isNotEmpty) {
      return DataSuccess<List<Chat>>(
        data: chats,
        message: "Chats fetch success",
      );
    }
    return const DataFailure(message: "Something got wrong fetching chats");
  }
}
