import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:metlonev2_app/screens/app/customers/customers_list.dart';
import 'package:metlonev2_app/screens/app/dashboard/dashboard_screen..dart';
import 'package:metlonev2_app/screens/app/reports/reports_page.dart';
import 'package:metlonev2_app/screens/app/setup/setup_page.dart';
import 'package:provider/provider.dart';

import '../../../profile_updation/change_password.dart';
import '../../../profile_updation/change_profile.dart';
import '../../../profile_updation/my_setting.dart';
import '../../app/dashboard/provider/dashboard_provider.dart';
import '../../app/login/login_page_screen.dart';
import '../../app/salesorder/salesorder.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    Future.microtask(() async {});
    super.initState();
  }

  int index = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _buildBody = <Widget>[
    const DashBoard(),
    const SalesOrder(),
    const CustomersPage(),
    const ReportsPage(),
    const Setup(),
  ];

  @override
  Widget build(BuildContext context) {
    late Uint8List _bytesImage;
    String _imgString =
        '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';

    _bytesImage = Base64Decoder().convert(_imgString);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.blue,
              )),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Image.asset(
            'images/metlone_logo.png',
            width: 160,
          )),
      drawer: Consumer<DashBoardProvider>(
        builder: (context, provider, child) {
          return SafeArea(
            child: Drawer(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: provider.getProfilePicLoading
                            ? const CircularProgressIndicator()
                            : CircleAvatar(
                                radius: 50,
                                backgroundImage: Image.memory(Base64Decoder()
                                        .convert(provider.profilePicture!.result
                                            .profilePicture))
                                    .image,
                                // backgroundImage: NetworkImage(profilePic(
                                //     path: provider.profilePicture!.result
                                //         .profilePicture)),
                              ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2, color: HexColor('2E8BD4')),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tileColor: HexColor('2E8BD4'),
                      leading: const Icon(Icons.settings, color: Colors.white),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MySettings(),
                            ));
                      },
                      title: const Text('My Settings',
                          style: TextStyle(fontSize: 15, color: Colors.white)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2, color: HexColor('2E8BD4')),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tileColor: HexColor('2E8BD4'),
                      leading:
                          const Icon(Icons.add_a_photo, color: Colors.white),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ChangeProfilePicture(),
                            ));
                      },
                      title: const Text('Change Profile Picture',
                          style: TextStyle(fontSize: 15, color: Colors.white)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2, color: HexColor('2E8BD4')),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tileColor: HexColor('2E8BD4'),
                      leading: const Icon(Icons.password, color: Colors.white),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChangePassword(),
                            ));
                      },
                      title: const Text('Change Password',
                          style: TextStyle(fontSize: 15, color: Colors.white)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2, color: HexColor('2E8BD4')),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tileColor: HexColor('2E8BD4'),
                      leading: const Icon(Icons.logout, color: Colors.white),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ));
                      },
                      title: const Text('Log Out',
                          style: TextStyle(fontSize: 15, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      body: IndexedStack(
        index: index,
        children: _buildBody,
      ),
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.white,
          currentIndex: index,
          onTap: (x) {
            setState(() {
              index = x;
            });
          },
          items: menuItemList
              .map((MenuItem menuItem) => BottomNavigationBarItem(
                  backgroundColor: HexColor('2E8BD4'),
                  icon: Icon(
                    menuItem.iconData,
                    color: Colors.white,
                  ),
                  label: menuItem.text))
              .toList()),
    );
  }
}

class MenuItem {
  const MenuItem(this.iconData, this.text);

  final IconData iconData;
  final String text;
}

final menuItemList = <MenuItem>[
  const MenuItem(Icons.dashboard, 'DashBoard'),
  const MenuItem(Icons.request_page, 'Sales Order'),
  const MenuItem(Icons.people, 'Customers'),
  const MenuItem(Icons.insert_drive_file, 'Reports'),
  const MenuItem(Icons.miscellaneous_services, 'Setup'),
];
