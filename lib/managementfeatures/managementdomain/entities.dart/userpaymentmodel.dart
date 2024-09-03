// To parse this JSON data, do
//
//     final alluserpaymentmodel = alluserpaymentmodelFromJson(jsonString);

import 'dart:convert';

List<Alluserpaymentmodel> alluserpaymentmodelFromJson(String str) =>
    List<Alluserpaymentmodel>.from(
        json.decode(str).map((x) => Alluserpaymentmodel.fromJson(x)));

String alluserpaymentmodelToJson(List<Alluserpaymentmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Alluserpaymentmodel {
  final int id;
  final int? userId;
  final double? amount;
  final int? discountPercentage;
  final double receivedAmount;
  final DateTime paymentDate;
  final String? transactionId;
  final String? paymentStatus;
  final String? paymentMethod;
  final String? paymentType;
  final int? subscriptionId;
  final int? serviceUsageId;

  Alluserpaymentmodel({
    required this.id,
    required this.userId,
    required this.amount,
    this.discountPercentage, // Nullable field
    required this.receivedAmount,
    required this.paymentDate,
    required this.transactionId,
    required this.paymentStatus,
    required this.paymentMethod,
    required this.paymentType,
    this.subscriptionId, // Nullable field
    this.serviceUsageId, // Nullable field
  });

  factory Alluserpaymentmodel.fromJson(Map<String, dynamic> json) =>
      Alluserpaymentmodel(
        id: json["Id"],
        userId: json["UserId"],
        amount: json["Amount"]?.toDouble(),
        discountPercentage: json["DiscountPercentage"], // Safely handle null
        receivedAmount: json["ReceivedAmount"]?.toDouble(),
        paymentDate: DateTime.parse(json["PaymentDate"]),
        transactionId: json["TransactionId"],
        paymentStatus: json["PaymentStatus"],
        paymentMethod: json["PaymentMethod"],
        paymentType: json["PaymentType"],
        subscriptionId: json["SubscriptionId"], // Safely handle null
        serviceUsageId: json["ServiceUsageId"], // Safely handle null
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "UserId": userId,
        "Amount": amount,
        "DiscountPercentage": discountPercentage, // Nullable
        "ReceivedAmount": receivedAmount,
        "PaymentDate": paymentDate.toIso8601String(),
        "TransactionId": transactionId,
        "PaymentStatus": paymentStatus,
        "PaymentMethod": paymentMethod,
        "PaymentType": paymentType,
        "SubscriptionId": subscriptionId, // Nullable
        "ServiceUsageId": serviceUsageId, // Nullable
      };
}
