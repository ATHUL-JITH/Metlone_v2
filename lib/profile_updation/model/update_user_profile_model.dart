// To parse this JSON data, do
//
//     final updateUserProfile = updateUserProfileFromJson(jsonString);

import 'dart:convert';

UpdateUserProfile updateUserProfileFromJson(String str) =>
    UpdateUserProfile.fromJson(json.decode(str));

String updateUserProfileToJson(UpdateUserProfile data) =>
    json.encode(data.toJson());

class UpdateUserProfile {
  dynamic result;
  dynamic targetUrl;
  bool success;
  dynamic error;
  bool unAuthorizedRequest;
  bool abp;

  UpdateUserProfile({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  factory UpdateUserProfile.fromJson(Map<String, dynamic> json) =>
      UpdateUserProfile(
        result: json["result"],
        targetUrl: json["targetUrl"],
        success: json["success"],
        error: json["error"],
        unAuthorizedRequest: json["unAuthorizedRequest"],
        abp: json["__abp"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "targetUrl": targetUrl,
        "success": success,
        "error": error,
        "unAuthorizedRequest": unAuthorizedRequest,
        "__abp": abp,
      };
}
