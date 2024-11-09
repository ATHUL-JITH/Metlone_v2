// To parse this JSON data, do
//
//     final branchSettingInfoModel = branchSettingInfoModelFromJson(jsonString);

import 'dart:convert';

BranchSettingInfoModel branchSettingInfoModelFromJson(String str) =>
    BranchSettingInfoModel.fromJson(json.decode(str));

String branchSettingInfoModelToJson(BranchSettingInfoModel data) =>
    json.encode(data.toJson());

class BranchSettingInfoModel {
  Result? result;
  dynamic targetUrl;
  bool? success;
  dynamic error;
  bool? unAuthorizedRequest;
  bool? abp;

  BranchSettingInfoModel({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  factory BranchSettingInfoModel.fromJson(Map<String, dynamic> json) =>
      BranchSettingInfoModel(
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
  String? uniqueDataId;
  bool? emailSaleInvoice;
  dynamic emailPassword;
  bool? smsSaleInvoice;
  String? branchEmail;
  String? branchName;
  num? branchId;
  num? companyId;
  bool? isBranchDate;
  bool? isPurchaseBatchAuto;
  bool? isSerialNoAuto;
  num? taxtype;
  DateTime? branchDate;
  num? currencyDecimal;
  bool? authorized;
  bool? isSaleRateFlexible;
  bool? sameItemsmultipletimes;
  bool? allowNegativeStock;
  bool? actasHub;
  double? estimationAmount;
  bool? isShiftRequired;
  String? mobile;
  dynamic gsttin;
  String? pincode;
  dynamic state;
  dynamic city;
  String? parentCode;
  dynamic financialYearMasterId;
  dynamic location;
  dynamic companyName;

  Result({
    this.uniqueDataId,
    this.emailSaleInvoice,
    this.emailPassword,
    this.smsSaleInvoice,
    this.branchEmail,
    this.branchName,
    this.branchId,
    this.companyId,
    this.isBranchDate,
    this.isPurchaseBatchAuto,
    this.isSerialNoAuto,
    this.taxtype,
    this.branchDate,
    this.currencyDecimal,
    this.authorized,
    this.isSaleRateFlexible,
    this.sameItemsmultipletimes,
    this.allowNegativeStock,
    this.actasHub,
    this.estimationAmount,
    this.isShiftRequired,
    this.mobile,
    this.gsttin,
    this.pincode,
    this.state,
    this.city,
    this.parentCode,
    this.financialYearMasterId,
    this.location,
    this.companyName,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        uniqueDataId: json["uniqueDataID"],
        emailSaleInvoice: json["emailSaleInvoice"],
        emailPassword: json["emailPassword"],
        smsSaleInvoice: json["smsSaleInvoice"],
        branchEmail: json["branchEmail"],
        branchName: json["branchName"],
        branchId: json["branchId"],
        companyId: json["companyId"],
        isBranchDate: json["isBranchDate"],
        isPurchaseBatchAuto: json["isPurchaseBatchAuto"],
        isSerialNoAuto: json["isSerialNoAuto"],
        taxtype: json["taxtype"],
        branchDate: json["branchDate"] == null
            ? null
            : DateTime.parse(json["branchDate"]),
        currencyDecimal: json["currencyDecimal"],
        authorized: json["authorized"],
        isSaleRateFlexible: json["isSaleRateFlexible"],
        sameItemsmultipletimes: json["sameItemsmultipletimes"],
        allowNegativeStock: json["allowNegativeStock"],
        actasHub: json["actasHub"],
        estimationAmount: json["estimationAmount"],
        isShiftRequired: json["isShiftRequired"],
        mobile: json["mobile"],
        gsttin: json["gsttin"],
        pincode: json["pincode"],
        state: json["state"],
        city: json["city"],
        parentCode: json["parentCode"],
        financialYearMasterId: json["financialYearMasterId"],
        location: json["location"],
        companyName: json["companyName"],
      );

  Map<String, dynamic> toJson() => {
        "uniqueDataID": uniqueDataId,
        "emailSaleInvoice": emailSaleInvoice,
        "emailPassword": emailPassword,
        "smsSaleInvoice": smsSaleInvoice,
        "branchEmail": branchEmail,
        "branchName": branchName,
        "branchId": branchId,
        "companyId": companyId,
        "isBranchDate": isBranchDate,
        "isPurchaseBatchAuto": isPurchaseBatchAuto,
        "isSerialNoAuto": isSerialNoAuto,
        "taxtype": taxtype,
        "branchDate": branchDate?.toIso8601String(),
        "currencyDecimal": currencyDecimal,
        "authorized": authorized,
        "isSaleRateFlexible": isSaleRateFlexible,
        "sameItemsmultipletimes": sameItemsmultipletimes,
        "allowNegativeStock": allowNegativeStock,
        "actasHub": actasHub,
        "estimationAmount": estimationAmount,
        "isShiftRequired": isShiftRequired,
        "mobile": mobile,
        "gsttin": gsttin,
        "pincode": pincode,
        "state": state,
        "city": city,
        "parentCode": parentCode,
        "financialYearMasterId": financialYearMasterId,
        "location": location,
        "companyName": companyName,
      };
}
