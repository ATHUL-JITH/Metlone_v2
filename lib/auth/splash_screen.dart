// import 'dart:developer';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../screens/app/dashboard/dashboard_screen..dart';
//
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     Future.microtask(() => authValidate());
//     super.initState();
//   }
//
//   void authValidate() {
//     Timer(const Duration(seconds: 1), () async {
//       AuthProvider loginProvider =
//           Provider.of<AuthProvider>(context, listen: false);
//       SharedPreferences preferences = await SharedPreferences.getInstance();
//       String? userName = preferences.getString("username");
//       String? password = preferences.getString("password");
//       if (userName != null && password != null) {
//         loginProvider.authenticateUser(userName, password, context);
//       } else {
//         log("No user found");
//         Navigator.push(
//           context,
//           CupertinoPageRoute(
//             builder: (ctx) => const DashBoard(),
//           ),
//         );
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: ColorClass.white,
//         width: double.infinity,
//         height: double.infinity,
//         child: Center(
//           child: SvgPicture.asset(
//             IconClass.logo,
//             height: 50,
//           ),
//         ),
//       ),
//     );
//   }
// }
