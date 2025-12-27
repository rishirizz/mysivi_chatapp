import 'package:mysivi_chatapp/features/users/data/user.model.dart';

class ChatHistoryModel {
  final UserModel user;
  final String lastMessage;
  final DateTime time;

  const ChatHistoryModel({
    required this.user,
    required this.lastMessage,
    required this.time,
  });

  ChatHistoryModel copyWith({String? lastMessage, DateTime? time}) {
    return ChatHistoryModel(
      user: user,
      lastMessage: lastMessage ?? this.lastMessage,
      time: time ?? this.time,
    );
  }
}
