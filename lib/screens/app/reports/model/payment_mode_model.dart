// To parse this JSON data, do
//
//     final paymentmode = paymentmodeFromJson(jsonString);

import 'dart:convert';

Paymentmode paymentmodeFromJson(String str) =>
    Paymentmode.fromJson(json.decode(str));

String paymentmodeToJson(Paymentmode data) => json.encode(data.toJson());

class Paymentmode {
  Result? result;
  dynamic targetUrl;
  bool? success;
  dynamic error;
  bool? unAuthorizedRequest;
  bool? abp;

  Paymentmode({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  factory Paymentmode.fromJson(Map<String, dynamic> json) => Paymentmode(
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
  num? totalRate;
  List<PaymentModeReport>? paymentModeReports;

  Result({
    this.totalRate,
    this.paymentModeReports,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        totalRate: json["totalRate"],
        paymentModeReports: json["paymentModeReports"] == null
            ? []
            : List<PaymentModeReport>.from(json["paymentModeReports"]!
                .map((x) => PaymentModeReport.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalRate": totalRate,
        "paymentModeReports": paymentModeReports == null
            ? []
            : List<dynamic>.from(paymentModeReports!.map((x) => x.toJson())),
      };
}

class PaymentModeReport {
  String? userName;
  String? mobile;
  DateTime? date;
  String? saleNo;
  num? rate;
  int? paymentMode;
  dynamic monthName;
  num? cash;
  num? upi;
  num? card;
  num? month;
  int? paymentId;

  PaymentModeReport({
    this.userName,
    this.mobile,
    this.date,
    this.saleNo,
    this.rate,
    this.paymentMode,
    this.monthName,
    this.cash,
    this.upi,
    this.card,
    this.month,
    this.paymentId,
  });

  factory PaymentModeReport.fromJson(Map<String, dynamic> json) =>
      PaymentModeReport(
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
