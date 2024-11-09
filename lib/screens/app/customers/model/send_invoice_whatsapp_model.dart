// To parse this JSON data, do
//
//     final sendInvoiceWhatsapp = sendInvoiceWhatsappFromJson(jsonString);

import 'dart:convert';

SendInvoiceWhatsapp sendInvoiceWhatsappFromJson(String str) =>
    SendInvoiceWhatsapp.fromJson(json.decode(str));

String sendInvoiceWhatsappToJson(SendInvoiceWhatsapp data) =>
    json.encode(data.toJson());

class SendInvoiceWhatsapp {
  Result result;
  dynamic targetUrl;
  bool success;
  dynamic error;
  bool unAuthorizedRequest;
  bool abp;

  SendInvoiceWhatsapp({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  factory SendInvoiceWhatsapp.fromJson(Map<String, dynamic> json) =>
      SendInvoiceWhatsapp(
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
  String templateHTmlBase64File;
  String templatePdfString;
  String filename;
  dynamic body;
  dynamic subject;

  Result({
    required this.templateHTmlBase64File,
    required this.templatePdfString,
    required this.filename,
    required this.body,
    required this.subject,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        templateHTmlBase64File: json["templateHTmlBase64File"],
        templatePdfString: json["templatePdfString"],
        filename: json["filename"],
        body: json["body"],
        subject: json["subject"],
      );

  Map<String, dynamic> toJson() => {
        "templateHTmlBase64File": templateHTmlBase64File,
        "templatePdfString": templatePdfString,
        "filename": filename,
        "body": body,
        "subject": subject,
      };
}
