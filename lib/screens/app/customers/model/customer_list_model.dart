// To parse this JSON data, do
//
//     final customerList = customerListFromJson(jsonString);

import 'dart:convert';

CustomerList customerListFromJson(String str) =>
    CustomerList.fromJson(json.decode(str));

String customerListToJson(CustomerList data) => json.encode(data.toJson());

class CustomerList {
  Result? result;
  dynamic targetUrl;
  bool? success;
  dynamic error;
  bool? unAuthorizedRequest;
  bool? abp;

  CustomerList({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  factory CustomerList.fromJson(Map<String, dynamic> json) => CustomerList(
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
  num? id;
  String? name;
  String? email;
  String? mobile;
  String? phone;
  dynamic contactPersonName;
  dynamic contactPersonPhone;
  num? creditLimit;
  dynamic discountPercentage;
  bool? isWholeSaleCustomer;
  bool? isCreateUser;
  num? userId;
  String? custCode;
  bool? isAuthorized;
  dynamic place;
  bool? showforAllBranches;
  dynamic address1;
  dynamic address2;
  dynamic city;
  String? gsttin;
  dynamic pincode;
  dynamic taxRegrNo;
  dynamic cstRegNo;
  dynamic panNo;
  dynamic state;
  dynamic adhar;
  num? openingBalanceAmount;
  dynamic customerTaxType;
  dynamic rating;
  dynamic executiveId;
  dynamic areaAndPlaceId;
  bool? isBranchCustomer;
  dynamic distributorName;
  dynamic paymentTerms;
  dynamic currencyMasterName;
  dynamic executiveName;
  dynamic areaAndPlaceName;
  bool? isSalesCustomer;
  String? mobileCode;
  String? phoneCode;

  Item({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.phone,
    this.contactPersonName,
    this.contactPersonPhone,
    this.creditLimit,
    this.discountPercentage,
    this.isWholeSaleCustomer,
    this.isCreateUser,
    this.userId,
    this.custCode,
    this.isAuthorized,
    this.place,
    this.showforAllBranches,
    this.address1,
    this.address2,
    this.city,
    this.gsttin,
    this.pincode,
    this.taxRegrNo,
    this.cstRegNo,
    this.panNo,
    this.state,
    this.adhar,
    this.openingBalanceAmount,
    this.customerTaxType,
    this.rating,
    this.executiveId,
    this.areaAndPlaceId,
    this.isBranchCustomer,
    this.distributorName,
    this.paymentTerms,
    this.currencyMasterName,
    this.executiveName,
    this.areaAndPlaceName,
    this.isSalesCustomer,
    this.mobileCode,
    this.phoneCode,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        phone: json["phone"],
        contactPersonName: json["contactPersonName"],
        contactPersonPhone: json["contactPersonPhone"],
        creditLimit: json["creditLimit"],
        discountPercentage: json["discountPercentage"],
        isWholeSaleCustomer: json["isWholeSaleCustomer"],
        isCreateUser: json["isCreateUser"],
        userId: json["userId"],
        custCode: json["custCode"],
        isAuthorized: json["isAuthorized"],
        place: json["place"],
        showforAllBranches: json["showforAllBranches"],
        address1: json["address1"],
        address2: json["address2"],
        city: json["city"],
        gsttin: json["gsttin"],
        pincode: json["pincode"],
        taxRegrNo: json["taxRegrNo"],
        cstRegNo: json["cstRegNo"],
        panNo: json["panNo"],
        state: json["state"],
        adhar: json["adhar"],
        openingBalanceAmount: json["openingBalanceAmount"],
        customerTaxType: json["customerTaxType"],
        rating: json["rating"],
        executiveId: json["executiveId"],
        areaAndPlaceId: json["areaAndPlaceId"],
        isBranchCustomer: json["isBranchCustomer"],
        distributorName: json["distributorName"],
        paymentTerms: json["paymentTerms"],
        currencyMasterName: json["currencyMasterName"],
        executiveName: json["executiveName"],
        areaAndPlaceName: json["areaAndPlaceName"],
        isSalesCustomer: json["isSalesCustomer"],
        mobileCode: json["mobileCode"],
        phoneCode: json["phoneCode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "phone": phone,
        "contactPersonName": contactPersonName,
        "contactPersonPhone": contactPersonPhone,
        "creditLimit": creditLimit,
        "discountPercentage": discountPercentage,
        "isWholeSaleCustomer": isWholeSaleCustomer,
        "isCreateUser": isCreateUser,
        "userId": userId,
        "custCode": custCode,
        "isAuthorized": isAuthorized,
        "place": place,
        "showforAllBranches": showforAllBranches,
        "address1": address1,
        "address2": address2,
        "city": city,
        "gsttin": gsttin,
        "pincode": pincode,
        "taxRegrNo": taxRegrNo,
        "cstRegNo": cstRegNo,
        "panNo": panNo,
        "state": state,
        "adhar": adhar,
        "openingBalanceAmount": openingBalanceAmount,
        "customerTaxType": customerTaxType,
        "rating": rating,
        "executiveId": executiveId,
        "areaAndPlaceId": areaAndPlaceId,
        "isBranchCustomer": isBranchCustomer,
        "distributorName": distributorName,
        "paymentTerms": paymentTerms,
        "currencyMasterName": currencyMasterName,
        "executiveName": executiveName,
        "areaAndPlaceName": areaAndPlaceName,
        "isSalesCustomer": isSalesCustomer,
        "mobileCode": mobileCode,
        "phoneCode": phoneCode,
      };
}
