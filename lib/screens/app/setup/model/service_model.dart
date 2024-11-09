// To parse this JSON data, do
//
//     final searchFilter = searchFilterFromJson(jsonString);

import 'dart:convert';

SearchFilter searchFilterFromJson(String str) =>
    SearchFilter.fromJson(json.decode(str));

String searchFilterToJson(SearchFilter data) => json.encode(data.toJson());

class SearchFilter {
  Result? result;
  dynamic targetUrl;
  bool? success;
  dynamic error;
  bool? unAuthorizedRequest;
  bool? abp;

  SearchFilter({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  factory SearchFilter.fromJson(Map<String, dynamic> json) => SearchFilter(
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
  String? name;
  num? packingCost;
  dynamic otherName;
  int? productType;
  bool? isTaxIncluded;
  bool? manageStock;
  bool? isPurchaseTaxIncluded;
  dynamic isVarient;
  bool? isExpiryProduct;
  String? hsnCode;
  num? defaultRate;
  int? purchaseUnitId;
  int? salesUnitId;
  int? defaultUnitId;
  dynamic productCategoryId;
  num? saleRate;
  num? purchaseRate;
  num? wholeSaleRate;
  dynamic genericCategoryId;
  dynamic subCategoryId;
  dynamic brandId;
  dynamic branchId;
  dynamic artNo;
  dynamic color;
  dynamic size;
  num? sizeinCentimeter;
  num? maxRate;
  num? minRate;
  int? hsnCodeId;
  dynamic unitName;
  dynamic unitName2;
  dynamic unitName3;
  dynamic category;
  Unit? defaultUnit;
  dynamic genericName;
  dynamic brandName;
  Unit? purchaseUnit;
  Unit? salesUnit;
  dynamic mould;
  dynamic upiCode;
  bool? isBin;
  dynamic modelId;
  String? model;
  dynamic chasisNumber;
  dynamic motorNumber;
  dynamic batteryAh;
  dynamic batterySerialNo;
  DateTime? yearOfManufacture;
  dynamic colourType;
  dynamic batteryModelType;
  num? taxAmount;
  num? net;
  num? gross;
  num? totalCgst;
  num? totalSgst;
  num? totalIgst;
  dynamic imagePath;
  num? convenienceRate;
  num? stock;
  dynamic associatedUnit;
  dynamic batteryName;
  dynamic batchNo;
  dynamic expiryDate;
  dynamic productBatchList;
  dynamic barcode;
  dynamic shortName;
  dynamic cessMasterId;
  dynamic cessMasterName;
  num? reorderValue;
  dynamic errorMessage;
  num? sortOrder;
  num? expiryDays;
  num? retailRate;
  dynamic itemBranchId;
  String? itemBranchName;
  bool? isscale;
  dynamic weight;
  TaxName? taxName;
  String? createdOn;
  num? taxMasterId;
  String? uniqueFileUploadId;
  bool? isSittingService;
  bool? isDefaultCostCenterExist;
  dynamic costCenterId;
  String? costCenterName;
  dynamic fileUrl;
  dynamic productDescription;
  String? uniqueDocumentUploadId;
  int? id;

  Item({
    this.name,
    this.packingCost,
    this.otherName,
    this.productType,
    this.isTaxIncluded,
    this.manageStock,
    this.isPurchaseTaxIncluded,
    this.isVarient,
    this.isExpiryProduct,
    this.hsnCode,
    this.defaultRate,
    this.purchaseUnitId,
    this.salesUnitId,
    this.defaultUnitId,
    this.productCategoryId,
    this.saleRate,
    this.purchaseRate,
    this.wholeSaleRate,
    this.genericCategoryId,
    this.subCategoryId,
    this.brandId,
    this.branchId,
    this.artNo,
    this.color,
    this.size,
    this.sizeinCentimeter,
    this.maxRate,
    this.minRate,
    this.hsnCodeId,
    this.unitName,
    this.unitName2,
    this.unitName3,
    this.category,
    this.defaultUnit,
    this.genericName,
    this.brandName,
    this.purchaseUnit,
    this.salesUnit,
    this.mould,
    this.upiCode,
    this.isBin,
    this.modelId,
    this.model,
    this.chasisNumber,
    this.motorNumber,
    this.batteryAh,
    this.batterySerialNo,
    this.yearOfManufacture,
    this.colourType,
    this.batteryModelType,
    this.taxAmount,
    this.net,
    this.gross,
    this.totalCgst,
    this.totalSgst,
    this.totalIgst,
    this.imagePath,
    this.convenienceRate,
    this.stock,
    this.associatedUnit,
    this.batteryName,
    this.batchNo,
    this.expiryDate,
    this.productBatchList,
    this.barcode,
    this.shortName,
    this.cessMasterId,
    this.cessMasterName,
    this.reorderValue,
    this.errorMessage,
    this.sortOrder,
    this.expiryDays,
    this.retailRate,
    this.itemBranchId,
    this.itemBranchName,
    this.isscale,
    this.weight,
    this.taxName,
    this.createdOn,
    this.taxMasterId,
    this.uniqueFileUploadId,
    this.isSittingService,
    this.isDefaultCostCenterExist,
    this.costCenterId,
    this.costCenterName,
    this.fileUrl,
    this.productDescription,
    this.uniqueDocumentUploadId,
    this.id,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"],
        packingCost: json["packingCost"],
        otherName: json["otherName"],
        productType: json["productType"],
        isTaxIncluded: json["isTaxIncluded"],
        manageStock: json["manageStock"],
        isPurchaseTaxIncluded: json["isPurchaseTaxIncluded"],
        isVarient: json["isVarient"],
        isExpiryProduct: json["isExpiryProduct"],
        hsnCode: json["hsnCode"],
        defaultRate: json["defaultRate"],
        purchaseUnitId: json["purchaseUnitId"],
        salesUnitId: json["salesUnitId"],
        defaultUnitId: json["defaultUnitId"],
        productCategoryId: json["productCategoryId"],
        saleRate: json["saleRate"],
        purchaseRate: json["purchaseRate"],
        wholeSaleRate: json["wholeSaleRate"],
        genericCategoryId: json["genericCategoryId"],
        subCategoryId: json["subCategoryId"],
        brandId: json["brandId"],
        branchId: json["branchId"],
        artNo: json["artNo"],
        color: json["color"],
        size: json["size"],
        sizeinCentimeter: json["sizeinCentimeter"],
        maxRate: json["maxRate"],
        minRate: json["minRate"],
        hsnCodeId: json["hsnCodeId"],
        unitName: json["unitName"],
        unitName2: json["unitName2"],
        unitName3: json["unitName3"],
        category: json["category"],
        defaultUnit: unitValues.map[json["defaultUnit"]]!,
        genericName: json["genericName"],
        brandName: json["brandName"],
        purchaseUnit: unitValues.map[json["purchaseUnit"]]!,
        salesUnit: unitValues.map[json["salesUnit"]]!,
        mould: json["mould"],
        upiCode: json["upiCode"],
        isBin: json["isBin"],
        modelId: json["modelId"],
        model: json["model"],
        chasisNumber: json["chasisNumber"],
        motorNumber: json["motorNumber"],
        batteryAh: json["batteryAH"],
        batterySerialNo: json["batterySerialNo"],
        yearOfManufacture: json["yearOfManufacture"] == null
            ? null
            : DateTime.parse(json["yearOfManufacture"]),
        colourType: json["colourType"],
        batteryModelType: json["batteryModelType"],
        taxAmount: json["taxAmount"],
        net: json["net"],
        gross: json["gross"],
        totalCgst: json["totalCGST"],
        totalSgst: json["totalSGST"],
        totalIgst: json["totalIGST"],
        imagePath: json["imagePath"],
        convenienceRate: json["convenienceRate"],
        stock: json["stock"],
        associatedUnit: json["associatedUnit"],
        batteryName: json["batteryName"],
        batchNo: json["batchNo"],
        expiryDate: json["expiryDate"],
        productBatchList: json["productBatchList"],
        barcode: json["barcode"],
        shortName: json["shortName"],
        cessMasterId: json["cessMasterId"],
        cessMasterName: json["cessMasterName"],
        reorderValue: json["reorderValue"],
        errorMessage: json["errorMessage"],
        sortOrder: json["sortOrder"],
        expiryDays: json["expiryDays"],
        retailRate: json["retailRate"],
        itemBranchId: json["itemBranchId"],
        itemBranchName: json["itemBranchName"],
        isscale: json["isscale"],
        weight: json["weight"],
        taxName: taxNameValues.map[json["taxName"]]!,
        createdOn: json["createdOn"],
        taxMasterId: json["taxMasterId"],
        uniqueFileUploadId: json["uniqueFileUploadId"],
        isSittingService: json["isSittingService"],
        isDefaultCostCenterExist: json["isDefaultCostCenterExist"],
        costCenterId: json["costCenterId"],
        costCenterName: json["costCenterName"],
        fileUrl: json["fileURL"],
        productDescription: json["productDescription"],
        uniqueDocumentUploadId: json["uniqueDocumentUploadId"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "packingCost": packingCost,
        "otherName": otherName,
        "productType": productType,
        "isTaxIncluded": isTaxIncluded,
        "manageStock": manageStock,
        "isPurchaseTaxIncluded": isPurchaseTaxIncluded,
        "isVarient": isVarient,
        "isExpiryProduct": isExpiryProduct,
        "hsnCode": hsnCode,
        "defaultRate": defaultRate,
        "purchaseUnitId": purchaseUnitId,
        "salesUnitId": salesUnitId,
        "defaultUnitId": defaultUnitId,
        "productCategoryId": productCategoryId,
        "saleRate": saleRate,
        "purchaseRate": purchaseRate,
        "wholeSaleRate": wholeSaleRate,
        "genericCategoryId": genericCategoryId,
        "subCategoryId": subCategoryId,
        "brandId": brandId,
        "branchId": branchId,
        "artNo": artNo,
        "color": color,
        "size": size,
        "sizeinCentimeter": sizeinCentimeter,
        "maxRate": maxRate,
        "minRate": minRate,
        "hsnCodeId": hsnCodeId,
        "unitName": unitName,
        "unitName2": unitName2,
        "unitName3": unitName3,
        "category": category,
        "defaultUnit": unitValues.reverse[defaultUnit],
        "genericName": genericName,
        "brandName": brandName,
        "purchaseUnit": unitValues.reverse[purchaseUnit],
        "salesUnit": unitValues.reverse[salesUnit],
        "mould": mould,
        "upiCode": upiCode,
        "isBin": isBin,
        "modelId": modelId,
        "model": model,
        "chasisNumber": chasisNumber,
        "motorNumber": motorNumber,
        "batteryAH": batteryAh,
        "batterySerialNo": batterySerialNo,
        "yearOfManufacture": yearOfManufacture?.toIso8601String(),
        "colourType": colourType,
        "batteryModelType": batteryModelType,
        "taxAmount": taxAmount,
        "net": net,
        "gross": gross,
        "totalCGST": totalCgst,
        "totalSGST": totalSgst,
        "totalIGST": totalIgst,
        "imagePath": imagePath,
        "convenienceRate": convenienceRate,
        "stock": stock,
        "associatedUnit": associatedUnit,
        "batteryName": batteryName,
        "batchNo": batchNo,
        "expiryDate": expiryDate,
        "productBatchList": productBatchList,
        "barcode": barcode,
        "shortName": shortName,
        "cessMasterId": cessMasterId,
        "cessMasterName": cessMasterName,
        "reorderValue": reorderValue,
        "errorMessage": errorMessage,
        "sortOrder": sortOrder,
        "expiryDays": expiryDays,
        "retailRate": retailRate,
        "itemBranchId": itemBranchId,
        "itemBranchName": itemBranchName,
        "isscale": isscale,
        "weight": weight,
        "taxName": taxNameValues.reverse[taxName],
        "createdOn": createdOn,
        "taxMasterId": taxMasterId,
        "uniqueFileUploadId": uniqueFileUploadId,
        "isSittingService": isSittingService,
        "isDefaultCostCenterExist": isDefaultCostCenterExist,
        "costCenterId": costCenterId,
        "costCenterName": costCenterName,
        "fileURL": fileUrl,
        "productDescription": productDescription,
        "uniqueDocumentUploadId": uniqueDocumentUploadId,
        "id": id,
      };
}

enum Unit { NUMBER }

final unitValues = EnumValues({"Number": Unit.NUMBER});

enum TaxName { EMPTY, GST_5 }

final taxNameValues = EnumValues({"": TaxName.EMPTY, "GST 5 %": TaxName.GST_5});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
