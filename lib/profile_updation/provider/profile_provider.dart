import 'dart:convert';
import 'dart:developer';

import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import 'package:metlonev2_app/profile_updation/model/my_settings_model.dart';
import 'package:metlonev2_app/profile_updation/model/update_password_model.dart';
import 'package:metlonev2_app/profile_updation/model/update_user_profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/api_support.dart';
import '../model/change_password_model.dart';

class ProfileProvider extends ChangeNotifier {
  bool getMySettingsLoading = false;
  MySettings? mySettings;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController surNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();
  Future<void> getMySettings({
    required BuildContext context,
  }) async {
    try {
      getMySettingsLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");

      /// url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl + ApiSupport.mySettings,
      );

      /// headers
      final Map<String, String> headers =
          ApiSupport.headers(token: token, origin: true);

      /// response
      final Response response = await get(url, headers: headers);
      log(url.toString());
      // userCreate = null;
      notifyListeners();
      if (response.statusCode == 200) {
        log("RESPONSE  ${response.body}");
        mySettings = mySettingsFromJson(response.body);
        firstNameController.text = mySettings?.result.name ?? '';
        surNameController.text = mySettings?.result.surname ?? '';
        emailController.text = mySettings?.result.emailAddress ?? '';
        userNameController.text = mySettings?.result.userName ?? '';
        getMySettingsLoading = false;
        notifyListeners();
      } else {
        getMySettingsLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      getMySettingsLoading = false;
      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }

  ///updateCurrentUserProfile
  bool updateUserprofileLoading = false;
  UpdateUserProfile? updateUserProfile;
  Future<void> getUpdateUserProfile({
    required BuildContext context,
  }) async {
    try {
      updateUserprofileLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");

      /// url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl + ApiSupport.updateUserProfile,
      );

      /// headers
      final Map<String, String> headers =
          ApiSupport.headers(token: token, origin: true);

      ///body
      final body = {
        "name": firstNameController.text,
        "surname": surNameController.text,
        "userName": userNameController.text,
        "emailAddress": emailController.text,
        "phoneNumber": '',
        "isPhoneNumberConfirmed": false,
        "timezone": '',
        "qrCodeSetupImageUrl": "",
        "isGoogleAuthenticatorEnabled": false
      };
      log("Request body  ${json.encode(body)}");

      /// response
      final Response response =
          await put(url, body: json.encode(body), headers: headers);
      log(url.toString());

      notifyListeners();
      if (response.statusCode == 200) {
        log("RESPONSE  ${response.body}");
        updateUserProfile = updateUserProfileFromJson(response.body);
        updateUserprofileLoading = false;
        notifyListeners();
        getMySettings(context: context).then((value) => Navigator.pop(context));
      } else {
        updateUserprofileLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      updateUserprofileLoading = false;
      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }

  ///UpdatePassword
  bool getUpdatePasswordLoading = true;
  UpdatePassword? updatePassword;
  Future<void> getUpdatePassword({
    required BuildContext context,
  }) async {
    try {
      getUpdatePasswordLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");

      /// url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl + ApiSupport.changePassword,
      );

      /// headers
      final Map<String, String> headers =
          ApiSupport.headers(token: token, origin: true);

      ///body
      final body = {
        "currentPassword": currentPasswordController.text,
        "newPassword": newPasswordController.text
      };
      log("Request body  ${json.encode(body)}");

      /// response
      final Response response =
          await post(url, body: json.encode(body), headers: headers);
      log(url.toString());

      notifyListeners();
      if (response.statusCode == 200) {
        log("RESPONSE  ${response.body}");
        updatePassword = updatePasswordFromJson(response.body);
        getUpdatePasswordLoading = false;
        notifyListeners();
        FloatingSnackBar(message: 'Password updated', context: context);
        Navigator.pop(context);
        currentPasswordController.clear();
        newPasswordController.clear();
      } else {
        getUpdatePasswordLoading = false;
        notifyListeners();
        log('${response.body}response here');
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      getUpdatePasswordLoading = false;
      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }
}
