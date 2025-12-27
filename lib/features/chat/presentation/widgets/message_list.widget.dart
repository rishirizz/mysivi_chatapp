import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chatapp/core/enums.dart';
import 'package:mysivi_chatapp/features/chat/presentation/bloc/chat.bloc.dart';
import 'package:mysivi_chatapp/features/chat/presentation/bloc/chat.state.dart';
import 'package:mysivi_chatapp/features/chat/presentation/widgets/typing_indicator.widget.dart';

class MessagesListWidget extends StatelessWidget {
  const MessagesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount:
              state.messages.length +
              (state.status == ChatStatus.loading ? 1 : 0),
          itemBuilder: (context, index) {
            // Show typing indicator as last item
            if (index == state.messages.length &&
                state.status == ChatStatus.loading) {
              return const TypingIndicator();
            }

            final message = state.messages[index];
            final isSender = message.type == MessageType.sender;

            return Align(
              alignment: isSender
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isSender ? Colors.blue : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  message.message,
                  style: TextStyle(
                    color: isSender ? Colors.white : Colors.black,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
