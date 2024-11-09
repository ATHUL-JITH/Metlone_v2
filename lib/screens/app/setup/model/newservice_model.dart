// To parse this JSON data, do
//
//     final createorEdit = createorEditFromJson(jsonString);

import 'dart:convert';

CreateorEdit createorEditFromJson(String str) =>
    CreateorEdit.fromJson(json.decode(str));

String createorEditToJson(CreateorEdit data) => json.encode(data.toJson());

class CreateorEdit {
  String? name;
  String? defaultRate;
  TaxList? taxList;
  int? branchId;
  int? tenantId;
  int? companyId;
  bool? isSittingService;
  int? id;

  CreateorEdit({
    this.name,
    this.defaultRate,
    this.taxList,
    this.branchId,
    this.tenantId,
    this.companyId,
    this.isSittingService,
    this.id,
  });

  factory CreateorEdit.fromJson(Map<String, dynamic> json) => CreateorEdit(
        name: json["name"],
        defaultRate: json["defaultRate"],
        taxList:
            json["taxList"] == null ? null : TaxList.fromJson(json["taxList"]),
        branchId: json["branchId"],
        tenantId: json["tenantId"],
        companyId: json["companyId"],
        isSittingService: json["isSittingService"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "defaultRate": defaultRate,
        "taxList": taxList?.toJson(),
        "branchId": branchId,
        "tenantId": tenantId,
        "companyId": companyId,
        "isSittingService": isSittingService,
        "id": id,
      };
}

class TaxList {
  List<Item>? items;

  TaxList({
    this.items,
  });

  factory TaxList.fromJson(Map<String, dynamic> json) => TaxList(
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  String? value;
  String? displayText;
  bool? isSelected;

  Item({
    this.value,
    this.displayText,
    this.isSelected,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        value: json["value"],
        displayText: json["displayText"],
        isSelected: json["isSelected"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "displayText": displayText,
        "isSelected": isSelected,
      };
}
