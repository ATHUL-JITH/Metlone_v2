import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/api_support.dart';
import '../../app/login/provider/login_provider.dart';

class SignUpProvider with ChangeNotifier {
  bool isLoading = false;
  Future<void> sendMailAPICall({
    required BuildContext context,
    required String firstName,
    required String lastName,
    required String companyName,
    required String email,
    required String phoneNo,
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      /// LOGIN PROVIDER
      final LoginProvider loginProvider = context.read<LoginProvider>();

      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String? subject;
      subject = "Email from restaurant mobile application";

      ///URL
      Uri url = Uri.parse(
        ApiSupport.baseUrl +
            ApiSupport.sendMail(
                email: "jithu.krishna@grit-stone.com", subject: subject),
      );

      ///Request body
      final requestBody = {
        'firstName': firstName,
        'lastName': lastName,
        'companyName': companyName,
        'email': email,
        'phoneNumber': phoneNo,
      };

      ///HEADERS
      // final Map<String, String> headers = ApiSupport.header(
      //     token: loginProvider.loginSuccessModel!.result.accessToken);

      ///REQUEST
      log('URL : ' + url.toString());
      // log('Headers : ' + headers.toString());
      log('\nRequest Body' + requestBody.toString());

      final Response response = await post(url, body: requestBody);
      log('Response Status' + response.statusCode.toString());
      log('Response Body' + response.body);

      if (response.statusCode == 200) {
        // showCustomToast("Send Successfully");
        isLoading = false;
        notifyListeners();
      } else if (response.statusCode == 400) {
        log('Response Status' + response.statusCode.toString());
        print(response.reasonPhrase);
        // showCustomToast("Unable to send, Try again later.");
        isLoading = false;

        notifyListeners();
      } else {
        // showCustomToast("=====500======");
        print(response.reasonPhrase);
        debugPrint(response.statusCode.toString());
        // showCustomToast("Unable to send, Try again later.");
        isLoading = false;

        notifyListeners();
      }
    } catch (e) {
      // showCustomToast(e.toString());
      notifyListeners();
      rethrow;
    }
  }
}
