import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chatapp/features/users/presentation/bloc/user.bloc.dart';
import 'package:mysivi_chatapp/features/users/presentation/bloc/user.state.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) {
        if (state.users.isEmpty) {
          return const Center(
            child: Text('No users yet', style: TextStyle(color: Colors.black)),
          );
        }
        return ListView.separated(
          key: const PageStorageKey('users_list'),
          padding: const EdgeInsets.all(12),
          itemCount: state.users.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (_, index) {
            final user = state.users[index];

            return ListTile(
              leading: CircleAvatar(child: Text(user.initial)),
              title: Text(user.name),
              onTap: () {
                // Navigator.pushNamed(
                //   context,
                //   RouteConstants.chatScreen,
                //   arguments: user,
                // );
              },
            );
          },
        );
      },
    );
  }
}
