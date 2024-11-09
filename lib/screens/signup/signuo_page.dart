import 'package:flutter/material.dart';
import 'package:metlonev2_app/screens/app/dashboard/dashboard_screen..dart';
import 'package:metlonev2_app/screens/signup/provider/signup_provider.dart';
import 'package:provider/provider.dart';

import '../../style/colors_class.dart';
import '../../style/text_field_widget.dart';
import '../../style/text_style_class.dart';
import '../../style/theme_button.dart';
import 'email_page.dart';

class SignupMobile extends StatefulWidget {
  const SignupMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupMobile> createState() => _SignupMobileState();
}

class _SignupMobileState extends State<SignupMobile> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _companyNameController = TextEditingController();
  final _phoneNoController = TextEditingController();
  final _emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorClass.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Container(
                // height: 430,
                // margin: const EdgeInsets.only(left: 92.0, right: 92.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    2.0,
                  ),
                  color: ColorClass.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(
                        0.0,
                        1.0,
                      ), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.only(
                                  left: 30.0,
                                  right: 0.0,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Create Your Account',
                                      maxLines: null,
                                      style: TextStyleClass.jakarthaBlackBold14,
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      'Enter your details to create your account',
                                      maxLines: null,
                                      style: TextStyleClass.jakarthaBlackBold14,
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                )),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              flex: 1,
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: ColorClass.primaryColor,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(
                                          500,
                                        ),
                                        // topLeft: Radius.circular(500),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 0.0,
                          right: 0.0,
                        ),
                        height: 430,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                          color: ColorClass.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 20),
                                TextFieldWidget(
                                  validator: (val) {
                                    if (val!.isEmpty || val == '') {
                                      return 'Please enter the first name';
                                    }
                                  },
                                  labelWidget: RichText(
                                    text: const TextSpan(
                                      text: 'First Name',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'SF_Regular',
                                        color: ColorClass.textColor,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'SF_Regular',
                                            color: ColorClass.redColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  controller: _firstNameController,
                                  textInputType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                ),
                                const SizedBox(height: 10),
                                TextFieldWidget(
                                  validator: (val) {
                                    if (val!.isEmpty || val == '') {
                                      return 'Please enter the last name';
                                    }
                                  },
                                  labelWidget: RichText(
                                    text: const TextSpan(
                                      text: 'Last Name',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'SF_Regular',
                                        color: ColorClass.textColor,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'SF_Regular',
                                            color: ColorClass.redColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  controller: _lastNameController,
                                  textInputType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                ),
                                const SizedBox(height: 10),
                                TextFieldWidget(
                                  validator: (val) {
                                    if (val!.isEmpty || val == '') {
                                      return 'Please enter the company name';
                                    }
                                  },
                                  labelWidget: RichText(
                                    text: const TextSpan(
                                      text: 'Company Name',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'SF_Regular',
                                        color: ColorClass.textColor,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'SF_Regular',
                                            color: ColorClass.redColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  controller: _companyNameController,
                                  textInputType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                ),
                                const SizedBox(height: 10),
                                TextFieldWidget(
                                  validator: (val) {
                                    if (val!.isEmpty || val == '') {
                                      return 'Please enter a email address';
                                    }
                                  },
                                  labelWidget: RichText(
                                    text: const TextSpan(
                                      text: 'Email',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'SF_Regular',
                                        color: ColorClass.textColor,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'SF_Regular',
                                            color: ColorClass.redColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  controller: _emailController,
                                  textInputType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                ),
                                const SizedBox(height: 10),
                                TextFieldWidget(
                                  validator: (val) {
                                    if (val!.isEmpty || val == '') {
                                      return 'Please enter a phone number';
                                    } else if (val.length != 10) {
                                      return 'Please enter a valid phone number';
                                    }
                                  },
                                  labelWidget: RichText(
                                    text: TextSpan(
                                      text: 'Phone.no',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'SF_Regular',
                                        color: ColorClass.textColor,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'SF_Regular',
                                            color: ColorClass.redColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  controller: _phoneNoController,
                                  textInputType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  obscureText: false,
                                ),
                                const SizedBox(height: 10),
                                Consumer<SignUpProvider>(
                                    builder: (context, snapshot, _) {
                                  return ThemeButton(
                                    height: 40,
                                    label: 'Create account',
                                    loading: snapshot.isLoading,
                                    function: () {
                                      FocusScope.of(context).unfocus();
                                      if (formKey.currentState!.validate()) {
                                        snapshot
                                            .sendMailAPICall(
                                              context: context,
                                              firstName:
                                                  _firstNameController.text,
                                              lastName:
                                                  _lastNameController.text,
                                              companyName:
                                                  _companyNameController.text,
                                              email: _emailController.text,
                                              phoneNo: _phoneNoController.text,
                                            )
                                            .then(
                                              (value) => emailConfirmation(
                                                context: context,
                                                onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const DashBoard(),
                                                  ),
                                                ),
                                              ),
                                            );
                                      }
                                    },
                                  );
                                }),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
