import 'package:universal_html/html.dart';

class Paymententity {
  int id;
  int userId;
  double amount;
  double discountPercentage;
  double receivedAmount;
  DateTime paymentDate;
  String transactionId;
  String paymentStatus;
  String paymentMethod;
  String paymentType;
  int? subscriptionId;
  int? serviceUsageId;
  bool termsAndConditions;
  Paymententity({
    required this.id,
    required this.userId,
    required this.amount,
    required this.discountPercentage,
    required this.receivedAmount,
    required this.paymentDate,
    required this.transactionId,
    required this.paymentStatus,
    required this.paymentMethod,
    required this.paymentType,
    required this.subscriptionId,
    required this.serviceUsageId,
    required this.termsAndConditions
  });

  // Factory method to create a Payment instance from a JSON map
factory Paymententity.fromJson(Map<String, dynamic> json) {
  return Paymententity(
    id: json['Id'], // Use JSON key "Id"
    userId: json['UserId'],
    amount: (json['Amount'] as num).toDouble(),
    discountPercentage: (json['DiscountPercentage'] as num).toDouble(),
    receivedAmount: (json['ReceivedAmount'] as num).toDouble(),
    paymentDate: DateTime.parse(json['PaymentDate']),
    transactionId: json['TransactionId'],
    paymentStatus: json['PaymentStatus'],
    paymentMethod: json['PaymentMethod'],
    paymentType: json['PaymentType'],
    subscriptionId: json['SubscriptionId'],
    serviceUsageId: json['ServiceUsageId'],
    termsAndConditions: json['TermsAndConditions']
  );
}

  // Method to convert a Payment instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'userId': userId,
      'amount': amount,
      'discountPercentage': discountPercentage,
      'receivedAmount': receivedAmount,
      'paymentDate': paymentDate.toIso8601String(),
      'transactionId': transactionId,
      'paymentStatus': paymentStatus,
      'paymentMethod': paymentMethod,
      'paymentType': paymentType,
      'subscriptionId': subscriptionId,
      'serviceUsageId': serviceUsageId,
      'termsAndConditions':termsAndConditions
    };
  }

    void printPayment(){

        print('id : $id  xtremerid: $userId  amount: $amount  discount: $discountPercentage receiveamnt: $receivedAmount transid: $transactionId  paystatus: $paymentStatus subsid: $subscriptionId serviceid: $serviceUsageId  paymentmethod: $paymentMethod date: $paymentDate');

    }

}

class PaymentModel extends Paymententity{
  PaymentModel({required super.id, required super.userId, required super.amount, required super.discountPercentage, required super.receivedAmount, required super.paymentDate, required super.transactionId, required super.paymentStatus, required super.paymentMethod, required super.paymentType, required super.subscriptionId, required super.serviceUsageId, required super.termsAndConditions});
 


}