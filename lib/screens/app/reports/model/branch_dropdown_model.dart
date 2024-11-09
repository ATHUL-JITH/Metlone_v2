import 'dart:convert';

BranchForDropDown branchForDropDownFromJson(String str) =>
    BranchForDropDown.fromJson(json.decode(str));

String branchForDropDownToJson(BranchForDropDown data) =>
    json.encode(data.toJson());

class BranchForDropDown {
  List<DropDownBrnach> result;
  dynamic targetUrl;
  bool success;
  dynamic error;
  bool unAuthorizedRequest;
  bool abp;

  BranchForDropDown({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  factory BranchForDropDown.fromJson(Map<String, dynamic> json) =>
      BranchForDropDown(
        result: List<DropDownBrnach>.from(
            json["result"].map((x) => DropDownBrnach.fromJson(x))),
        targetUrl: json["targetUrl"],
        success: json["success"],
        error: json["error"],
        unAuthorizedRequest: json["unAuthorizedRequest"],
        abp: json["__abp"],
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
        "targetUrl": targetUrl,
        "success": success,
        "error": error,
        "unAuthorizedRequest": unAuthorizedRequest,
        "__abp": abp,
      };
}

class DropDownBrnach {
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

  DropDownBrnach({
    required this.name,
    required this.id,
    required this.parentId,
    required this.branchId,
    required this.code,
    required this.purchaseUnitId,
    required this.purchaseUnitName,
    required this.salesUnitId,
    required this.salesUnitName,
    required this.isPurchase,
    required this.rate,
    required this.totalProductTax,
    required this.netAmount,
    required this.grossAmount,
    required this.totalSgst,
    required this.totalCgst,
    required this.discount,
    required this.discountPercentage,
    required this.cess,
    required this.taxableAmount,
    required this.totalTaxWithCessDetail,
    required this.centralCess,
    required this.totalTaxWithCentralCessDetail,
    required this.maxRate,
    required this.itemBranchId,
    required this.qty,
  });

  factory DropDownBrnach.fromJson(Map<String, dynamic> json) => DropDownBrnach(
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
