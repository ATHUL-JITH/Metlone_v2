// To parse this JSON data, do
//
//     final customersListDetails = customersListDetailsFromJson(jsonString);

import 'dart:convert';

CustomersListDetails customersListDetailsFromJson(String str) =>
    CustomersListDetails.fromJson(json.decode(str));

String customersListDetailsToJson(CustomersListDetails data) =>
    json.encode(data.toJson());

class CustomersListDetails {
  Result result;
  dynamic targetUrl;
  bool success;
  dynamic error;
  bool unAuthorizedRequest;
  bool abp;

  CustomersListDetails({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  factory CustomersListDetails.fromJson(Map<String, dynamic> json) =>
      CustomersListDetails(
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
  int totalCount;
  List<Item> items;

  Result({
    required this.totalCount,
    required this.items,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        totalCount: json["totalCount"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  String salesNo;
  DateTime invoiceDate;
  DateTime salesDate;
  num? totalAmount;
  num? totalDiscount;
  num? specialDiscount;
  num? freightCharge;
  num? otherCharge;
  num? roundOff;
  num? status;
  bool invoicefromTally;
  num? customerId;
  num? totalTaxWithCess;
  num? totalCess;
  dynamic transportationMode;
  dynamic vehicleNo;
  dynamic placeOfSupply;
  dynamic shippingName;
  dynamic shippingAddress1;
  dynamic shippingAddress2;
  dynamic shippingGstinNo;
  dynamic shippingState;
  num? totalCentralCess;
  num? totalTaxWithCentralCess;
  dynamic invoiceNo;
  dynamic paymentType;
  bool isDefault;
  dynamic financialYearMasterId;
  dynamic salesOrderId;
  dynamic customerName;
  dynamic customerRating;
  num? id;
  dynamic displayName;
  bool editStatus;
  num? outCount;
  num? totalCessMasterAmount;
  num? totalSum;
  bool isJsonDownloaded;
  dynamic jsonDownloadDate;
  dynamic einvoiceStatus;
  dynamic items;
  dynamic remarks;
  int deliveryStatus;
  int detailsCount;
  dynamic phoneNumber;
  bool isEstimate;
  bool isOpening;
  dynamic mobileCode;

  Item({
    required this.salesNo,
    required this.invoiceDate,
    required this.salesDate,
    required this.totalAmount,
    required this.totalDiscount,
    required this.specialDiscount,
    required this.freightCharge,
    required this.otherCharge,
    required this.roundOff,
    required this.status,
    required this.invoicefromTally,
    required this.customerId,
    required this.totalTaxWithCess,
    required this.totalCess,
    required this.transportationMode,
    required this.vehicleNo,
    required this.placeOfSupply,
    required this.shippingName,
    required this.shippingAddress1,
    required this.shippingAddress2,
    required this.shippingGstinNo,
    required this.shippingState,
    required this.totalCentralCess,
    required this.totalTaxWithCentralCess,
    required this.invoiceNo,
    required this.paymentType,
    required this.isDefault,
    required this.financialYearMasterId,
    required this.salesOrderId,
    required this.customerName,
    required this.customerRating,
    required this.id,
    required this.displayName,
    required this.editStatus,
    required this.outCount,
    required this.totalCessMasterAmount,
    required this.totalSum,
    required this.isJsonDownloaded,
    required this.jsonDownloadDate,
    required this.einvoiceStatus,
    required this.items,
    required this.remarks,
    required this.deliveryStatus,
    required this.detailsCount,
    required this.phoneNumber,
    required this.isEstimate,
    required this.isOpening,
    required this.mobileCode,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        salesNo: json["salesNo"],
        invoiceDate: DateTime.parse(json["invoiceDate"]),
        salesDate: DateTime.parse(json["salesDate"]),
        totalAmount: json["totalAmount"],
        totalDiscount: json["totalDiscount"],
        specialDiscount: json["specialDiscount"],
        freightCharge: json["freightCharge"],
        otherCharge: json["otherCharge"],
        roundOff: json["roundOff"],
        status: json["status"],
        invoicefromTally: json["invoicefromTally"],
        customerId: json["customerId"],
        totalTaxWithCess: json["totalTaxWithCess"],
        totalCess: json["totalCess"],
        transportationMode: json["transportationMode"],
        vehicleNo: json["vehicleNo"],
        placeOfSupply: json["placeOfSupply"],
        shippingName: json["shippingName"],
        shippingAddress1: json["shippingAddress1"],
        shippingAddress2: json["shippingAddress2"],
        shippingGstinNo: json["shippingGSTINNo"],
        shippingState: json["shippingState"],
        totalCentralCess: json["totalCentralCess"],
        totalTaxWithCentralCess: json["totalTaxWithCentralCess"],
        invoiceNo: json["invoiceNo"],
        paymentType: json["paymentType"],
        isDefault: json["isDefault"],
        financialYearMasterId: json["financialYearMasterId"],
        salesOrderId: json["salesOrderId"],
        customerName: json["customerName"],
        customerRating: json["customerRating"],
        id: json["id"],
        displayName: json["displayName"],
        editStatus: json["editStatus"],
        outCount: json["outCount"],
        totalCessMasterAmount: json["totalCessMasterAmount"],
        totalSum: json["totalSum"],
        isJsonDownloaded: json["isJsonDownloaded"],
        jsonDownloadDate: json["jsonDownloadDate"],
        einvoiceStatus: json["einvoiceStatus"],
        items: json["items"],
        remarks: json["remarks"],
        deliveryStatus: json["deliveryStatus"],
        detailsCount: json["detailsCount"],
        phoneNumber: json["phoneNumber"],
        isEstimate: json["isEstimate"],
        isOpening: json["isOpening"],
        mobileCode: json["mobileCode"],
      );

  Map<String, dynamic> toJson() => {
        "salesNo": salesNo,
        "invoiceDate": invoiceDate.toIso8601String(),
        "salesDate": salesDate.toIso8601String(),
        "totalAmount": totalAmount,
        "totalDiscount": totalDiscount,
        "specialDiscount": specialDiscount,
        "freightCharge": freightCharge,
        "otherCharge": otherCharge,
        "roundOff": roundOff,
        "status": status,
        "invoicefromTally": invoicefromTally,
        "customerId": customerId,
        "totalTaxWithCess": totalTaxWithCess,
        "totalCess": totalCess,
        "transportationMode": transportationMode,
        "vehicleNo": vehicleNo,
        "placeOfSupply": placeOfSupply,
        "shippingName": shippingName,
        "shippingAddress1": shippingAddress1,
        "shippingAddress2": shippingAddress2,
        "shippingGSTINNo": shippingGstinNo,
        "shippingState": shippingState,
        "totalCentralCess": totalCentralCess,
        "totalTaxWithCentralCess": totalTaxWithCentralCess,
        "invoiceNo": invoiceNo,
        "paymentType": paymentType,
        "isDefault": isDefault,
        "financialYearMasterId": financialYearMasterId,
        "salesOrderId": salesOrderId,
        "customerName": customerName,
        "customerRating": customerRating,
        "id": id,
        "displayName": displayName,
        "editStatus": editStatus,
        "outCount": outCount,
        "totalCessMasterAmount": totalCessMasterAmount,
        "totalSum": totalSum,
        "isJsonDownloaded": isJsonDownloaded,
        "jsonDownloadDate": jsonDownloadDate,
        "einvoiceStatus": einvoiceStatus,
        "items": items,
        "remarks": remarks,
        "deliveryStatus": deliveryStatus,
        "detailsCount": detailsCount,
        "phoneNumber": phoneNumber,
        "isEstimate": isEstimate,
        "isOpening": isOpening,
        "mobileCode": mobileCode,
      };
}
