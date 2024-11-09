// To parse this JSON data, do
//
//     final estimateInvoice = estimateInvoiceFromJson(jsonString);

import 'dart:convert';

EstimateInvoice estimateInvoiceFromJson(String str) =>
    EstimateInvoice.fromJson(json.decode(str));

String estimateInvoiceToJson(EstimateInvoice data) =>
    json.encode(data.toJson());

class EstimateInvoice {
  Result? result;
  dynamic targetUrl;
  bool? success;
  dynamic error;
  bool? unAuthorizedRequest;
  bool? abp;

  EstimateInvoice({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  factory EstimateInvoice.fromJson(Map<String, dynamic> json) =>
      EstimateInvoice(
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
  String? salesNo;
  DateTime? invoiceDate;
  dynamic invoiceDateString;
  DateTime? salesDate;
  double? totalAmount;
  double? totalDiscount;
  double? specialDiscount;
  double? freightCharge;
  double? otherCharge;
  double? roundOff;
  int? status;
  bool? invoicefromTally;
  int? customerId;
  double? totalTaxWithCess;
  double? totalCess;
  dynamic transportationMode;
  dynamic vehicleNo;
  dynamic placeOfSupply;
  dynamic shippingName;
  dynamic shippingAddress1;
  dynamic shippingAddress2;
  dynamic shippingGstinNo;
  dynamic shippingState;
  double? totalCentralCess;
  double? totalTaxWithCentralCess;
  dynamic invoiceNo;
  dynamic paymentType;
  bool? isDefault;
  dynamic financialYearMasterId;
  dynamic salesOrderId;
  dynamic customerName;
  dynamic customerRating;
  int? id;
  dynamic displayName;
  bool? editStatus;
  int? outCount;
  double? totalCessMasterAmount;
  double? totalSum;
  bool? isJsonDownloaded;
  dynamic jsonDownloadDate;
  dynamic einvoiceStatus;
  dynamic items;
  String? remarks;
  int? deliveryStatus;
  int? detailsCount;
  dynamic phoneNumber;
  bool? isEstimate;
  bool? isOpening;
  dynamic mobileCode;

  Item({
    this.salesNo,
    this.invoiceDate,
    this.invoiceDateString,
    this.salesDate,
    this.totalAmount,
    this.totalDiscount,
    this.specialDiscount,
    this.freightCharge,
    this.otherCharge,
    this.roundOff,
    this.status,
    this.invoicefromTally,
    this.customerId,
    this.totalTaxWithCess,
    this.totalCess,
    this.transportationMode,
    this.vehicleNo,
    this.placeOfSupply,
    this.shippingName,
    this.shippingAddress1,
    this.shippingAddress2,
    this.shippingGstinNo,
    this.shippingState,
    this.totalCentralCess,
    this.totalTaxWithCentralCess,
    this.invoiceNo,
    this.paymentType,
    this.isDefault,
    this.financialYearMasterId,
    this.salesOrderId,
    this.customerName,
    this.customerRating,
    this.id,
    this.displayName,
    this.editStatus,
    this.outCount,
    this.totalCessMasterAmount,
    this.totalSum,
    this.isJsonDownloaded,
    this.jsonDownloadDate,
    this.einvoiceStatus,
    this.items,
    this.remarks,
    this.deliveryStatus,
    this.detailsCount,
    this.phoneNumber,
    this.isEstimate,
    this.isOpening,
    this.mobileCode,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        salesNo: json["salesNo"],
        invoiceDate: json["invoiceDate"] == null
            ? null
            : DateTime.parse(json["invoiceDate"]),
        invoiceDateString: json["invoiceDateString"],
        salesDate: json["salesDate"] == null
            ? null
            : DateTime.parse(json["salesDate"]),
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
        "invoiceDate": invoiceDate?.toIso8601String(),
        "invoiceDateString": invoiceDateString,
        "salesDate": salesDate?.toIso8601String(),
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
