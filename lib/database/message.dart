// To parse this JSON data, do
//
//     final messageModel = messageModelFromJson(jsonString);

import 'dart:convert';

List<MessageModel> messageModelFromJson(String str) => List<MessageModel>.from(
    json.decode(str).map((x) => MessageModel.fromJson(x)));

String messageModelToJson(List<MessageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MessageModel {
  MessageModel({
    this.id,
    this.messsage,
    this.sendTo,
    this.sendFrom,
    this.timestamp,
    this.readAt,
  });

  dynamic id;
  dynamic messsage;
  dynamic sendTo;
  dynamic sendFrom;
  dynamic timestamp;
  dynamic readAt;

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        id: json["id"],
        messsage: json["messsage"],
        sendTo: json["sendTo"],
        sendFrom: json["sendFrom"],
        timestamp: json["timestamp"],
        readAt: json["readAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "messsage": messsage,
        "sendTo": sendTo,
        "sendFrom": sendFrom,
        "timestamp": timestamp,
        "readAt": readAt,
      };
}
