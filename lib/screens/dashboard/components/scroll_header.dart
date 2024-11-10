import 'package:flutter/material.dart';

class ScrollHeader extends StatelessWidget {
  const ScrollHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Multiple Tabs Example"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Tab 1"),
              Tab(text: "Tab 2"),
              Tab(text: "Tab 3"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text("Content for Tab 1")),
            Center(child: Text("Content for Tab 2")),
            Center(child: Text("Content for Tab 3")),
          ],
        ),
      ),
    );
  }
}
