import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chatapp/features/chat_history/data/model/chat_history.model.dart';
import 'package:mysivi_chatapp/features/chat_history/presentation/bloc/chat_history.event.dart';
import 'package:mysivi_chatapp/features/chat_history/presentation/bloc/chat_history.state.dart';

class ChatHistoryBloc extends Bloc<ChatHistoryEvent, ChatHistoryState> {
  ChatHistoryBloc() : super(ChatHistoryState.initial()) {
    on<UpdateChatHistoryEvent>(_onUpdate);
  }

  void _onUpdate(UpdateChatHistoryEvent event, Emitter<ChatHistoryState> emit) {
    final histories = List<ChatHistoryModel>.from(state.histories);

    final index = histories.indexWhere((h) => h.user.name == event.user.name);

    if (index >= 0) {
      histories[index] = histories[index].copyWith(
        lastMessage: event.lastMessage,
        time: DateTime.now(),
      );
    } else {
      histories.insert(
        0,
        ChatHistoryModel(
          user: event.user,
          lastMessage: event.lastMessage,
          time: DateTime.now(),
        ),
      );
    }

    emit(state.copyWith(histories: histories));
  }
}
