// To parse this JSON data, do
//
//     final mySettings = mySettingsFromJson(jsonString);

import 'dart:convert';

MySettings mySettingsFromJson(String str) =>
    MySettings.fromJson(json.decode(str));

String mySettingsToJson(MySettings data) => json.encode(data.toJson());

class MySettings {
  Result result;
  dynamic targetUrl;
  bool success;
  dynamic error;
  bool unAuthorizedRequest;
  bool abp;

  MySettings({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  factory MySettings.fromJson(Map<String, dynamic> json) => MySettings(
        result: Result.fromJson(json["result"]),
        targetUrl: json["targetUrl"],
        success: json["success"],
        error: json["error"],
        unAuthorizedRequest: json["unAuthorizedRequest"],
        abp: json["__abp"],
      );

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
        "targetUrl": targetUrl,
        "success": success,
        "error": error,
        "unAuthorizedRequest": unAuthorizedRequest,
        "__abp": abp,
      };
}

class Result {
  String name;
  String surname;
  String userName;
  String emailAddress;
  dynamic phoneNumber;
  bool isPhoneNumberConfirmed;
  dynamic timezone;
  String qrCodeSetupImageUrl;
  bool isGoogleAuthenticatorEnabled;

  Result({
    required this.name,
    required this.surname,
    required this.userName,
    required this.emailAddress,
    required this.phoneNumber,
    required this.isPhoneNumberConfirmed,
    required this.timezone,
    required this.qrCodeSetupImageUrl,
    required this.isGoogleAuthenticatorEnabled,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        surname: json["surname"],
        userName: json["userName"],
        emailAddress: json["emailAddress"],
        phoneNumber: json["phoneNumber"],
        isPhoneNumberConfirmed: json["isPhoneNumberConfirmed"],
        timezone: json["timezone"],
        qrCodeSetupImageUrl: json["qrCodeSetupImageUrl"],
        isGoogleAuthenticatorEnabled: json["isGoogleAuthenticatorEnabled"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "userName": userName,
        "emailAddress": emailAddress,
        "phoneNumber": phoneNumber,
        "isPhoneNumberConfirmed": isPhoneNumberConfirmed,
        "timezone": timezone,
        "qrCodeSetupImageUrl": qrCodeSetupImageUrl,
        "isGoogleAuthenticatorEnabled": isGoogleAuthenticatorEnabled,
      };
}
