// To parse this JSON data, do
//
//     final whtasappMsg = whtasappMsgFromJson(jsonString);

import 'dart:convert';

WhtasappMsg whtasappMsgFromJson(String str) =>
    WhtasappMsg.fromJson(json.decode(str));

String whtasappMsgToJson(WhtasappMsg data) => json.encode(data.toJson());

class WhtasappMsg {
  String? toNumber;
  String? type;
  String? message;
  dynamic mediaURl;
  String? fileName;
  String? instanceId;
  String? accessToken;

  WhtasappMsg({
    this.toNumber,
    this.type,
    this.message,
    this.mediaURl,
    this.fileName,
    this.instanceId,
    this.accessToken,
  });

  factory WhtasappMsg.fromJson(Map<String, dynamic> json) => WhtasappMsg(
        toNumber: json["toNumber"],
        type: json["type"],
        message: json["message"],
        mediaURl: json["mediaURl"],
        fileName: json["fileName"],
        instanceId: json["instanceId"],
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "toNumber": toNumber,
        "type": type,
        "message": message,
        "mediaURl": mediaURl,
        "fileName": fileName,
        "instanceId": instanceId,
        "accessToken": accessToken,
      };
}
