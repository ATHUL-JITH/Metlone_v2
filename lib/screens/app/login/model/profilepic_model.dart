// To parse this JSON data, do
//
//     final profilePicture = profilePictureFromJson(jsonString);

import 'dart:convert';

ProfilePicture profilePictureFromJson(String str) =>
    ProfilePicture.fromJson(json.decode(str));

String profilePictureToJson(ProfilePicture data) => json.encode(data.toJson());

class ProfilePicture {
  Result result;
  dynamic targetUrl;
  bool success;
  dynamic error;
  bool unAuthorizedRequest;
  bool abp;

  ProfilePicture({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  factory ProfilePicture.fromJson(Map<String, dynamic> json) => ProfilePicture(
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
  String profilePicture;

  Result({
    required this.profilePicture,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        profilePicture: json["profilePicture"],
      );

  Map<String, dynamic> toJson() => {
        "profilePicture": profilePicture,
      };
}
