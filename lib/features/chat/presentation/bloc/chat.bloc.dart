import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chatapp/core/enums.dart';
import 'package:mysivi_chatapp/features/chat/data/model/chat_message.model.dart';
import 'package:mysivi_chatapp/features/chat/presentation/bloc/chat.event.dart';
import 'package:mysivi_chatapp/features/chat/presentation/bloc/chat.state.dart';
import 'package:http/http.dart' as http;

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState.initial()) {
    on<SendMessageEvent>(_onSendMessage);
    on<ReceiveMessageEvent>(_onReceiveMessage);
  }

  void _onSendMessage(SendMessageEvent event, Emitter<ChatState> emit) async {
    final updatedMessages = List<ChatMessage>.from(state.messages)
      ..add(ChatMessage(message: event.message, type: MessageType.sender));

    emit(state.copyWith(messages: updatedMessages, status: ChatStatus.loading));

    // Fetch receiver message
    final response = await http.get(
      Uri.parse('https://api.quotable.io/random'),
    );

    final data = jsonDecode(response.body);
    add(ReceiveMessageEvent(data['content']));
  }

  void _onReceiveMessage(ReceiveMessageEvent event, Emitter<ChatState> emit) {
    final updatedMessages = List<ChatMessage>.from(state.messages)
      ..add(ChatMessage(message: event.message, type: MessageType.receiver));

    emit(state.copyWith(messages: updatedMessages, status: ChatStatus.loaded));
  }
}
