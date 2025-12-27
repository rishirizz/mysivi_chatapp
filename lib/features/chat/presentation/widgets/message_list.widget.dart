import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chatapp/core/enums.dart';
import 'package:mysivi_chatapp/core/widgets/profile_picture.widget.dart';
import 'package:mysivi_chatapp/features/chat/presentation/bloc/chat.bloc.dart';
import 'package:mysivi_chatapp/features/chat/presentation/bloc/chat.state.dart';
import 'package:mysivi_chatapp/features/chat/presentation/widgets/typing_indicator.widget.dart';
import 'package:mysivi_chatapp/features/users/data/user.model.dart';

class MessagesListWidget extends StatelessWidget {
  const MessagesListWidget({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        if (state.messages.isEmpty && state.status != ChatStatus.loading) {
          return const Center(
            child: Text(
              'Start a conversation',
              style: TextStyle(color: Colors.grey),
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount:
              state.messages.length +
              (state.status == ChatStatus.loading ? 1 : 0),
          itemBuilder: (context, index) {
            // 🔹 Typing indicator
            if (index == state.messages.length &&
                state.status == ChatStatus.loading) {
              return const TypingIndicator();
            }

            final message = state.messages[index];
            final isSender = message.type == MessageType.sender;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: isSender
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  // 🔹 Receiver avatar
                  if (!isSender)
                    ProfilePictureWidget(
                      userInitials: user.initial,
                      colors: const [Colors.blue, Colors.purpleAccent],
                    ),

                  const SizedBox(width: 8),

                  // 🔹 Name + message column
                  Column(
                    crossAxisAlignment: isSender
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      // 🔹 Receiver name (only once per message)
                      if (!isSender)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            user.name,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                        ),

                      // 🔹 Message bubble
                      Container(
                        padding: const EdgeInsets.all(12),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.65,
                        ),
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
                    ],
                  ),

                  // 🔹 Sender avatar
                  if (isSender) ...[
                    const SizedBox(width: 8),
                    ProfilePictureWidget(
                      userInitials: 'Y',
                      colors: const [Colors.blue, Colors.purpleAccent],
                    ),
                  ],
                ],
              ),
            );
          },
        );
      },
    );
  }
}
