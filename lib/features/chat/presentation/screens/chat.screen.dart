import 'package:flutter/material.dart';
import 'package:mysivi_chatapp/core/constants/route.constants.dart';
import 'package:mysivi_chatapp/core/widgets/placeholder.widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  static String routeName = RouteConstants.chatScreen;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return PlaceholderWidget(placeholderText: 'Chats');
  }
}
