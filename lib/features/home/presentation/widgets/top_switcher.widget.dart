import 'package:flutter/material.dart';

class TopSwitcher extends StatelessWidget {
  final TabController tabController;

  const TopSwitcher({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width - 100,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TabBar(
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        controller: tabController,
        padding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        labelPadding: EdgeInsets.zero,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        tabs: const [
          Tab(text: 'Users'),
          Tab(text: 'Chat History'),
        ],
      ),
    );
  }
}
