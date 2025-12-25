import 'package:flutter/material.dart';
import 'package:mysivi_chatapp/core/constants/route.constants.dart';
import 'package:mysivi_chatapp/features/home/presentation/widgets/top_switcher.widget.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
              children: const [Text('Users'), Text('Chat history')],
            ),
          ),
        ),
      ],
    );
  }
}
