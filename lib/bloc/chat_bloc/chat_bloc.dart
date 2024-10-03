import 'package:deal_app/config/datasource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/chat.dart';
import '../../services/chat_service.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial(chats: [])) {
    on<GetAllChats>(_onGetChats);
  }

  void _onGetChats(GetAllChats event, Emitter<ChatState> emit) async {
    emit(ChatLoading(chats: state.chats));
    final result = await ChatService().getALlChats(event.ids, event.myId);
    if (result is DataSuccess<List<Chat>>) {
      emit(ChatLoaded(chats: result.data));
    } else {
      emit(ChatError(message: result.message, chats: state.chats));
    }
  }
}
