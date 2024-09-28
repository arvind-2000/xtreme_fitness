// To parse this JSON data, do
//
//     final getMessageModal = getMessageModalFromJson(jsonString);

import 'dart:convert';

List<GetMessageModal> getMessageModalFromJson(String str) =>
    List<GetMessageModal>.from(
        json.decode(str).map((x) => GetMessageModal.fromJson(x)));

String getMessageModalToJson(List<GetMessageModal> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetMessageModal {
  final int id;
  final String? name;
  final String phoneNumber;
  final String subject;
  final String messageContent;
  final DateTime? createdAt;
  final bool isRead;
  final bool isReplied;
  final String? replyContent;
  final DateTime? repliedAt;

  GetMessageModal({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.subject,
    required this.messageContent,
    required this.createdAt,
    required this.isRead,
    required this.isReplied,
    required this.replyContent,
    required this.repliedAt,
  });

  factory GetMessageModal.fromJson(Map<String, dynamic> json) =>
      GetMessageModal(
        id: json["Id"],
        name: json["Name"] ?? 'Amarjit',
        phoneNumber: json["PhoneNumber"],
        subject: json["Subject"],
        messageContent: json["MessageContent"],
        createdAt:
            DateTime.parse(json["CreatedAt"] ?? DateTime.now().toString()),
        isRead: json["IsRead"],
        isReplied: json["IsReplied"],
        replyContent: json["ReplyContent"] ?? '',
        repliedAt:
            DateTime.parse(json["RepliedAt"] ?? DateTime.now().toString()),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name!,
        "PhoneNumber": phoneNumber,
        "Subject": subject,
        "MessageContent": messageContent,
        "CreatedAt": createdAt!.toIso8601String(),
        "IsRead": isRead,
        "IsReplied": isReplied,
        "ReplyContent": replyContent!,
        "RepliedAt": repliedAt!.toIso8601String(),
      };
}
