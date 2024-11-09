// To parse this JSON data, do
//
//     final createInvoice = createInvoiceFromJson(jsonString);

import 'dart:convert';

CreateInvoice createInvoiceFromJson(String str) =>
    CreateInvoice.fromJson(json.decode(str));

String createInvoiceToJson(CreateInvoice data) => json.encode(data.toJson());

class CreateInvoice {
  List<Result>? result;
  dynamic targetUrl;
  bool? success;
  dynamic error;
  bool? unAuthorizedRequest;
  bool? abp;

  CreateInvoice({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  factory CreateInvoice.fromJson(Map<String, dynamic> json) => CreateInvoice(
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
  String? name;
  String? email;
  String? mobile;
  String? phone;
  dynamic contactPersonName;
  dynamic contactPersonPhone;
  int? creditLimit;
  dynamic discountPercentage;
  bool? isWholeSaleCustomer;
  bool? isCreateUser;
  int? userId;
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
  int? openingBalanceAmount;
  dynamic customerTaxType;
  dynamic rating;
  dynamic executiveId;
  dynamic areaAndPlaceId;
  bool? isBranchCustomer;
  dynamic distributorName;
  bool? isSalesCustomer;
  String? mobileCode;
  String? phoneCode;
  int? id;

  Result({
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
    this.isSalesCustomer,
    this.mobileCode,
    this.phoneCode,
    this.id,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
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
        isSalesCustomer: json["isSalesCustomer"],
        mobileCode: json["mobileCode"],
        phoneCode: json["phoneCode"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
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
        "isSalesCustomer": isSalesCustomer,
        "mobileCode": mobileCode,
        "phoneCode": phoneCode,
        "id": id,
      };
}
