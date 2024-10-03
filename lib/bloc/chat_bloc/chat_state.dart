part of 'chat_bloc.dart';

class ChatState {
  final List<Chat> chats;

  const ChatState({
    required this.chats,
  });
}

class ChatInitial extends ChatState {
  ChatInitial({
    required super.chats,
  });
}

class ChatLoaded extends ChatState {
  ChatLoaded({
    required super.chats,
  });
}

class ChatError extends ChatState {
  final String message;
  ChatError({
    required super.chats,
    required this.message,
  });

  @override
  String toString() {
    // TODO: implement toString
    return "ChatError: $message";
  }
}

class ChatLoading extends ChatState {
  ChatLoading({
    required super.chats,
  });
}

class AllChatsSuccessFetched extends ChatState {
  AllChatsSuccessFetched({
    required super.chats,
  });
}
