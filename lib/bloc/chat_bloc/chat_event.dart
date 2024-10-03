part of 'chat_bloc.dart';

abstract class ChatEvent {}

class SendChatMessage extends ChatEvent {
  final String message;
  final String who;
  final String from;
  SendChatMessage({
    required this.message,
    required this.from,
    required this.who,
  });
}

class GetUsersAllMessages extends ChatEvent {
  final String who;
  final String from;
  GetUsersAllMessages({
    required this.who,
    required this.from,
  });
}

class GetAllChats extends ChatEvent {
  final List<String> ids;
  final String myId;
  GetAllChats({
    required this.ids,
    required this.myId,
  });
}
