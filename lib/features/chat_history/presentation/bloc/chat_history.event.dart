import 'package:mysivi_chatapp/features/users/data/user.model.dart';

abstract class ChatHistoryEvent {}

class UpdateChatHistoryEvent extends ChatHistoryEvent {
  final UserModel user;
  final String lastMessage;

  UpdateChatHistoryEvent({required this.user, required this.lastMessage});
}
