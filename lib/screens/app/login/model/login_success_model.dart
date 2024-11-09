// To parse this JSON data, do
//
//     final loginSuccessModel = loginSuccessModelFromJson(jsonString);

import 'dart:convert';

LoginSuccessModel loginSuccessModelFromJson(String str) =>
    LoginSuccessModel.fromJson(json.decode(str));

String loginSuccessModelToJson(LoginSuccessModel data) =>
    json.encode(data.toJson());

class LoginSuccessModel {
  Result result;
  dynamic targetUrl;
  bool success;
  dynamic error;
  bool unAuthorizedRequest;
  bool abp;

  LoginSuccessModel({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  factory LoginSuccessModel.fromJson(Map<String, dynamic> json) =>
      LoginSuccessModel(
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
  String accessToken;
  String encryptedAccessToken;
  int expireInSeconds;
  bool shouldResetPassword;
  dynamic passwordResetCode;
  int userId;
  bool requiresTwoFactorVerification;
  dynamic twoFactorAuthProviders;
  dynamic twoFactorRememberClientToken;
  String returnUrl;
  String refreshToken;
  int refreshTokenExpireInSeconds;
  bool isCounterOpen;

  Result({
    required this.accessToken,
    required this.encryptedAccessToken,
    required this.expireInSeconds,
    required this.shouldResetPassword,
    required this.passwordResetCode,
    required this.userId,
    required this.requiresTwoFactorVerification,
    required this.twoFactorAuthProviders,
    required this.twoFactorRememberClientToken,
    required this.returnUrl,
    required this.refreshToken,
    required this.refreshTokenExpireInSeconds,
    required this.isCounterOpen,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        accessToken: json["accessToken"],
        encryptedAccessToken: json["encryptedAccessToken"],
        expireInSeconds: json["expireInSeconds"],
        shouldResetPassword: json["shouldResetPassword"],
        passwordResetCode: json["passwordResetCode"],
        userId: json["userId"],
        requiresTwoFactorVerification: json["requiresTwoFactorVerification"],
        twoFactorAuthProviders: json["twoFactorAuthProviders"],
        twoFactorRememberClientToken: json["twoFactorRememberClientToken"],
        returnUrl: json["returnUrl"],
        refreshToken: json["refreshToken"],
        refreshTokenExpireInSeconds: json["refreshTokenExpireInSeconds"],
        isCounterOpen: json["isCounterOpen"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "encryptedAccessToken": encryptedAccessToken,
        "expireInSeconds": expireInSeconds,
        "shouldResetPassword": shouldResetPassword,
        "passwordResetCode": passwordResetCode,
        "userId": userId,
        "requiresTwoFactorVerification": requiresTwoFactorVerification,
        "twoFactorAuthProviders": twoFactorAuthProviders,
        "twoFactorRememberClientToken": twoFactorRememberClientToken,
        "returnUrl": returnUrl,
        "refreshToken": refreshToken,
        "refreshTokenExpireInSeconds": refreshTokenExpireInSeconds,
        "isCounterOpen": isCounterOpen,
      };
}
