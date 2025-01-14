// To parse this JSON data, do
//
//     final getInvoiceDetails = getInvoiceDetailsFromJson(jsonString);

import 'dart:convert';

GetInvoiceDetails getInvoiceDetailsFromJson(String str) =>
    GetInvoiceDetails.fromJson(json.decode(str));

String getInvoiceDetailsToJson(GetInvoiceDetails data) =>
    json.encode(data.toJson());

class GetInvoiceDetails {
  Result result;
  dynamic targetUrl;
  bool success;
  dynamic error;
  bool unAuthorizedRequest;
  bool abp;

  GetInvoiceDetails({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  factory GetInvoiceDetails.fromJson(Map<String, dynamic> json) =>
      GetInvoiceDetails(
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
  SalesInvoice salesInvoice;
  String customerName;
  dynamic remarksName;
  bool isIgst;
  bool isNt;
  dynamic branchSettingsInfo;
  dynamic getSalesTaxConsolidated;
  dynamic bankName;
  dynamic bankAccountNo;
  dynamic bankIfsc;
  dynamic bankAccountHolderName;
  dynamic bankAddress1;
  dynamic bankAddress2;
  dynamic print;
  bool isDefault;
  dynamic customerGstin;
  dynamic customerEmail;
  String customerPhone;
  int customerId;
  String customerMobileCode;
  dynamic sittingServiceDetails;

  Result({
    required this.salesInvoice,
    required this.customerName,
    required this.remarksName,
    required this.isIgst,
    required this.isNt,
    required this.branchSettingsInfo,
    required this.getSalesTaxConsolidated,
    required this.bankName,
    required this.bankAccountNo,
    required this.bankIfsc,
    required this.bankAccountHolderName,
    required this.bankAddress1,
    required this.bankAddress2,
    required this.print,
    required this.isDefault,
    required this.customerGstin,
    required this.customerEmail,
    required this.customerPhone,
    required this.customerId,
    required this.customerMobileCode,
    required this.sittingServiceDetails,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        salesInvoice: SalesInvoice.fromJson(json["salesInvoice"]),
        customerName: json["customerName"],
        remarksName: json["remarksName"],
        isIgst: json["isIGST"],
        isNt: json["isNT"],
        branchSettingsInfo: json["branchSettingsInfo"],
        getSalesTaxConsolidated: json["getSalesTaxConsolidated"],
        bankName: json["bankName"],
        bankAccountNo: json["bankAccountNo"],
        bankIfsc: json["bankIFSC"],
        bankAccountHolderName: json["bankAccountHolderName"],
        bankAddress1: json["bankAddress1"],
        bankAddress2: json["bankAddress2"],
        print: json["print"],
        isDefault: json["isDefault"],
        customerGstin: json["customerGstin"],
        customerEmail: json["customerEmail"],
        customerPhone: json["customerPhone"],
        customerId: json["customerId"],
        customerMobileCode: json["customerMobileCode"],
        sittingServiceDetails: json["sittingServiceDetails"],
      );

  Map<String, dynamic> toJson() => {
        "salesInvoice": salesInvoice.toJson(),
        "customerName": customerName,
        "remarksName": remarksName,
        "isIGST": isIgst,
        "isNT": isNt,
        "branchSettingsInfo": branchSettingsInfo,
        "getSalesTaxConsolidated": getSalesTaxConsolidated,
        "bankName": bankName,
        "bankAccountNo": bankAccountNo,
        "bankIFSC": bankIfsc,
        "bankAccountHolderName": bankAccountHolderName,
        "bankAddress1": bankAddress1,
        "bankAddress2": bankAddress2,
        "print": print,
        "isDefault": isDefault,
        "customerGstin": customerGstin,
        "customerEmail": customerEmail,
        "customerPhone": customerPhone,
        "customerId": customerId,
        "customerMobileCode": customerMobileCode,
        "sittingServiceDetails": sittingServiceDetails,
      };
}

class SalesInvoice {
  int storeId;
  String salesNo;
  String invoiceDate;
  String salesDate;
  num? totalAmount;
  num? totalDiscount;
  num? specialDiscount;
  num? freightCharge;
  num? otherCharge;
  num? roundOff;
  num? status;
  bool invoicefromTally;
  num? customerId;
  List<SalesInvoiceDetailsListDto> salesInvoiceDetailsListDto;
  dynamic salesOrderList;
  num? totalQuantity;
  num? saleDiscount;
  bool isPercentageDiscount;
  num? customerDiscountPercentage;
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
  dynamic groupedProducts;
  num? paymentType;
  bool isDefault;
  num? financialYearMasterId;
  dynamic variationQuntityMapInfo;
  bool isIgst;
  dynamic salesOrderId;
  dynamic deliveryIds;
  bool isSelected;
  num? branchId;
  num? companyId;
  bool isApp;
  bool isManual;
  num? outCount;
  num? inCount;
  num? totalCessMasterAmount;
  num? totalNet;
  num? totalTaxable;
  dynamic ewayBillNo;
  dynamic stateName;
  dynamic stateId;
  dynamic mappingDetails;
  num? tempTokenNumber;
  bool isMultipleSelected;
  num? totalQty;
  bool isEstimate;
  dynamic remarks;
  num? advanceAmount;
  bool isFullyPaid;
  num? deliveryStatus;
  bool isStudioApp;
  num? balanceAmount;
  List<Payment> payments;
  dynamic recievedDate;
  dynamic sittingServiceDetails;
  dynamic whatsAppDetails;
  dynamic paymentModeType;
  dynamic chequeNo;
  dynamic chequeDate;
  dynamic ddNo;
  dynamic ddDate;
  dynamic referanceNo;
  dynamic transactionId;
  dynamic transactionDate;
  dynamic bankAccountHeadId;
  dynamic executiveId;
  num? id;

  SalesInvoice({
    required this.storeId,
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
    required this.salesInvoiceDetailsListDto,
    required this.salesOrderList,
    required this.totalQuantity,
    required this.saleDiscount,
    required this.isPercentageDiscount,
    required this.customerDiscountPercentage,
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
    required this.groupedProducts,
    required this.paymentType,
    required this.isDefault,
    required this.financialYearMasterId,
    required this.variationQuntityMapInfo,
    required this.isIgst,
    required this.salesOrderId,
    required this.deliveryIds,
    required this.isSelected,
    required this.branchId,
    required this.companyId,
    required this.isApp,
    required this.isManual,
    required this.outCount,
    required this.inCount,
    required this.totalCessMasterAmount,
    required this.totalNet,
    required this.totalTaxable,
    required this.ewayBillNo,
    required this.stateName,
    required this.stateId,
    required this.mappingDetails,
    required this.tempTokenNumber,
    required this.isMultipleSelected,
    required this.totalQty,
    required this.isEstimate,
    required this.remarks,
    required this.advanceAmount,
    required this.isFullyPaid,
    required this.deliveryStatus,
    required this.isStudioApp,
    required this.balanceAmount,
    required this.payments,
    required this.recievedDate,
    required this.sittingServiceDetails,
    required this.whatsAppDetails,
    required this.paymentModeType,
    required this.chequeNo,
    required this.chequeDate,
    required this.ddNo,
    required this.ddDate,
    required this.referanceNo,
    required this.transactionId,
    required this.transactionDate,
    required this.bankAccountHeadId,
    required this.executiveId,
    required this.id,
  });

  factory SalesInvoice.fromJson(Map<String, dynamic> json) => SalesInvoice(
        storeId: json["storeId"],
        salesNo: json["salesNo"],
        invoiceDate: json["invoiceDate"],
        salesDate: json["salesDate"],
        totalAmount: json["totalAmount"],
        totalDiscount: json["totalDiscount"],
        specialDiscount: json["specialDiscount"],
        freightCharge: json["freightCharge"],
        otherCharge: json["otherCharge"],
        roundOff: json["roundOff"],
        status: json["status"],
        invoicefromTally: json["invoicefromTally"],
        customerId: json["customerId"],
        salesInvoiceDetailsListDto: List<SalesInvoiceDetailsListDto>.from(
            json["salesInvoiceDetailsListDto"]
                .map((x) => SalesInvoiceDetailsListDto.fromJson(x))),
        salesOrderList: json["salesOrderList"],
        totalQuantity: json["totalQuantity"],
        saleDiscount: json["saleDiscount"],
        isPercentageDiscount: json["isPercentageDiscount"],
        customerDiscountPercentage: json["customerDiscountPercentage"],
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
        groupedProducts: json["groupedProducts"],
        paymentType: json["paymentType"],
        isDefault: json["isDefault"],
        financialYearMasterId: json["financialYearMasterId"],
        variationQuntityMapInfo: json["variationQuntityMapInfo"],
        isIgst: json["isIGST"],
        salesOrderId: json["salesOrderId"],
        deliveryIds: json["deliveryIds"],
        isSelected: json["isSelected"],
        branchId: json["branchId"],
        companyId: json["companyId"],
        isApp: json["isApp"],
        isManual: json["isManual"],
        outCount: json["outCount"],
        inCount: json["inCount"],
        totalCessMasterAmount: json["totalCessMasterAmount"],
        totalNet: json["totalNet"],
        totalTaxable: json["totalTaxable"],
        ewayBillNo: json["ewayBillNo"],
        stateName: json["stateName"],
        stateId: json["stateId"],
        mappingDetails: json["mappingDetails"],
        tempTokenNumber: json["tempTokenNumber"],
        isMultipleSelected: json["isMultipleSelected"],
        totalQty: json["totalQty"],
        isEstimate: json["isEstimate"],
        remarks: json["remarks"],
        advanceAmount: json["advanceAmount"],
        isFullyPaid: json["isFullyPaid"],
        deliveryStatus: json["deliveryStatus"],
        isStudioApp: json["isStudioApp"],
        balanceAmount: json["balanceAmount"],
        payments: List<Payment>.from(
            json["payments"].map((x) => Payment.fromJson(x))),
        recievedDate: json["recievedDate"],
        sittingServiceDetails: json["sittingServiceDetails"],
        whatsAppDetails: json["whatsAppDetails"],
        paymentModeType: json["paymentModeType"],
        chequeNo: json["chequeNo"],
        chequeDate: json["chequeDate"],
        ddNo: json["ddNo"],
        ddDate: json["ddDate"],
        referanceNo: json["referanceNo"],
        transactionId: json["transactionID"],
        transactionDate: json["transactionDate"],
        bankAccountHeadId: json["bankAccountHeadId"],
        executiveId: json["executiveId"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "storeId": storeId,
        "salesNo": salesNo,
        "invoiceDate": invoiceDate,
        "salesDate": salesDate,
        "totalAmount": totalAmount,
        "totalDiscount": totalDiscount,
        "specialDiscount": specialDiscount,
        "freightCharge": freightCharge,
        "otherCharge": otherCharge,
        "roundOff": roundOff,
        "status": status,
        "invoicefromTally": invoicefromTally,
        "customerId": customerId,
        "salesInvoiceDetailsListDto": List<dynamic>.from(
            salesInvoiceDetailsListDto.map((x) => x.toJson())),
        "salesOrderList": salesOrderList,
        "totalQuantity": totalQuantity,
        "saleDiscount": saleDiscount,
        "isPercentageDiscount": isPercentageDiscount,
        "customerDiscountPercentage": customerDiscountPercentage,
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
        "groupedProducts": groupedProducts,
        "paymentType": paymentType,
        "isDefault": isDefault,
        "financialYearMasterId": financialYearMasterId,
        "variationQuntityMapInfo": variationQuntityMapInfo,
        "isIGST": isIgst,
        "salesOrderId": salesOrderId,
        "deliveryIds": deliveryIds,
        "isSelected": isSelected,
        "branchId": branchId,
        "companyId": companyId,
        "isApp": isApp,
        "isManual": isManual,
        "outCount": outCount,
        "inCount": inCount,
        "totalCessMasterAmount": totalCessMasterAmount,
        "totalNet": totalNet,
        "totalTaxable": totalTaxable,
        "ewayBillNo": ewayBillNo,
        "stateName": stateName,
        "stateId": stateId,
        "mappingDetails": mappingDetails,
        "tempTokenNumber": tempTokenNumber,
        "isMultipleSelected": isMultipleSelected,
        "totalQty": totalQty,
        "isEstimate": isEstimate,
        "remarks": remarks,
        "advanceAmount": advanceAmount,
        "isFullyPaid": isFullyPaid,
        "deliveryStatus": deliveryStatus,
        "isStudioApp": isStudioApp,
        "balanceAmount": balanceAmount,
        "payments": List<dynamic>.from(payments.map((x) => x.toJson())),
        "recievedDate": recievedDate,
        "sittingServiceDetails": sittingServiceDetails,
        "whatsAppDetails": whatsAppDetails,
        "paymentModeType": paymentModeType,
        "chequeNo": chequeNo,
        "chequeDate": chequeDate,
        "ddNo": ddNo,
        "ddDate": ddDate,
        "referanceNo": referanceNo,
        "transactionID": transactionId,
        "transactionDate": transactionDate,
        "bankAccountHeadId": bankAccountHeadId,
        "executiveId": executiveId,
        "id": id,
      };
}

class Payment {
  num? paymentId;
  String paymentNo;
  num? paymentType;
  DateTime paymentDate;
  num? paymentAmount;

  Payment({
    required this.paymentId,
    required this.paymentNo,
    required this.paymentType,
    required this.paymentDate,
    required this.paymentAmount,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        paymentId: json["paymentId"],
        paymentNo: json["paymentNo"],
        paymentType: json["paymentType"],
        paymentDate: DateTime.parse(json["paymentDate"]),
        paymentAmount: json["paymentAmount"],
      );

  Map<String, dynamic> toJson() => {
        "paymentId": paymentId,
        "paymentNo": paymentNo,
        "paymentType": paymentType,
        "paymentDate": paymentDate.toIso8601String(),
        "paymentAmount": paymentAmount,
      };
}

class SalesInvoiceDetailsListDto {
  num? rate;
  dynamic batchNo;
  dynamic stockId;
  num? qty;
  num? discount;
  num? gross;
  num? net;
  num? totalProductTax;
  num? salesInvoiceId;
  num? productProfileId;
  dynamic productVarientLinksId;
  dynamic quoteDetailId;
  String productName;
  num? unitId;
  String unitName;
  dynamic salesProductTaxDtoListDto;
  num? branchId;
  dynamic tenantId;
  dynamic companyId;
  num? netWithoutTax;
  dynamic remarks;
  dynamic remarksId;
  String remarksName;
  num? totalSgst;
  num? totalCgst;
  num? taxPercentage;
  num? gstPercentage;
  String hsnCode;
  num? discountPercentage;
  num? cess;
  num? taxableAmount;
  num? totalTaxWithCessDetail;
  num? centralCess;
  num? totalTaxWithCentralCessDetail;
  String variationTypeName;
  num? igst;
  dynamic salesQuantityHistoryId;
  dynamic baseUnitId;
  num? baseQty;
  dynamic variationTypeId;
  dynamic variantName;
  dynamic deliveryId;
  dynamic quoteId;
  dynamic qrCodeId;
  dynamic upiCode;
  dynamic qrCode;
  num? maxrate;
  String uniqueId;
  num? auditUniqueId;
  bool isDiscountPercentage;
  num? purchaseRate;
  num? cessMasterPercentage;
  num? cessMasterAmount;
  bool isSalesTaxIncluded;
  num? salesTaxExcludedRate;
  dynamic salesQrcodeHistoryListDto;
  dynamic stateId;
  String stateName;
  dynamic itemBranchId;
  dynamic productProfileName;
  num? boxQuntity;
  num? balanceInStock;
  dynamic taxMasterId;
  bool isSittingService;
  dynamic sittingServiceDetails;
  dynamic costCenterId;
  bool isNegativestock;
  num? id;

  SalesInvoiceDetailsListDto({
    required this.rate,
    required this.batchNo,
    required this.stockId,
    required this.qty,
    required this.discount,
    required this.gross,
    required this.net,
    required this.totalProductTax,
    required this.salesInvoiceId,
    required this.productProfileId,
    required this.productVarientLinksId,
    required this.quoteDetailId,
    required this.productName,
    required this.unitId,
    required this.unitName,
    required this.salesProductTaxDtoListDto,
    required this.branchId,
    required this.tenantId,
    required this.companyId,
    required this.netWithoutTax,
    required this.remarks,
    required this.remarksId,
    required this.remarksName,
    required this.totalSgst,
    required this.totalCgst,
    required this.taxPercentage,
    required this.gstPercentage,
    required this.hsnCode,
    required this.discountPercentage,
    required this.cess,
    required this.taxableAmount,
    required this.totalTaxWithCessDetail,
    required this.centralCess,
    required this.totalTaxWithCentralCessDetail,
    required this.variationTypeName,
    required this.igst,
    required this.salesQuantityHistoryId,
    required this.baseUnitId,
    required this.baseQty,
    required this.variationTypeId,
    required this.variantName,
    required this.deliveryId,
    required this.quoteId,
    required this.qrCodeId,
    required this.upiCode,
    required this.qrCode,
    required this.maxrate,
    required this.uniqueId,
    required this.auditUniqueId,
    required this.isDiscountPercentage,
    required this.purchaseRate,
    required this.cessMasterPercentage,
    required this.cessMasterAmount,
    required this.isSalesTaxIncluded,
    required this.salesTaxExcludedRate,
    required this.salesQrcodeHistoryListDto,
    required this.stateId,
    required this.stateName,
    required this.itemBranchId,
    required this.productProfileName,
    required this.boxQuntity,
    required this.balanceInStock,
    required this.taxMasterId,
    required this.isSittingService,
    required this.sittingServiceDetails,
    required this.costCenterId,
    required this.isNegativestock,
    required this.id,
  });

  factory SalesInvoiceDetailsListDto.fromJson(Map<String, dynamic> json) =>
      SalesInvoiceDetailsListDto(
        rate: json["rate"],
        batchNo: json["batchNo"],
        stockId: json["stockId"],
        qty: json["qty"],
        discount: json["discount"],
        gross: json["gross"],
        net: json["net"],
        totalProductTax: json["totalProductTax"],
        salesInvoiceId: json["salesInvoiceId"],
        productProfileId: json["productProfileId"],
        productVarientLinksId: json["productVarientLinksId"],
        quoteDetailId: json["quoteDetailId"],
        productName: json["productName"],
        unitId: json["unitId"],
        unitName: json["unitName"],
        salesProductTaxDtoListDto: json["salesProductTaxDtoListDto"],
        branchId: json["branchId"],
        tenantId: json["tenantId"],
        companyId: json["companyId"],
        netWithoutTax: json["netWithoutTax"],
        remarks: json["remarks"],
        remarksId: json["remarksId"],
        remarksName: json["remarksName"],
        totalSgst: json["totalSGST"],
        totalCgst: json["totalCGST"],
        taxPercentage: json["taxPercentage"],
        gstPercentage: json["gstPercentage"],
        hsnCode: json["hsnCode"],
        discountPercentage: json["discountPercentage"],
        cess: json["cess"],
        taxableAmount: json["taxableAmount"],
        totalTaxWithCessDetail: json["totalTaxWithCessDetail"],
        centralCess: json["centralCess"],
        totalTaxWithCentralCessDetail: json["totalTaxWithCentralCessDetail"],
        variationTypeName: json["variationTypeName"],
        igst: json["igst"],
        salesQuantityHistoryId: json["salesQuantityHistoryId"],
        baseUnitId: json["baseUnitId"],
        baseQty: json["baseQty"],
        variationTypeId: json["variationTypeId"],
        variantName: json["variantName"],
        deliveryId: json["deliveryId"],
        quoteId: json["quoteId"],
        qrCodeId: json["qrCodeId"],
        upiCode: json["upiCode"],
        qrCode: json["qrCode"],
        maxrate: json["maxrate"],
        uniqueId: json["uniqueID"],
        auditUniqueId: json["auditUniqueId"],
        isDiscountPercentage: json["isDiscountPercentage"],
        purchaseRate: json["purchaseRate"],
        cessMasterPercentage: json["cessMasterPercentage"],
        cessMasterAmount: json["cessMasterAmount"],
        isSalesTaxIncluded: json["isSalesTaxIncluded"],
        salesTaxExcludedRate: json["salesTaxExcludedRate"],
        salesQrcodeHistoryListDto: json["salesQrcodeHistoryListDto"],
        stateId: json["stateId"],
        stateName: json["stateName"],
        itemBranchId: json["itemBranchId"],
        productProfileName: json["productProfileName"],
        boxQuntity: json["boxQuntity"],
        balanceInStock: json["balanceInStock"],
        taxMasterId: json["taxMasterId"],
        isSittingService: json["isSittingService"],
        sittingServiceDetails: json["sittingServiceDetails"],
        costCenterId: json["costCenterId"],
        isNegativestock: json["isNegativestock"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "batchNo": batchNo,
        "stockId": stockId,
        "qty": qty,
        "discount": discount,
        "gross": gross,
        "net": net,
        "totalProductTax": totalProductTax,
        "salesInvoiceId": salesInvoiceId,
        "productProfileId": productProfileId,
        "productVarientLinksId": productVarientLinksId,
        "quoteDetailId": quoteDetailId,
        "productName": productName,
        "unitId": unitId,
        "unitName": unitName,
        "salesProductTaxDtoListDto": salesProductTaxDtoListDto,
        "branchId": branchId,
        "tenantId": tenantId,
        "companyId": companyId,
        "netWithoutTax": netWithoutTax,
        "remarks": remarks,
        "remarksId": remarksId,
        "remarksName": remarksName,
        "totalSGST": totalSgst,
        "totalCGST": totalCgst,
        "taxPercentage": taxPercentage,
        "gstPercentage": gstPercentage,
        "hsnCode": hsnCode,
        "discountPercentage": discountPercentage,
        "cess": cess,
        "taxableAmount": taxableAmount,
        "totalTaxWithCessDetail": totalTaxWithCessDetail,
        "centralCess": centralCess,
        "totalTaxWithCentralCessDetail": totalTaxWithCentralCessDetail,
        "variationTypeName": variationTypeName,
        "igst": igst,
        "salesQuantityHistoryId": salesQuantityHistoryId,
        "baseUnitId": baseUnitId,
        "baseQty": baseQty,
        "variationTypeId": variationTypeId,
        "variantName": variantName,
        "deliveryId": deliveryId,
        "quoteId": quoteId,
        "qrCodeId": qrCodeId,
        "upiCode": upiCode,
        "qrCode": qrCode,
        "maxrate": maxrate,
        "uniqueID": uniqueId,
        "auditUniqueId": auditUniqueId,
        "isDiscountPercentage": isDiscountPercentage,
        "purchaseRate": purchaseRate,
        "cessMasterPercentage": cessMasterPercentage,
        "cessMasterAmount": cessMasterAmount,
        "isSalesTaxIncluded": isSalesTaxIncluded,
        "salesTaxExcludedRate": salesTaxExcludedRate,
        "salesQrcodeHistoryListDto": salesQrcodeHistoryListDto,
        "stateId": stateId,
        "stateName": stateName,
        "itemBranchId": itemBranchId,
        "productProfileName": productProfileName,
        "boxQuntity": boxQuntity,
        "balanceInStock": balanceInStock,
        "taxMasterId": taxMasterId,
        "isSittingService": isSittingService,
        "sittingServiceDetails": sittingServiceDetails,
        "costCenterId": costCenterId,
        "isNegativestock": isNegativestock,
        "id": id,
      };
}
