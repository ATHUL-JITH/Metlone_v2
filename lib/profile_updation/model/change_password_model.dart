// To parse this JSON data, do
//
//     final getChangePassword = getChangePasswordFromJson(jsonString);

import 'dart:convert';

GetChangePassword getChangePasswordFromJson(String str) =>
    GetChangePassword.fromJson(json.decode(str));

String getChangePasswordToJson(GetChangePassword data) =>
    json.encode(data.toJson());

class GetChangePassword {
  Result result;
  dynamic targetUrl;
  bool success;
  dynamic error;
  bool unAuthorizedRequest;
  bool abp;

  GetChangePassword({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  factory GetChangePassword.fromJson(Map<String, dynamic> json) =>
      GetChangePassword(
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
  Setting setting;

  Result({
    required this.setting,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        setting: Setting.fromJson(json["setting"]),
      );

  Map<String, dynamic> toJson() => {
        "setting": setting.toJson(),
      };
}

class Setting {
  bool requireDigit;
  bool requireLowercase;
  bool requireNonAlphanumeric;
  bool requireUppercase;
  int requiredLength;

  Setting({
    required this.requireDigit,
    required this.requireLowercase,
    required this.requireNonAlphanumeric,
    required this.requireUppercase,
    required this.requiredLength,
  });

  factory Setting.fromJson(Map<String, dynamic> json) => Setting(
        requireDigit: json["requireDigit"],
        requireLowercase: json["requireLowercase"],
        requireNonAlphanumeric: json["requireNonAlphanumeric"],
        requireUppercase: json["requireUppercase"],
        requiredLength: json["requiredLength"],
      );

  Map<String, dynamic> toJson() => {
        "requireDigit": requireDigit,
        "requireLowercase": requireLowercase,
        "requireNonAlphanumeric": requireNonAlphanumeric,
        "requireUppercase": requireUppercase,
        "requiredLength": requiredLength,
      };
}
