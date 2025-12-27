import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chatapp/features/chat/presentation/bloc/chat.bloc.dart';
import 'package:mysivi_chatapp/features/chat/presentation/bloc/chat.event.dart';

class MesssageInputWidget extends StatefulWidget {
  const MesssageInputWidget({super.key});

  @override
  State<MesssageInputWidget> createState() => _MesssageInputWidgetState();
}

class _MesssageInputWidgetState extends State<MesssageInputWidget> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(hintText: 'Type a message'),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              if (controller.text.trim().isEmpty) return;
              context.read<ChatBloc>().add(
                SendMessageEvent(controller.text.trim()),
              );

              controller.clear();
            },
          ),
        ],
      ),
    );
  }
}
