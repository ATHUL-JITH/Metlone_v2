import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:metlonev2_app/screens/app/setup/services.dart';
import 'package:metlonev2_app/screens/app/setup/users.dart';

class Setup extends StatefulWidget {
  const Setup({Key? key}) : super(key: key);

  @override
  State<Setup> createState() => _SetupState();
}

class _SetupState extends State<Setup> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('FFFFFF'),
      body: Column(
        children: [
          Container(
            color: Colors.white, // Customize the container's color
            child: TabBar(
              tabs: [
                Tab(text: 'Users'),
                Tab(text: 'Services'),
              ],
              controller: _tabController,
              labelColor: Colors.black,
              indicatorColor: Colors.blue,
              unselectedLabelColor: Colors.black.withOpacity(0.5),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                Users(),
                Services(),
              ],
              controller: _tabController,
            ),
          ),
        ],
      ),
    );
  }
}
