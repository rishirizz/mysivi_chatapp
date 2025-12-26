import 'package:mysivi_chatapp/core/enums.dart';

class ChatMessage {
  final String message;
  final MessageType type;

  const ChatMessage({required this.message, required this.type});
}
