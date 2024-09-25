// To parse this JSON data, do
//
//     final getContactModal = getContactModalFromJson(jsonString);

import 'dart:convert';

GetContactModal getContactModalFromJson(String str) =>
    GetContactModal.fromJson(json.decode(str));

String getContactModalToJson(GetContactModal data) =>
    json.encode(data.toJson());

class GetContactModal {
  final int id;
  final String phoneNumber;
  final String email;
  final String address;
  final String pinCode;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  GetContactModal({
    required this.id,
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.pinCode,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GetContactModal.fromJson(Map<String, dynamic> json) =>
      GetContactModal(
        id: json["Id"],
        phoneNumber: json["PhoneNumber"],
        email: json["Email"],
        address: json["Address"],
        pinCode: json["PinCode"],
        createdAt: DateTime.parse(json["CreatedAt"]) ?? DateTime.now(),
        updatedAt: DateTime.parse(json["UpdatedAt"]) ?? DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "PhoneNumber": phoneNumber,
        "Email": email,
        "Address": address,
        "PinCode": pinCode,
        "CreatedAt": createdAt!.toIso8601String(),
        "UpdatedAt": updatedAt!.toIso8601String(),
      };
}
