class PaymentDetails {
  final int id;
  final int userId;
  final double amount;
  final double discountPercentage;
  final double receivedAmount;
  final DateTime paymentDate;
  final String transactionId;
  final String paymentStatus;
  final String paymentMethod;
  final String paymentType;
  final int subscriptionId;
  final int? serviceUsageId;

  PaymentDetails({
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
    this.serviceUsageId,
  });

  // Factory method to create an instance from JSON
  factory PaymentDetails.fromJson(Map<String, dynamic> json) {
    return PaymentDetails(
      id: json['Id'] as int,
      userId: json['UserId'] as int,
      amount: (json['Amount'] as num).toDouble(),
      discountPercentage: (json['DiscountPercentage'] as num).toDouble(),
      receivedAmount: (json['ReceivedAmount'] as num).toDouble(),
      paymentDate: DateTime.parse(json['PaymentDate'] as String),
      transactionId: json['TransactionId'] as String,
      paymentStatus: json['PaymentStatus'] as String,
      paymentMethod: json['PaymentMethod'] as String,
      paymentType: json['PaymentType'] as String,
      subscriptionId: json['SubscriptionId'] as int,
      serviceUsageId: json['ServiceUsageId'] != null ? json['ServiceUsageId'] as int : null,
    );
  }
}
