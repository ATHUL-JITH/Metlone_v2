// To parse this JSON data, do
//
//     final createNewCustomer = createNewCustomerFromJson(jsonString);

import 'dart:convert';

CreateNewCustomer createNewCustomerFromJson(String str) =>
    CreateNewCustomer.fromJson(json.decode(str));

String createNewCustomerToJson(CreateNewCustomer data) =>
    json.encode(data.toJson());

class CreateNewCustomer {
  Result result;
  dynamic targetUrl;
  bool success;
  dynamic error;
  bool unAuthorizedRequest;
  bool abp;

  CreateNewCustomer({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  factory CreateNewCustomer.fromJson(Map<String, dynamic> json) =>
      CreateNewCustomer(
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
  int branchId;
  int companyId;
  int tenantId;
  String name;
  dynamic email;
  String mobile;
  bool isNonTax;
  int customerTaxTypeId;
  int gstRegistrationType;
  dynamic gsttin;
  bool isEstimate;
  String mobileCode;
  dynamic phoneCode;
  dynamic phone;
  int id;

  Result({
    required this.branchId,
    required this.companyId,
    required this.tenantId,
    required this.name,
    required this.email,
    required this.mobile,
    required this.isNonTax,
    required this.customerTaxTypeId,
    required this.gstRegistrationType,
    required this.gsttin,
    required this.isEstimate,
    required this.mobileCode,
    required this.phoneCode,
    required this.phone,
    required this.id,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        branchId: json["branchId"],
        companyId: json["companyId"],
        tenantId: json["tenantId"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        isNonTax: json["isNonTax"],
        customerTaxTypeId: json["customerTaxTypeId"],
        gstRegistrationType: json["gstRegistrationType"],
        gsttin: json["gsttin"],
        isEstimate: json["isEstimate"],
        mobileCode: json["mobileCode"],
        phoneCode: json["phoneCode"],
        phone: json["phone"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "branchId": branchId,
        "companyId": companyId,
        "tenantId": tenantId,
        "name": name,
        "email": email,
        "mobile": mobile,
        "isNonTax": isNonTax,
        "customerTaxTypeId": customerTaxTypeId,
        "gstRegistrationType": gstRegistrationType,
        "gsttin": gsttin,
        "isEstimate": isEstimate,
        "mobileCode": mobileCode,
        "phoneCode": phoneCode,
        "phone": phone,
        "id": id,
      };
}
