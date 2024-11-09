// To parse this JSON data, do
//
//     final totalRevenue = totalRevenueFromJson(jsonString);

import 'dart:convert';

TotalRevenue totalRevenueFromJson(String str) =>
    TotalRevenue.fromJson(json.decode(str));

String totalRevenueToJson(TotalRevenue data) => json.encode(data.toJson());

class TotalRevenue {
  Map<String, num> result;
  dynamic targetUrl;
  bool success;
  dynamic error;
  bool unAuthorizedRequest;
  bool abp;

  TotalRevenue({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  factory TotalRevenue.fromJson(Map<String, dynamic> json) => TotalRevenue(
        result:
            Map.from(json["result"]).map((k, v) => MapEntry<String, num>(k, v)),
        targetUrl: json["targetUrl"],
        success: json["success"],
        error: json["error"],
        unAuthorizedRequest: json["unAuthorizedRequest"],
        abp: json["__abp"],
      );

  Map<String, dynamic> toJson() => {
        "result":
            Map.from(result).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "targetUrl": targetUrl,
        "success": success,
        "error": error,
        "unAuthorizedRequest": unAuthorizedRequest,
        "__abp": abp,
      };
}
