import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chatapp/core/widgets/profile_picture.widget.dart';
import 'package:mysivi_chatapp/features/chat/presentation/screens/chat_details.screen.dart';
import 'package:mysivi_chatapp/features/chat_history/presentation/bloc/chat_history.bloc.dart';
import 'package:mysivi_chatapp/features/chat_history/presentation/bloc/chat_history.state.dart';

class ChatHistoryScreen extends StatelessWidget {
  const ChatHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatHistoryBloc, ChatHistoryState>(
      builder: (context, state) {
        if (state.histories.isEmpty) {
          return const Center(child: Text('No chats yet'));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: state.histories.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (_, index) {
            final chat = state.histories[index];
            return ListTile(
              leading: ProfilePictureWidget(userInitials: chat.user.initial),
              title: Text(
                chat.user.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                chat.lastMessage,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Text(
                _formatTime(chat.time),
                style: const TextStyle(fontSize: 12),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatDetailsScreen(user: chat.user),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    if (now.difference(time).inDays == 0) {
      return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
    }
    return '${time.day}/${time.month}';
  }
}
