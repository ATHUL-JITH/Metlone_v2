// // To parse this JSON data, do
// //
// //     final salesRegisterSearch = salesRegisterSearchFromJson(jsonString);
//
// import 'dart:convert';
//
// SalesRegisterSearch salesRegisterSearchFromJson(String str) =>
//     SalesRegisterSearch.fromJson(json.decode(str));
//
// String salesRegisterSearchToJson(SalesRegisterSearch data) =>
//     json.encode(data.toJson());
//
// class SalesRegisterSearch {
//   Result? result;
//   dynamic targetUrl;
//   bool? success;
//   dynamic error;
//   bool? unAuthorizedRequest;
//   bool? abp;
//
//   SalesRegisterSearch({
//     this.result,
//     this.targetUrl,
//     this.success,
//     this.error,
//     this.unAuthorizedRequest,
//     this.abp,
//   });
//
//   factory SalesRegisterSearch.fromJson(Map<String, dynamic> json) =>
//       SalesRegisterSearch(
//         result: json["result"] == null ? null : Result.fromJson(json["result"]),
//         targetUrl: json["targetUrl"],
//         success: json["success"],
//         error: json["error"],
//         unAuthorizedRequest: json["unAuthorizedRequest"],
//         abp: json["__abp"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "result": result?.toJson(),
//         "targetUrl": targetUrl,
//         "success": success,
//         "error": error,
//         "unAuthorizedRequest": unAuthorizedRequest,
//         "__abp": abp,
//       };
// }
//
// class Result {
//   int? totalTaxableAmount;
//   int? totalGross;
//   double? totalNet;
//   int? totalGst;
//   int? totalSgst;
//   int? totalCgst;
//   int? totalCess;
//   int? totalKfc;
//   double? totalTax;
//   int? totalIgst;
//   int? totalDiscount;
//   int? totalRoundOff;
//   List<SalesRegisterListDto>? salesRegisterListDto;
//
//   Result({
//     this.totalTaxableAmount,
//     this.totalGross,
//     this.totalNet,
//     this.totalGst,
//     this.totalSgst,
//     this.totalCgst,
//     this.totalCess,
//     this.totalKfc,
//     this.totalTax,
//     this.totalIgst,
//     this.totalDiscount,
//     this.totalRoundOff,
//     this.salesRegisterListDto,
//   });
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//         totalTaxableAmount: json["totalTaxableAmount"],
//         totalGross: json["totalGross"],
//         totalNet: json["totalNet"]?.toDouble(),
//         totalGst: json["totalGST"],
//         totalSgst: json["totalSGST"],
//         totalCgst: json["totalCGST"],
//         totalCess: json["totalCess"],
//         totalKfc: json["totalKFC"],
//         totalTax: json["totalTax"]?.toDouble(),
//         totalIgst: json["totalIGST"],
//         totalDiscount: json["totalDiscount"],
//         totalRoundOff: json["totalRoundOff"],
//         salesRegisterListDto: json["salesRegisterListDto"] == null
//             ? []
//             : List<SalesRegisterListDto>.from(json["salesRegisterListDto"]!
//                 .map((x) => SalesRegisterListDto.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "totalTaxableAmount": totalTaxableAmount,
//         "totalGross": totalGross,
//         "totalNet": totalNet,
//         "totalGST": totalGst,
//         "totalSGST": totalSgst,
//         "totalCGST": totalCgst,
//         "totalCess": totalCess,
//         "totalKFC": totalKfc,
//         "totalTax": totalTax,
//         "totalIGST": totalIgst,
//         "totalDiscount": totalDiscount,
//         "totalRoundOff": totalRoundOff,
//         "salesRegisterListDto": salesRegisterListDto == null
//             ? []
//             : List<dynamic>.from(salesRegisterListDto!.map((x) => x.toJson())),
//       };
// }
//
// class SalesRegisterListDto {
//   int? salesId;
//   DateTime? invoiceDate;
//   String? invoiceNo;
//   Customer? customer;
//   String? custType;
//   dynamic custGstinNo;
//   int? gross;
//   int? gst;
//   int? cgst;
//   int? sgst;
//   double? net;
//   int? cess;
//   int? kfc;
//   int? igst;
//   double? totalTax;
//   dynamic stateCode;
//   int? taxPercentage;
//   int? discountAmount;
//   int? taxableAmount;
//   int? roundOff;
//   DateTime? salesDate;
//   dynamic salesNo;
//
//   SalesRegisterListDto({
//     this.salesId,
//     this.invoiceDate,
//     this.invoiceNo,
//     this.customer,
//     this.custType,
//     this.custGstinNo,
//     this.gross,
//     this.gst,
//     this.cgst,
//     this.sgst,
//     this.net,
//     this.cess,
//     this.kfc,
//     this.igst,
//     this.totalTax,
//     this.stateCode,
//     this.taxPercentage,
//     this.discountAmount,
//     this.taxableAmount,
//     this.roundOff,
//     this.salesDate,
//     this.salesNo,
//   });
//
//   factory SalesRegisterListDto.fromJson(Map<String, dynamic> json) =>
//       SalesRegisterListDto(
//         salesId: json["salesID"],
//         invoiceDate: json["invoiceDate"] == null
//             ? null
//             : DateTime.parse(json["invoiceDate"]),
//         invoiceNo: json["invoiceNo"],
//         customer: customerValues.map[json["customer"]]!,
//         custType: json["custType"],
//         custGstinNo: json["custGSTINNo"],
//         gross: json["gross"],
//         gst: json["gst"],
//         cgst: json["cgst"],
//         sgst: json["sgst"],
//         net: json["net"]?.toDouble(),
//         cess: json["cess"],
//         kfc: json["kfc"],
//         igst: json["igst"],
//         totalTax: json["totalTax"]?.toDouble(),
//         stateCode: json["stateCode"],
//         taxPercentage: json["taxPercentage"],
//         discountAmount: json["discountAmount"],
//         taxableAmount: json["taxableAmount"],
//         roundOff: json["roundOff"],
//         salesDate: json["salesDate"] == null
//             ? null
//             : DateTime.parse(json["salesDate"]),
//         salesNo: json["salesNO"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "salesID": salesId,
//         "invoiceDate": invoiceDate?.toIso8601String(),
//         "invoiceNo": invoiceNo,
//         "customer": customerValues.reverse[customer],
//         "custType": custType,
//         "custGSTINNo": custGstinNo,
//         "gross": gross,
//         "gst": gst,
//         "cgst": cgst,
//         "sgst": sgst,
//         "net": net,
//         "cess": cess,
//         "kfc": kfc,
//         "igst": igst,
//         "totalTax": totalTax,
//         "stateCode": stateCode,
//         "taxPercentage": taxPercentage,
//         "discountAmount": discountAmount,
//         "taxableAmount": taxableAmount,
//         "roundOff": roundOff,
//         "salesDate": salesDate?.toIso8601String(),
//         "salesNO": salesNo,
//       };
// }
//
// enum Customer { SARANYA }
//
// final customerValues = EnumValues({"Saranya": Customer.SARANYA});
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
