import 'dart:io';

import 'package:flutter/material.dart';
import 'package:metlonev2_app/profile_updation/provider/profile_provider.dart';
import 'package:metlonev2_app/screens/app/customers/provider/customer_provider.dart';
import 'package:metlonev2_app/screens/app/dashboard/provider/dashboard_provider.dart';
import 'package:metlonev2_app/screens/app/login/login_page_screen.dart';
import 'package:metlonev2_app/screens/app/login/provider/login_provider.dart';
import 'package:metlonev2_app/screens/app/reports/provider/reports_provider.dart';
import 'package:metlonev2_app/screens/app/salesorder/provider/salesorder_provider.dart';
import 'package:metlonev2_app/screens/app/setup/provider/user_provider.dart';
import 'package:metlonev2_app/screens/signup/provider/signup_provider.dart';
import 'package:metlonev2_app/style/colors_class.dart';
import 'package:metlonev2_app/utils/http_util/http_utils.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ChangeNotifierProvider(create: (_) => DashBoardProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => SalesOrderProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => CustomerProvider()),
        ChangeNotifierProvider(create: (_) => ReportsProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Phototech',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: ColorClass.white,
          fontFamily: "Jakartha",
        ),
        home: const LoginPage(),
      ),
    );
  }
}
