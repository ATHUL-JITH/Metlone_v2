import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/api_support.dart';
import '../model/delete_model.dart';
import '../model/newservice_model.dart';
import '../model/service_model.dart';
import '../model/user_model.dart';

class UserProvider extends ChangeNotifier {
  final TextEditingController serviceController = TextEditingController();
  final TextEditingController rateController = TextEditingController();

  bool getUserProviderDetailsLoading = false;
  bool getServiceDetailsLoading = false;
  bool getCreateOrEditDetailsLoading = false;
  bool getDeleteDetailsLoading = false;
  bool getEditDetailsLoading = false;

  User? userCreate;
  CreateorEdit? create0rEdit;
  SearchFilter? serviceCreate;
  Delete? deletee;

  // set setName(String newValue) {
  //   CreateorEdit?.name = newValue;
  //   notifyListeners();
  // }

  Future<void> getUserProviderDetails({
    required BuildContext context,
    required int skipCount,
  }) async {
    try {
      getUserProviderDetailsLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");
      String loanId = preferences.getString('referenceId') ?? '0';

      /// url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl + ApiSupport.getUsers,
      );

      /// headers
      final Map<String, String> headers =
          ApiSupport.headers(token: token, origin: true);

      ///body
      final body = {
        "filter": "",
        "permissions": [],
        "onlyLockedUsers": false,
        "sorting": "",
        "maxResultCount": 10,
        "skipCount": 0,
      };

      /// response
      final Response response =
          await post(url, body: json.encode(body), headers: headers);
      log(url.toString());
      userCreate = null;
      notifyListeners();
      if (response.statusCode == 200) {
        log("RESPONSE  ${response.body}");
        userCreate = userFromJson(response.body);
        getUserProviderDetailsLoading = false;
        notifyListeners();
      } else {
        getUserProviderDetailsLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      getUserProviderDetailsLoading = false;
      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }

  Future<void> getServiceDetails({
    required BuildContext context,
    required name,
  }) async {
    try {
      getServiceDetailsLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");
      String loanId = preferences.getString('referenceId') ?? '0';

      /// url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl + ApiSupport.getAll(name: name),
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
        serviceCreate = searchFilterFromJson(response.body);
        getServiceDetailsLoading = false;
        notifyListeners();
      } else {
        getServiceDetailsLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      getServiceDetailsLoading = false;
      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }

  Future<void> getCreateOrEditDetails(
      {required BuildContext context, required id}) async {
    try {
      getCreateOrEditDetailsLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");

      /// url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl + ApiSupport.createOrEdit,
      );

      /// headers
      final Map<String, String> headers =
          ApiSupport.headers(token: token, origin: true);

      ///body
      final body = {
        "name": serviceController.text,
        "defaultRate": rateController.text,
        "taxList": {
          "items": [
            {"value": "540", "displayText": "GST 5 %", "isSelected": false},
            {"value": "541", "displayText": "GST 12 %", "isSelected": false},
            {"value": "542", "displayText": "GST 18 %", "isSelected": false},
            {"value": "543", "displayText": "GST 28 %", "isSelected": false},
            {"value": "594", "displayText": "gh", "isSelected": false}
          ]
        },
        "branchId": 0,
        "tenantId": 0,
        "companyId": 0,
        "isSittingService": false,
        "id": id
      };

      /// response
      final Response response =
          await post(url, body: json.encode(body), headers: headers);
      log(url.toString());
      // userCreate = null;
      notifyListeners();
      if (response.statusCode == 200) {
        log("RESPONSE  ${response.body}");
        serviceController.clear();
        rateController.clear();
        getServiceDetails(context: context, name: '');
        getCreateOrEditDetailsLoading = false;
        notifyListeners();

        // notifyListeners();
      } else {
        getCreateOrEditDetailsLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      getCreateOrEditDetailsLoading = false;
      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }

  Future<void> getDeleteDetails({
    required BuildContext context,
    required id,
  }) async {
    try {
      getDeleteDetailsLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");
      String loanId = preferences.getString('referenceId') ?? '0';

      /// url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl + ApiSupport.delete(id: id),
      );

      /// headers
      final Map<String, String> headers =
          ApiSupport.headers(token: token, origin: true);

      ///body
      final body = {
        'id': id,
      };

      /// response
      final Response response =
          await delete(url, body: json.encode(body), headers: headers);
      log(json.encode(body).toString());
      // userCreate = null;
      notifyListeners();
      if (response.statusCode == 200) {
        log("RESPONSE  ${response.body}");
        getServiceDetails(context: context, name: '');
        getDeleteDetailsLoading = false;
        Navigator.pop(context);
        FloatingSnackBar(
          message: 'Deleted successfully',
          context: context,
          textColor: Colors.black,
          textStyle: const TextStyle(color: Colors.red),
          duration: const Duration(milliseconds: 4000),
          backgroundColor: Colors.white,
        );

        notifyListeners();

        // notifyListeners();
      } else if (response.statusCode == 500) {
        if (json.decode(response.body)['error'] != null) {
          FloatingSnackBar(
            message:
                '${json.decode(response.body)['error']['details'].toString()} ',
            context: context,
            textColor: Colors.black,
            textStyle: const TextStyle(color: Colors.red),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: Colors.white,
          );
          // SnackBar(
          //   content: Text(
          //     json.decode(response.body)['error']['details'].toString(),
          //   ),
          // );
        } else {
          log(json.decode(response.body)['error'].toString());
        }
      } else {
        getDeleteDetailsLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      getDeleteDetailsLoading = false;
      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }
}
