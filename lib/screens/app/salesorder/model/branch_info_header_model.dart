// To parse this JSON data, do
//
//     final companyBranch = companyBranchFromJson(jsonString);

import 'dart:convert';

CompanyBranch companyBranchFromJson(String str) =>
    CompanyBranch.fromJson(json.decode(str));

String companyBranchToJson(CompanyBranch data) => json.encode(data.toJson());

class CompanyBranch {
  Result? result;
  dynamic targetUrl;
  bool? success;
  dynamic error;
  bool? unAuthorizedRequest;
  bool? abp;

  CompanyBranch({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  factory CompanyBranch.fromJson(Map<String, dynamic> json) => CompanyBranch(
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
  String? companyName;
  dynamic description;
  String? addressOne;
  dynamic addressTwo;
  dynamic place;
  dynamic city;
  String? state;
  String? pincode;
  dynamic companyEmail;
  String? contactPhone;
  String? branchGsttin;
  String? branchName;
  dynamic branchAddress1;
  String? branchLocation;
  String? branchMobile;
  String? branchCity;
  String? branchState;
  String? logoFilePath;
  dynamic panno;
  dynamic country;
  dynamic cin;
  dynamic fssai;
  dynamic qrCodeFilePath;
  dynamic qrCodeFileName;
  int? branchId;
  dynamic branchFssaiNumber;
  dynamic branchTollFreeNumber;
  num? totalStockValue;
  num? avgTotalStockValue;
  num? lastTotalStockValue;
  dynamic companyWebsite;
  num? lowestTotalStockValue;
  dynamic unitName;

  Result({
    this.companyName,
    this.description,
    this.addressOne,
    this.addressTwo,
    this.place,
    this.city,
    this.state,
    this.pincode,
    this.companyEmail,
    this.contactPhone,
    this.branchGsttin,
    this.branchName,
    this.branchAddress1,
    this.branchLocation,
    this.branchMobile,
    this.branchCity,
    this.branchState,
    this.logoFilePath,
    this.panno,
    this.country,
    this.cin,
    this.fssai,
    this.qrCodeFilePath,
    this.qrCodeFileName,
    this.branchId,
    this.branchFssaiNumber,
    this.branchTollFreeNumber,
    this.totalStockValue,
    this.avgTotalStockValue,
    this.lastTotalStockValue,
    this.companyWebsite,
    this.lowestTotalStockValue,
    this.unitName,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        companyName: json["companyName"],
        description: json["description"],
        addressOne: json["addressOne"],
        addressTwo: json["addressTwo"],
        place: json["place"],
        city: json["city"],
        state: json["state"],
        pincode: json["pincode"],
        companyEmail: json["companyEmail"],
        contactPhone: json["contactPhone"],
        branchGsttin: json["branchGSTTIN"],
        branchName: json["branchName"],
        branchAddress1: json["branchAddress1"],
        branchLocation: json["branchLocation"],
        branchMobile: json["branchMobile"],
        branchCity: json["branchCity"],
        branchState: json["branchState"],
        logoFilePath: json["logoFilePath"],
        panno: json["panno"],
        country: json["country"],
        cin: json["cin"],
        fssai: json["fssai"],
        qrCodeFilePath: json["qrCodeFilePath"],
        qrCodeFileName: json["qrCodeFileName"],
        branchId: json["branchId"],
        branchFssaiNumber: json["branchFssaiNumber"],
        branchTollFreeNumber: json["branchTollFreeNumber"],
        totalStockValue: json["totalStockValue"],
        avgTotalStockValue: json["avgTotalStockValue"],
        lastTotalStockValue: json["lastTotalStockValue"],
        companyWebsite: json["companyWebsite"],
        lowestTotalStockValue: json["lowestTotalStockValue"],
        unitName: json["unitName"],
      );

  Map<String, dynamic> toJson() => {
        "companyName": companyName,
        "description": description,
        "addressOne": addressOne,
        "addressTwo": addressTwo,
        "place": place,
        "city": city,
        "state": state,
        "pincode": pincode,
        "companyEmail": companyEmail,
        "contactPhone": contactPhone,
        "branchGSTTIN": branchGsttin,
        "branchName": branchName,
        "branchAddress1": branchAddress1,
        "branchLocation": branchLocation,
        "branchMobile": branchMobile,
        "branchCity": branchCity,
        "branchState": branchState,
        "logoFilePath": logoFilePath,
        "panno": panno,
        "country": country,
        "cin": cin,
        "fssai": fssai,
        "qrCodeFilePath": qrCodeFilePath,
        "qrCodeFileName": qrCodeFileName,
        "branchId": branchId,
        "branchFssaiNumber": branchFssaiNumber,
        "branchTollFreeNumber": branchTollFreeNumber,
        "totalStockValue": totalStockValue,
        "avgTotalStockValue": avgTotalStockValue,
        "lastTotalStockValue": lastTotalStockValue,
        "companyWebsite": companyWebsite,
        "lowestTotalStockValue": lowestTotalStockValue,
        "unitName": unitName,
      };
}
