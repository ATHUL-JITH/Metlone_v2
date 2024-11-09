// To parse this JSON data, do
//
//     final paymentForGraph = paymentForGraphFromJson(jsonString);

import 'dart:convert';

PaymentForGraph paymentForGraphFromJson(String str) =>
    PaymentForGraph.fromJson(json.decode(str));

String paymentForGraphToJson(PaymentForGraph data) =>
    json.encode(data.toJson());

class PaymentForGraph {
  List<Result>? result;
  dynamic targetUrl;
  bool? success;
  dynamic error;
  bool? unAuthorizedRequest;
  bool? abp;

  PaymentForGraph({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  factory PaymentForGraph.fromJson(Map<String, dynamic> json) =>
      PaymentForGraph(
        result: json["result"] == null
            ? []
            : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
        targetUrl: json["targetUrl"],
        success: json["success"],
        error: json["error"],
        unAuthorizedRequest: json["unAuthorizedRequest"],
        abp: json["__abp"],
      );

  Map<String, dynamic> toJson() => {
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
        "targetUrl": targetUrl,
        "success": success,
        "error": error,
        "unAuthorizedRequest": unAuthorizedRequest,
        "__abp": abp,
      };
}

class Result {
  dynamic userName;
  dynamic mobile;
  DateTime? date;
  dynamic saleNo;
  num? rate;
  num? paymentMode;
  String? monthName;
  num? cash;
  num? upi;
  num? card;
  num? month;
  num? paymentId;

  Result({
    required this.userName,
    required this.mobile,
    required this.date,
    required this.saleNo,
    required this.rate,
    required this.paymentMode,
    required this.monthName,
    required this.cash,
    required this.upi,
    required this.card,
    required this.month,
    required this.paymentId,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        userName: json["userName"],
        mobile: json["mobile"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        saleNo: json["saleNo"],
        rate: json["rate"],
        paymentMode: json["paymentMode"],
        monthName: json["monthName"],
        cash: json["cash"],
        upi: json["upi"],
        card: json["card"],
        month: json["month"],
        paymentId: json["paymentId"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "mobile": mobile,
        "date": date?.toIso8601String(),
        "saleNo": saleNo,
        "rate": rate,
        "paymentMode": paymentMode,
        "monthName": monthName,
        "cash": cash,
        "upi": upi,
        "card": card,
        "month": month,
        "paymentId": paymentId,
      };
}
