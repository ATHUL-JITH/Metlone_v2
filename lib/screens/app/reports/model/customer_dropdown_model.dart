// To parse this JSON data, do
//
//     final customerDropdowns = customerDropdownsFromJson(jsonString);

import 'dart:convert';

CustomerDropdowns customerDropdownsFromJson(String str) =>
    CustomerDropdowns.fromJson(json.decode(str));

String customerDropdownsToJson(CustomerDropdowns data) =>
    json.encode(data.toJson());

class CustomerDropdowns {
  Result? result;
  dynamic targetUrl;
  bool? success;
  dynamic error;
  bool? unAuthorizedRequest;
  bool? abp;

  CustomerDropdowns({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  factory CustomerDropdowns.fromJson(Map<String, dynamic> json) =>
      CustomerDropdowns(
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
  int? id;
  String? displayName;
  bool? isDefault;
  bool? isDealer;
  int? stateId;
  StateName? stateName;

  Item({
    this.id,
    this.displayName,
    this.isDefault,
    this.isDealer,
    this.stateId,
    this.stateName,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        displayName: json["displayName"],
        isDefault: json["isDefault"],
        isDealer: json["isDealer"],
        stateId: json["stateId"],
        stateName: stateNameValues.map[json["stateName"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "displayName": displayName,
        "isDefault": isDefault,
        "isDealer": isDealer,
        "stateId": stateId,
        "stateName": stateNameValues.reverse[stateName],
      };
}

enum StateName { KERALA }

final stateNameValues = EnumValues({"Kerala": StateName.KERALA});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
