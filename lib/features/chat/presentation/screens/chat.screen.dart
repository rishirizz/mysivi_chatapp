import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chatapp/core/constants/route.constants.dart';
import 'package:mysivi_chatapp/features/home/presentation/widgets/top_switcher.widget.dart';
import 'package:mysivi_chatapp/features/users/presentation/bloc/user.bloc.dart';
import 'package:mysivi_chatapp/features/users/presentation/bloc/user.event.dart';
import 'package:mysivi_chatapp/features/users/presentation/screens/users.screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  static String routeName = RouteConstants.chatScreen;

  @override
  State<ChatScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: (_tabController.index == 0)
          ? FloatingActionButton(
              shape: const CircleBorder(),
              elevation: 0,
              onPressed: () {
                _addUser(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Center(child: Icon(Icons.add, color: Colors.white)),
              ),
            )
          : null,
      body: Column(
        children: [
          const SizedBox(height: 20),
          TopSwitcher(tabController: _tabController),
          const SizedBox(height: 10),
          const Divider(color: Color.fromARGB(255, 218, 214, 214)),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: TabBarView(
                controller: _tabController,
                children: const [UsersScreen(), Text('Chat history')],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addUser(BuildContext context) async {
    final name = await _showAddUserDialog(context);

    if (name == null || name.trim().isEmpty) return;
    if (context.mounted) {
      context.read<UsersBloc>().add(AddUserEvent(name.trim()));

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('$name added')));
    }
  }

  Future<String?> _showAddUserDialog(BuildContext context) {
    final controller = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add User'),
          content: Form(
            key: formKey,
            child: TextFormField(
              controller: controller,
              autofocus: true,
              decoration: const InputDecoration(hintText: 'Enter name'),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Name cannot be empty';
                }
                return null;
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.pop(context, controller.text.trim());
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
