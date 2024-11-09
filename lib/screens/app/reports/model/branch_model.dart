// To parse this JSON data, do
//
//     final branchdetails = branchdetailsFromJson(jsonString);

import 'dart:convert';

BranchDetails branchdetailsFromJson(String str) =>
    BranchDetails.fromJson(json.decode(str));

String branchdetailsToJson(BranchDetails data) => json.encode(data.toJson());

class BranchDetails {
  List<Result>? result;
  dynamic targetUrl;
  bool? success;
  dynamic error;
  bool? unAuthorizedRequest;
  bool? abp;

  BranchDetails({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  factory BranchDetails.fromJson(Map<String, dynamic> json) => BranchDetails(
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
  int? id;
  dynamic parentId;
  int? branchId;
  dynamic code;
  int? purchaseUnitId;
  dynamic purchaseUnitName;
  int? salesUnitId;
  dynamic salesUnitName;
  bool? isPurchase;
  num? rate;
  num? totalProductTax;
  num? netAmount;
  num? grossAmount;
  num? totalSgst;
  num? totalCgst;
  num? discount;
  num? discountPercentage;
  num? cess;
  num? taxableAmount;
  num? totalTaxWithCessDetail;
  num? centralCess;
  num? totalTaxWithCentralCessDetail;
  num? maxRate;
  dynamic itemBranchId;
  num? qty;

  Result({
    this.name,
    this.id,
    this.parentId,
    this.branchId,
    this.code,
    this.purchaseUnitId,
    this.purchaseUnitName,
    this.salesUnitId,
    this.salesUnitName,
    this.isPurchase,
    this.rate,
    this.totalProductTax,
    this.netAmount,
    this.grossAmount,
    this.totalSgst,
    this.totalCgst,
    this.discount,
    this.discountPercentage,
    this.cess,
    this.taxableAmount,
    this.totalTaxWithCessDetail,
    this.centralCess,
    this.totalTaxWithCentralCessDetail,
    this.maxRate,
    this.itemBranchId,
    this.qty,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        id: json["id"],
        parentId: json["parentId"],
        branchId: json["branchId"],
        code: json["code"],
        purchaseUnitId: json["purchaseUnitId"],
        purchaseUnitName: json["purchaseUnitName"],
        salesUnitId: json["salesUnitId"],
        salesUnitName: json["salesUnitName"],
        isPurchase: json["isPurchase"],
        rate: json["rate"],
        totalProductTax: json["totalProductTax"],
        netAmount: json["netAmount"],
        grossAmount: json["grossAmount"],
        totalSgst: json["totalSGST"],
        totalCgst: json["totalCGST"],
        discount: json["discount"],
        discountPercentage: json["discountPercentage"],
        cess: json["cess"],
        taxableAmount: json["taxableAmount"],
        totalTaxWithCessDetail: json["totalTaxWithCessDetail"],
        centralCess: json["centralCess"],
        totalTaxWithCentralCessDetail: json["totalTaxWithCentralCessDetail"],
        maxRate: json["maxRate"],
        itemBranchId: json["itemBranchId"],
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "parentId": parentId,
        "branchId": branchId,
        "code": code,
        "purchaseUnitId": purchaseUnitId,
        "purchaseUnitName": purchaseUnitName,
        "salesUnitId": salesUnitId,
        "salesUnitName": salesUnitName,
        "isPurchase": isPurchase,
        "rate": rate,
        "totalProductTax": totalProductTax,
        "netAmount": netAmount,
        "grossAmount": grossAmount,
        "totalSGST": totalSgst,
        "totalCGST": totalCgst,
        "discount": discount,
        "discountPercentage": discountPercentage,
        "cess": cess,
        "taxableAmount": taxableAmount,
        "totalTaxWithCessDetail": totalTaxWithCessDetail,
        "centralCess": centralCess,
        "totalTaxWithCentralCessDetail": totalTaxWithCentralCessDetail,
        "maxRate": maxRate,
        "itemBranchId": itemBranchId,
        "qty": qty,
      };
}
