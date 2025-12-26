import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chatapp/core/constants/route.constants.dart';
import 'package:mysivi_chatapp/features/chat/presentation/bloc/chat.bloc.dart';
import 'package:mysivi_chatapp/features/chat/presentation/widgets/message_input.widget.dart';
import 'package:mysivi_chatapp/features/chat/presentation/widgets/message_list.widget.dart';
import 'package:mysivi_chatapp/features/users/data/user.model.dart';

class ChatDetailsScreen extends StatelessWidget {
  const ChatDetailsScreen({super.key, required this.user});

  final UserModel user;

  static String routeName = RouteConstants.chatDetails;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatBloc(),
      child: Scaffold(
        appBar: AppBar(title: Text(user.name)),
        body: SafeArea(
          child: Column(
            children: [
              const Expanded(child: MessagesListWidget()),
              const MesssageInputWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
