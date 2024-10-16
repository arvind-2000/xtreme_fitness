import 'paymententity.dart';

class PaymentByTransaction extends PaymentModel {
  String? fullName;

  PaymentByTransaction({
    required super.id,
    required super.userId,
    required super.amount,
    required super.discountPercentage,
    required super.receivedAmount,
    required super.paymentDate,
    required super.transactionId,
    required super.paymentStatus,
    required super.paymentMethod,
    required super.paymentType,
    required super.subscriptionId,
    required super.serviceUsageId,
    required super.termsAndConditions,
    this.fullName, // Nullable field
  });

  // Factory method to create a PaymentByTransaction instance from a JSON map
  factory PaymentByTransaction.fromJson(Map<String, dynamic> json) {
    return PaymentByTransaction(
      id: json['Id'],
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
      termsAndConditions: json['TermsAndConditions'],
      fullName: json['FullName'], // Nullable field
    );
  }

  // Method to convert a PaymentByTransaction instance to a JSON map
  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson(); // Get the base class JSON
    json['fullName'] = fullName; // Add the fullName field if not null
    return json;
  }
}
