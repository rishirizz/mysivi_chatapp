import 'dart:convert';
import 'dart:math';
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

  Future<void> _onSendMessage(
    SendMessageEvent event,
    Emitter<ChatState> emit,
  ) async {
    // Add sender message immediately
    final updatedMessages = List<ChatMessage>.from(state.messages)
      ..add(ChatMessage(message: event.message, type: MessageType.sender));

    emit(state.copyWith(messages: updatedMessages, status: ChatStatus.loading));

    // Fetch receiver message from public API
    try {
      final randomId = Random().nextInt(500) + 1;

      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/comments/$randomId'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        add(ReceiveMessageEvent(data['body'] ?? 'No reply'));
      } else {
        add(ReceiveMessageEvent('Could not fetch reply'));
      }
    } catch (e) {
      //Fallback for network.
      add(ReceiveMessageEvent('Receiver message (network unavailable)'));
    }
  }

  void _onReceiveMessage(ReceiveMessageEvent event, Emitter<ChatState> emit) {
    final updatedMessages = List<ChatMessage>.from(state.messages)
      ..add(ChatMessage(message: event.message, type: MessageType.receiver));

    emit(state.copyWith(messages: updatedMessages, status: ChatStatus.loaded));
  }
}
