import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:metlonev2_app/screens/app/login/provider/login_provider.dart';
import 'package:metlonev2_app/screens/signup/signuo_page.dart';
import 'package:metlonev2_app/style/colors_class.dart';
import 'package:provider/provider.dart';

import '../../../style/text_field_widget.dart';
import '../../../style/text_style_class.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  // bool isLoading = false;
  @override
  // void _handleClick() {
  //   setState(() {
  //     isLoading = false;
  //   });
  //   Future.delayed(Duration(seconds: 1), () {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   });
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Consumer<LoginProvider>(
          builder: (context, provider, child) {
            return SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/login.png'),
                        const Center(
                          child: Text(
                            'LOG IN ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: TextFieldWidget(
                            label: 'UserName or Email',
                            controller: emailController,
                            textInputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            focusNode: emailFocusNode,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the username and password';
                              }
                              return null;
                            },
                            obscureText: false,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: TextFieldWidget(
                            obscureText: true,
                            label: 'Password',
                            controller: passwordController,
                            textInputType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            focusNode: passwordFocusNode,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the username and password';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (emailController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Please enter the username or email'),
                                ),
                              );
                            } else if (passwordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please enter the password'),
                                ),
                              );
                            } else {
                              provider.getLoginDetails(
                                context: context,
                                password: passwordController.text,
                                userName: emailController.text,
                              );
                            }
                          },
                          child: InkWell(
                            // onTap: _handleClick,
                            child: Container(
                              padding: EdgeInsets.all(20),
                              margin: EdgeInsets.symmetric(horizontal: 25),
                              decoration: BoxDecoration(
                                color: ColorClass.blueGreen,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              width: double.infinity,
                              child: provider.getLoginDetailsLoading
                                  ? const SpinKitWave(
                                      color: Colors.white,
                                      size: 20,
                                    )
                                  : const Center(
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                            ),
                          ),

                          // child: Container(
                          //   padding: EdgeInsets.all(20),
                          //   margin: EdgeInsets.symmetric(horizontal: 25),
                          //   decoration: BoxDecoration(
                          //     color: HexColor('2E8BD4'),
                          //     borderRadius: BorderRadius.circular(8),
                          //   ),
                          //   width: double.infinity,
                          //   child: const Center(
                          //     child: Text(
                          //       'Login',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 16),
                          //     ),
                          //   ),
                          // ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 20,
                            top: 20,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupMobile()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "New User?",
                                  style: TextStyleClass.jakarthaBlack12
                                      .copyWith(fontSize: 14),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Create an Account',
                                  style: TextStyleClass.jakarthaBlack12
                                      .copyWith(fontSize: 14),
                                  // textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:metlonev2_app/screens/app/login/provider/login_provider.dart';
// import 'package:metlonev2_app/screens/signup/signuo_page.dart';
// import 'package:metlonev2_app/style/colors_class.dart';
// import 'package:provider/provider.dart';
//
// import '../../../style/text_field_widget.dart';
// import '../../../style/text_style_class.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   bool isLoading = false;
//   // bool isLoading = false;
//   // @override
//   // void _handleClick() {
//   //   setState(() {
//   //     isLoading = true;
//   //   });
//   //   Future.delayed(Duration(seconds: 2), () {
//   //     setState(() {
//   //       isLoading = false;
//   //     });
//   //   });
//   // }
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   final FocusNode emailFocusNode = FocusNode();
//   final FocusNode passwordFocusNode = FocusNode();
//   bool isChecked = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: FocusScope.of(context).unfocus,
//       child: Scaffold(
//         body: Consumer<LoginProvider>(
//           builder: (context, provider, child) {
//             return SafeArea(
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 child: Padding(
//                   padding: const EdgeInsets.all(25.0),
//                   child: Center(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset('images/login.png'),
//                         const Center(
//                           child: Text(
//                             'LOG IN ',
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 30,
//                                 fontWeight: FontWeight.w900),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 50,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 25),
//                           child: TextFieldWidget(
//                             label: 'UserName or Email',
//                             controller: emailController,
//                             textInputType: TextInputType.emailAddress,
//                             textInputAction: TextInputAction.next,
//                             focusNode: emailFocusNode,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter the username and password';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 25,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 25),
//                           child: TextFieldWidget(
//                             label: 'Password',
//                             controller: passwordController,
//                             textInputType: TextInputType.visiblePassword,
//                             textInputAction: TextInputAction.done,
//                             focusNode: passwordFocusNode,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter the username and password';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 25,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             if (emailController.text.isEmpty) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text(
//                                       'Please enter the username or email'),
//                                 ),
//                               );
//                             } else if (passwordController.text.isEmpty) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text('Please enter the password'),
//                                 ),
//                               );
//                             } else {
//                               provider.getLoginDetails(
//                                 context: context,
//                                 password: passwordController.text,
//                                 userName: emailController.text,
//                               );
//                             }
//                           },
//                           child: InkWell(
//                             // onTap: _handleClick,
//                             child: Container(
//                               padding: EdgeInsets.all(20),
//                               margin: EdgeInsets.symmetric(horizontal: 25),
//                               decoration: BoxDecoration(
//                                 color: ColorClass.blueGreen,
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               width: double.infinity,
//                               child: isLoading
//                                   ? const SpinKitWave(
//                                       color: Colors.white,
//                                       size: 20,
//                                     )
//                                   : const Center(
//                                       child: Text(
//                                         'Login',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 16,
//                                         ),
//                                       ),
//                                     ),
//                             ),
//                           ),
//
//                           // child: Container(
//                           //   padding: EdgeInsets.all(20),
//                           //   margin: EdgeInsets.symmetric(horizontal: 25),
//                           //   decoration: BoxDecoration(
//                           //     color: HexColor('2E8BD4'),
//                           //     borderRadius: BorderRadius.circular(8),
//                           //   ),
//                           //   width: double.infinity,
//                           //   child: const Center(
//                           //     child: Text(
//                           //       'Login',
//                           //       style: TextStyle(
//                           //           color: Colors.white,
//                           //           fontWeight: FontWeight.bold,
//                           //           fontSize: 16),
//                           //     ),
//                           //   ),
//                           // ),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(
//                             bottom: 20,
//                             top: 20,
//                           ),
//                           child: GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const SignupMobile()));
//                             },
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   "New User?",
//                                   style: TextStyleClass.jakarthaBlack12
//                                       .copyWith(fontSize: 14),
//                                 ),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 Text(
//                                   'Create an Account',
//                                   style: TextStyleClass.jakarthaBlack12
//                                       .copyWith(fontSize: 14),
//                                   // textAlign: TextAlign.right,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//

// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:metlonev2_app/screens/app/dashboard/dashboard_screen..dart';
// import 'package:metlonev2_app/screens/app/login/provider/login_provider.dart';
// import 'package:metlonev2_app/style/colors_class.dart';
// import 'package:provider/provider.dart';
//
// import '../../../style/text_field_widget.dart';
// import '../../../style/text_style_class.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   bool isLoading = false;
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   void _handleLogin(BuildContext context) {
//     if (emailController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Please enter the username or email'),
//         ),
//       );
//     } else if (passwordController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Please enter the password'),
//         ),
//       );
//     } else {
//       // Call the login provider method to handle login logic
//       Provider.of<LoginProvider>(context, listen: false).getLoginDetails(
//         context: context,
//         password: passwordController.text,
//         userName: emailController.text,
//       );
//       setState(() {
//         isLoading = true;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         body: Consumer<LoginProvider>(
//           builder: (context, provider, child) {
//             return SafeArea(
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 child: Padding(
//                   padding: const EdgeInsets.all(25.0),
//                   child: Center(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset('images/login.png'),
//                         const Center(
//                           child: Text(
//                             'LOG IN ',
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 30,
//                                 fontWeight: FontWeight.w900),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 50,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 25),
//                           child: TextFieldWidget(
//                             label: 'UserName or Email',
//                             controller: emailController,
//                             textInputType: TextInputType.emailAddress,
//                             textInputAction: TextInputAction.next,
//                             obscureText: false,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 25,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 25),
//                           child: TextFieldWidget(
//                             label: 'Password',
//                             controller: passwordController,
//                             textInputType: TextInputType.visiblePassword,
//                             textInputAction: TextInputAction.done,
//                             obscureText: true,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 25,
//                         ),
//                         GestureDetector(
//                           // onTap: () => _handleLogin(context),
//                           child: Container(
//                             padding: const EdgeInsets.all(20),
//                             margin: const EdgeInsets.symmetric(horizontal: 25),
//                             decoration: BoxDecoration(
//                               color: ColorClass.blueGreen,
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             width: double.infinity,
//                             child: isLoading
//                                 ? const SpinKitWave(
//                                     color: Colors.white,
//                                     size: 20,
//                                   )
//                                 : const Center(
//                                     child: Text(
//                                       'Login',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 16,
//                                       ),
//                                     ),
//                                   ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(
//                             bottom: 20,
//                             top: 20,
//                           ),
//                           child: GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => DashBoard(),
//                                 ),
//                               );
//                             },
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   "New User?",
//                                   style: TextStyleClass.jakarthaBlack12
//                                       .copyWith(fontSize: 14),
//                                 ),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 Text(
//                                   'Create an Account',
//                                   style: TextStyleClass.jakarthaBlack12
//                                       .copyWith(fontSize: 14),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
// Future<void> _handleLogin() async {}
