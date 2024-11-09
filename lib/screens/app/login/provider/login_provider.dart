import 'dart:convert';
import 'dart:developer';

import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/api_support.dart';
import '../../../landingscreen/provider/landing_page_screen.dart';
import '../model/login_model.dart';
import '../model/login_success_model.dart';

final TextEditingController emailController =
    TextEditingController(text: 'ptqa');
final TextEditingController passwordController =
    TextEditingController(text: '123456');

class LoginProvider with ChangeNotifier {
  Login? _loginDetails;
  LoginSuccessModel? _loginSuccessModel;
  bool isAdmin = false;
  bool getLoginDetailsLoading = false;
  Future<void> getLoginDetails({
    required String userName,
    required String password,
    required BuildContext context,
  }) async {
    try {
      // isLoading = true;
      getLoginDetailsLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      // log("TOKEN $token");

      ///url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl + ApiSupport.authenticate,
      );

      /// headers
      final Map<String, String> headers = ApiSupport.headers(origin: true);

      ///body
      final body = {
        "userNameOrEmailAddress": userName,
        "password": password,
        "rememberClient": false,
        "singleSignIn": false,
        "returnUrl": '',
        "captchaResponse": ''
      };

      /// response
      final Response response = await post(
        url,
        body: json.encode(body),
        headers: headers,
      );
      log(url.toString());

      if (response.statusCode == 200) {
        log("RESPONSE  ${response.body}");
        _loginSuccessModel = loginSuccessModelFromJson(response.body);
        preferences.setString(
            'token', _loginSuccessModel?.result.accessToken ?? '');
        _loginSuccessModel = loginSuccessModelFromJson(response.body);
        if (_loginSuccessModel?.result.accessToken != null) {
          preferences.setString(
              'token', _loginSuccessModel?.result.accessToken.toString() ?? '');
        }
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LandingPage()));
        getLoginDetailsLoading = false;
        notifyListeners();
      } else {
        getLoginDetailsLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
        FloatingSnackBar(
          message: 'Invalid Credentials',
          context: context,
          textColor: Colors.black,
          textStyle: const TextStyle(color: Colors.red),
          duration: const Duration(milliseconds: 4000),
          backgroundColor: Colors.white,
        );
      }
    } catch (e) {
      getLoginDetailsLoading = false;
      log('Error caught in login $e');
      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }

  clearState() {
    emailController.clear();
    passwordController.clear();

    notifyListeners();
  }
}


