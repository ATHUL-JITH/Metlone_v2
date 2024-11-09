// To parse this JSON data, do
//
//     final editInvoices = editInvoicesFromJson(jsonString);

import 'dart:convert';

EditInvoices editInvoicesFromJson(String str) =>
    EditInvoices.fromJson(json.decode(str));

String editInvoicesToJson(EditInvoices data) => json.encode(data.toJson());

class EditInvoices {
  Result? result;
  dynamic targetUrl;
  bool? success;
  dynamic error;
  bool? unAuthorizedRequest;
  bool? abp;

  EditInvoices({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  factory EditInvoices.fromJson(Map<String, dynamic> json) => EditInvoices(
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
  SalesInvoice? salesInvoice;
  String? customerName;
  dynamic remarksName;
  bool? isIgst;
  bool? isNt;
  dynamic branchSettingsInfo;
  dynamic getSalesTaxConsolidated;
  dynamic bankName;
  dynamic bankAccountNo;
  dynamic bankIfsc;
  dynamic bankAccountHolderName;
  dynamic bankAddress1;
  dynamic bankAddress2;
  dynamic print;
  bool? isDefault;
  String? customerGstin;
  String? customerEmail;
  String? customerPhone;
  num? customerId;
  String? customerMobileCode;
  String? sittingServiceDetails;

  Result({
    this.salesInvoice,
    this.customerName,
    this.remarksName,
    this.isIgst,
    this.isNt,
    this.branchSettingsInfo,
    this.getSalesTaxConsolidated,
    this.bankName,
    this.bankAccountNo,
    this.bankIfsc,
    this.bankAccountHolderName,
    this.bankAddress1,
    this.bankAddress2,
    this.print,
    this.isDefault,
    this.customerGstin,
    this.customerEmail,
    this.customerPhone,
    this.customerId,
    this.customerMobileCode,
    this.sittingServiceDetails,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        salesInvoice: json["salesInvoice"] == null
            ? null
            : SalesInvoice.fromJson(json["salesInvoice"]),
        customerName: json["customerName"],
        remarksName: json["remarks"],
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
        "salesInvoice": salesInvoice?.toJson(),
        "customerName": customerName,
        "remarks": remarksName,
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
  num? storeId;
  String? salesNo;
  String? invoiceDate;
  String? salesDate;
  num? totalAmount;
  num? totalDiscount;
  num? specialDiscount;
  num? totalAmountGst;
  num? freightCharge;
  num? otherCharge;
  num? roundOff;
  num? netAmount;
  num? status;
  bool? invoicefromTally;
  num? customerId;
  List<SalesInvoiceDetailsListDto>? salesInvoiceDetailsListDto;
  dynamic salesOrderList;
  num? totalQuantity;
  num? saleDiscount;
  bool? isPercentageDiscount;
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
  bool? isDefault;
  num? financialYearMasterId;
  dynamic variationQuntityMapInfo;
  bool? isIgst;
  dynamic salesOrderId;
  dynamic deliveryIds;
  bool? isSelected;
  num? branchId;
  num? companyId;
  bool? isApp;
  bool? isManual;
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
  bool? isMultipleSelected;
  num? totalQty;
  bool? isEstimate;
  dynamic remarks;
  num? advanceAmount;
  bool? isFullyPaid;
  num? deliveryStatus;
  bool? isStudioApp;
  num? balanceAmount;
  List<Payment>? payments;
  dynamic recievedDate;
  String? sittingServiceDetails;
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
    this.storeId,
    this.salesNo,
    this.invoiceDate,
    this.salesDate,
    this.totalAmount,
    this.totalDiscount,
    this.specialDiscount,
    this.totalAmountGst,
    this.freightCharge,
    this.otherCharge,
    this.roundOff,
    this.netAmount,
    this.status,
    this.invoicefromTally,
    this.customerId,
    this.salesInvoiceDetailsListDto,
    this.salesOrderList,
    this.totalQuantity,
    this.saleDiscount,
    this.isPercentageDiscount,
    this.customerDiscountPercentage,
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
    this.groupedProducts,
    this.paymentType,
    this.isDefault,
    this.financialYearMasterId,
    this.variationQuntityMapInfo,
    this.isIgst,
    this.salesOrderId,
    this.deliveryIds,
    this.isSelected,
    this.branchId,
    this.companyId,
    this.isApp,
    this.isManual,
    this.outCount,
    this.inCount,
    this.totalCessMasterAmount,
    this.totalNet,
    this.totalTaxable,
    this.ewayBillNo,
    this.stateName,
    this.stateId,
    this.mappingDetails,
    this.tempTokenNumber,
    this.isMultipleSelected,
    this.totalQty,
    this.isEstimate,
    this.remarks,
    this.advanceAmount,
    this.isFullyPaid,
    this.deliveryStatus,
    this.isStudioApp,
    this.balanceAmount,
    this.payments,
    this.recievedDate,
    this.sittingServiceDetails,
    this.whatsAppDetails,
    this.paymentModeType,
    this.chequeNo,
    this.chequeDate,
    this.ddNo,
    this.ddDate,
    this.referanceNo,
    this.transactionId,
    this.transactionDate,
    this.bankAccountHeadId,
    this.executiveId,
    this.id,
  });

  factory SalesInvoice.fromJson(Map<String, dynamic> json) => SalesInvoice(
        storeId: json["storeId"],
        salesNo: json["salesNo"],
        invoiceDate: json["invoiceDate"],
        salesDate: json["salesDate"],
        totalAmount: json["totalAmount"],
        totalDiscount: json["totalDiscount"],
        specialDiscount: json["specialDiscount"],
        totalAmountGst: json["totalAmountGst"],
        freightCharge: json["freightCharge"],
        otherCharge: json["otherCharge"],
        roundOff: json["roundOff"],
        netAmount: json["netAmount"],
        status: json["status"],
        invoicefromTally: json["invoicefromTally"],
        customerId: json["customerId"],
        salesInvoiceDetailsListDto: json["salesInvoiceDetailsListDto"] == null
            ? []
            : List<SalesInvoiceDetailsListDto>.from(
                json["salesInvoiceDetailsListDto"]!
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
        payments: json["payments"] == null
            ? []
            : List<Payment>.from(
                json["payments"]!.map((x) => Payment.fromJson(x))),
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
        "totalAmountGst": totalAmountGst,
        "freightCharge": freightCharge,
        "otherCharge": otherCharge,
        "roundOff": roundOff,
        "netAmount": netAmount,
        "status": status,
        "invoicefromTally": invoicefromTally,
        "customerId": customerId,
        "salesInvoiceDetailsListDto": salesInvoiceDetailsListDto == null
            ? []
            : List<dynamic>.from(
                salesInvoiceDetailsListDto!.map((x) => x.toJson())),
        "salesOrderList": salesOrderList,
        "totalQuantity": totalQuantity,
        "saleDiscount": saleDiscount,
        "isPercentageLDiscount": isPercentageDiscount,
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
        "payments":
            payments == null ? [] : List<Payment>.from(payments!.map((x) => x)),
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

class SalesInvoiceDetailsListDto {
  num? rate;
  dynamic batchNo;
  dynamic stockId;
  num? qty;
  num? totalAmountGst;
  num? discount;
  num? gross;
  num? net;
  num? totalProductTax;
  num? salesInvoiceId;
  num? productProfileId;
  dynamic productVarientLinksId;
  dynamic quoteDetailId;
  String? productName;
  num? unitId;
  String? unitName;
  dynamic salesProductTaxDtoListDto;
  num? branchId;
  dynamic tenantId;
  dynamic companyId;
  num? netWithoutTax;
  dynamic remarks;
  dynamic remarksId;
  String? remarksName;
  num? totalSgst;
  num? totalCgst;
  num? taxPercentage;
  num? gstPercentage;
  String? hsnCode;
  num? discountPercentage;
  num? cess;
  num? taxableAmount;
  num? totalTaxWithCessDetail;
  num? centralCess;
  num? totalTaxWithCentralCessDetail;
  String? variationTypeName;
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
  String? uniqueId;
  num? auditUniqueId;
  bool? isDiscountPercentage;
  num? purchaseRate;
  num? cessMasterPercentage;
  num? cessMasterAmount;
  bool? isSalesTaxIncluded;
  num? salesTaxExcludedRate;
  dynamic salesQrcodeHistoryListDto;
  dynamic stateId;
  String? stateName;
  dynamic itemBranchId;
  dynamic productProfileName;
  num? boxQuntity;
  num? balanceInStock;
  dynamic taxMasterId;
  bool? isSittingService;
  String? sittingServiceDetails;
  dynamic costCenterId;
  bool? isNegativestock;
  num? id;

  SalesInvoiceDetailsListDto({
    this.rate,
    this.batchNo,
    this.stockId,
    this.qty,
    this.totalAmountGst,
    this.discount,
    this.gross,
    this.net,
    this.totalProductTax,
    this.salesInvoiceId,
    this.productProfileId,
    this.productVarientLinksId,
    this.quoteDetailId,
    this.productName,
    this.unitId,
    this.unitName,
    this.salesProductTaxDtoListDto,
    this.branchId,
    this.tenantId,
    this.companyId,
    this.netWithoutTax,
    this.remarks,
    this.remarksId,
    this.remarksName,
    this.totalSgst,
    this.totalCgst,
    this.taxPercentage,
    this.gstPercentage,
    this.hsnCode,
    this.discountPercentage,
    this.cess,
    this.taxableAmount,
    this.totalTaxWithCessDetail,
    this.centralCess,
    this.totalTaxWithCentralCessDetail,
    this.variationTypeName,
    this.igst,
    this.salesQuantityHistoryId,
    this.baseUnitId,
    this.baseQty,
    this.variationTypeId,
    this.variantName,
    this.deliveryId,
    this.quoteId,
    this.qrCodeId,
    this.upiCode,
    this.qrCode,
    this.maxrate,
    this.uniqueId,
    this.auditUniqueId,
    this.isDiscountPercentage,
    this.purchaseRate,
    this.cessMasterPercentage,
    this.cessMasterAmount,
    this.isSalesTaxIncluded,
    this.salesTaxExcludedRate,
    this.salesQrcodeHistoryListDto,
    this.stateId,
    this.stateName,
    this.itemBranchId,
    this.productProfileName,
    this.boxQuntity,
    this.balanceInStock,
    this.taxMasterId,
    this.isSittingService,
    this.sittingServiceDetails,
    this.costCenterId,
    this.isNegativestock,
    this.id,
  });

  factory SalesInvoiceDetailsListDto.fromJson(Map<String, dynamic> json) =>
      SalesInvoiceDetailsListDto(
        rate: json["rate"],
        batchNo: json["batchNo"],
        stockId: json["stockId"],
        qty: json["qty"],
        totalAmountGst: json["totalAmountGst"],
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
        remarksName: json["remarks"],
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
        "totalAmountGst": totalAmountGst,
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
        "remarks": remarksName,
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

class Payment {
  int? paymentId;
  String? paymentNo;
  int? paymentType;
  DateTime? paymentDate;
  double? paymentAmount;

  Payment({
    this.paymentId,
    this.paymentNo,
    this.paymentType,
    this.paymentDate,
    this.paymentAmount,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        paymentId: json["paymentId"],
        paymentNo: json["paymentNo"],
        paymentType: json["paymentType"],
        paymentDate: json["paymentDate"] == null
            ? null
            : DateTime.parse(json["paymentDate"]),
        paymentAmount: json["paymentAmount"],
      );

  Map<String, dynamic> toJson() => {
        "paymentId": paymentId,
        "paymentNo": paymentNo,
        "paymentType": paymentType,
        "paymentDate": paymentDate?.toIso8601String(),
        "paymentAmount": paymentAmount,
      };
}
