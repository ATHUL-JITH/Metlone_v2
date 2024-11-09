// To parse this JSON data, do
//
//     final estimateModel = estimateModelFromJson(jsonString);

import 'dart:convert';

List<EstimateModel> estimateModelFromJson(String str) =>
    List<EstimateModel>.from(
        json.decode(str).map((x) => EstimateModel.fromJson(x)));

String estimateModelToJson(List<EstimateModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EstimateModel {
  double? rate;
  double? qty;
  double? gross;
  int? productProfileId;
  String? productName;
  int? unitId;
  double? taxPercentage;
  bool? isSittingService;

  EstimateModel({
    this.rate,
    this.qty,
    this.gross,
    this.productProfileId,
    this.productName,
    this.unitId,
    this.taxPercentage,
    this.isSittingService,
  });

  factory EstimateModel.fromJson(Map<String, dynamic> json) => EstimateModel(
        rate: json["rate"],
        qty: json["qty"],
        gross: json["gross"],
        productProfileId: json["productProfileId"],
        productName: json["productName"],
        unitId: json["unitId"],
        taxPercentage: json["taxPercentage"],
        isSittingService: json["isSittingService"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "qty": qty,
        "gross": gross,
        "productProfileId": productProfileId,
        "productName": productName,
        "unitId": unitId,
        "taxPercentage": taxPercentage,
        "isSittingService": isSittingService,
      };
}
