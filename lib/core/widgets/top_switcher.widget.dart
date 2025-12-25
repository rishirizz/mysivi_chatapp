import 'package:flutter/material.dart';

class TopSwitcher extends StatelessWidget {
  final TabController tabController;

  const TopSwitcher({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TabBar(
        controller: tabController,
        indicator: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        tabs: const [
          Tab(text: 'Users'),
          Tab(text: 'Chats'),
        ],
      ),
    );
  }
}