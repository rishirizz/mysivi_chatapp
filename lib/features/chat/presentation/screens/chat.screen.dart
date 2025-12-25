import 'package:flutter/material.dart';
import 'package:mysivi_chatapp/core/constants/route.constants.dart';
import 'package:mysivi_chatapp/core/widgets/top_switcher.widget.dart';

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
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (_, __) => [
          SliverAppBar(
            floating: true,
            snap: true,
            centerTitle: true,
            title: TopSwitcher(tabController: _tabController),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: const [Text('Users'), Text('Chat history')],
        ),
      ),
    );
  }
}
