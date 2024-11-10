import 'package:betterodds/screens/dashboard/myComponents/matches.dart';
import 'package:betterodds/constants.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Matches(),

      // CustomScrollView(
      //   slivers: [
      //     Expanded(child:),
      //     // SliverPersistentHeader(
      //     //   pinned: true,
      //     //   delegate: MyProfileHeaderDelegate(
      //     //     myProfile: myRow(),
      //     //   ),
      //     // ),
      //     // SliverList(
      //     //   delegate: SliverChildBuilderDelegate(
      //     //     (context, index) {
      //     //       return const Matches();
      //     //     },
      //     //     childCount: 1,
      //     //   ),
      //     // ),
      //   ],
      // ),
    );
  }

  myContainer() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(14.0))),
      child: const Column(
        children: [
          Text(
            "Live",
            style: TextStyle(fontSize: 12.0, color: Colors.black),
          ),
          Text(
            "14 Sep",
            style: TextStyle(fontSize: 12.0, color: Colors.black),
          ),
        ],
      ),
    );
  }

  myRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        const SizedBox(width: defaultPadding),
        myContainer(),
        const SizedBox(width: defaultPadding),
        myContainer(),
        const SizedBox(width: defaultPadding),
        myContainer(),
        const SizedBox(width: defaultPadding),
        myContainer(),
        const SizedBox(width: defaultPadding),
        myContainer(),
        const SizedBox(width: defaultPadding),
        myContainer(),
      ]),
    );
  }
}

class MyProfileHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget myProfile;
  MyProfileHeaderDelegate({required this.myProfile});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return myProfile;
  }

  @override
  double get maxExtent => 60.0;
  @override
  double get minExtent => 60.0;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
