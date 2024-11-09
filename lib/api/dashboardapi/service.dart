// To parse this JSON data, do
//
//     final service = serviceFromJson(jsonString);

import 'dart:convert';

Service serviceFromJson(String str) => Service.fromJson(json.decode(str));

String serviceToJson(Service data) => json.encode(data.toJson());

class Service {
  Result result;
  String? targetUrl;
  bool? success;
  String? error;
  bool? unAuthorizedRequest;
  bool? abp;

  Service({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
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
  int? dailyPendingServicesCount;
  int? dailyDeliveredServicesCount;
  int? dailyTotalServicesCount;
  int? weeklyPendingServicesCount;
  int? weeklyDeliveredServicesCount;
  int? weeklyTotalServicesCount;
  int? monthlyPendingServicesCount;
  int? monthlyDeliveredServicesCount;
  int? monthlyTotalServicesCount;

  Result({
    required this.dailyPendingServicesCount,
    required this.dailyDeliveredServicesCount,
    required this.dailyTotalServicesCount,
    required this.weeklyPendingServicesCount,
    required this.weeklyDeliveredServicesCount,
    required this.weeklyTotalServicesCount,
    required this.monthlyPendingServicesCount,
    required this.monthlyDeliveredServicesCount,
    required this.monthlyTotalServicesCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        dailyPendingServicesCount: json["dailyPendingServicesCount"],
        dailyDeliveredServicesCount: json["dailyDeliveredServicesCount"],
        dailyTotalServicesCount: json["dailyTotalServicesCount"],
        weeklyPendingServicesCount: json["weeklyPendingServicesCount"],
        weeklyDeliveredServicesCount: json["weeklyDeliveredServicesCount"],
        weeklyTotalServicesCount: json["weeklyTotalServicesCount"],
        monthlyPendingServicesCount: json["monthlyPendingServicesCount"],
        monthlyDeliveredServicesCount: json["monthlyDeliveredServicesCount"],
        monthlyTotalServicesCount: json["monthlyTotalServicesCount"],
      );

  Map<String, dynamic> toJson() => {
        "dailyPendingServicesCount": dailyPendingServicesCount,
        "dailyDeliveredServicesCount": dailyDeliveredServicesCount,
        "dailyTotalServicesCount": dailyTotalServicesCount,
        "weeklyPendingServicesCount": weeklyPendingServicesCount,
        "weeklyDeliveredServicesCount": weeklyDeliveredServicesCount,
        "weeklyTotalServicesCount": weeklyTotalServicesCount,
        "monthlyPendingServicesCount": monthlyPendingServicesCount,
        "monthlyDeliveredServicesCount": monthlyDeliveredServicesCount,
        "monthlyTotalServicesCount": monthlyTotalServicesCount,
      };
}
