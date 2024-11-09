// To parse this JSON data, do
//
//     final updatePassword = updatePasswordFromJson(jsonString);

import 'dart:convert';

UpdatePassword updatePasswordFromJson(String str) =>
    UpdatePassword.fromJson(json.decode(str));

String updatePasswordToJson(UpdatePassword data) => json.encode(data.toJson());

class UpdatePassword {
  dynamic result;
  dynamic targetUrl;
  bool success;
  dynamic error;
  bool unAuthorizedRequest;
  bool abp;

  UpdatePassword({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  factory UpdatePassword.fromJson(Map<String, dynamic> json) => UpdatePassword(
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
