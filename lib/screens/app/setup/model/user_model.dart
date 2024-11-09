// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  Result? result;
  dynamic targetUrl;
  bool? success;
  dynamic error;
  bool? unAuthorizedRequest;
  bool? abp;

  User({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
        targetUrl: json["targetUrl"],
        success: json["success"],
        error: json["error"],
        unAuthorizedRequest: json["unAuthorizedRequest"],
        abp: json["__abp"],
      );

  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
        "targetUrl": targetUrl,
        "success": success,
        "error": error,
        "unAuthorizedRequest": unAuthorizedRequest,
        "__abp": abp,
      };
}

class Result {
  int? totalCount;
  List<Item>? items;

  Result({
    this.totalCount,
    this.items,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        totalCount: json["totalCount"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  String? name;
  String? surname;
  String? userName;
  String? emailAddress;
  String? phoneNumber;
  String? profilePictureId;
  bool? isEmailConfirmed;
  List<Role>? roles;
  bool? isActive;
  DateTime? creationTime;
  int? id;

  Item({
    this.name,
    this.surname,
    this.userName,
    this.emailAddress,
    this.phoneNumber,
    this.profilePictureId,
    this.isEmailConfirmed,
    this.roles,
    this.isActive,
    this.creationTime,
    this.id,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"],
        surname: json["surname"],
        userName: json["userName"],
        emailAddress: json["emailAddress"],
        phoneNumber: json["phoneNumber"],
        profilePictureId: json["profilePictureId"],
        isEmailConfirmed: json["isEmailConfirmed"],
        roles: json["roles"] == null
            ? []
            : List<Role>.from(json["roles"]!.map((x) => Role.fromJson(x))),
        isActive: json["isActive"],
        creationTime: json["creationTime"] == null
            ? null
            : DateTime.parse(json["creationTime"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "userName": userName,
        "emailAddress": emailAddress,
        "phoneNumber": phoneNumber,
        "profilePictureId": profilePictureId,
        "isEmailConfirmed": isEmailConfirmed,
        "roles": roles == null
            ? []
            : List<dynamic>.from(roles!.map((x) => x.toJson())),
        "isActive": isActive,
        "creationTime": creationTime?.toIso8601String(),
        "id": id,
      };
}

class Role {
  int? roleId;
  String? roleName;

  Role({
    this.roleId,
    this.roleName,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        roleId: json["roleId"],
        roleName: json["roleName"],
      );

  Map<String, dynamic> toJson() => {
        "roleId": roleId,
        "roleName": roleName,
      };
}
