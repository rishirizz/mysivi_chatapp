import 'package:equatable/equatable.dart';
import 'package:mysivi_chatapp/features/chat_history/data/model/chat_history.model.dart';

class ChatHistoryState extends Equatable {
  const ChatHistoryState({required this.histories});

  final List<ChatHistoryModel> histories;

  factory ChatHistoryState.initial() {
    return const ChatHistoryState(histories: []);
  }

  ChatHistoryState copyWith({
    List<ChatHistoryModel>? histories,
  }) {
    return ChatHistoryState(
      histories: histories ?? this.histories,
    );
  }

  @override
  List<Object> get props => [histories];
}