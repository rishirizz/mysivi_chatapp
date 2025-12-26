import 'package:equatable/equatable.dart';
import 'package:mysivi_chatapp/core/enums.dart';
import 'package:mysivi_chatapp/features/chat/data/model/chat_message.model.dart';

class ChatState extends Equatable {
  const ChatState({required this.messages, required this.status});

  final List<ChatMessage> messages;
  final ChatStatus status;

  factory ChatState.initial() {
    return const ChatState(messages: [], status: ChatStatus.initial);
  }

  ChatState copyWith({List<ChatMessage>? messages, ChatStatus? status}) {
    return ChatState(
      messages: messages ?? this.messages,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [messages, status];
}
