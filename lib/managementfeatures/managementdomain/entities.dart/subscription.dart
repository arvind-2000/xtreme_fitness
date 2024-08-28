class Subscription {
  int? id;
  String userId;
  int planId;
  DateTime startDate;
  DateTime endDate;
  String status;

  Subscription({
    this.id,
    required this.userId,
    required this.planId,
    required this.startDate,
    required this.endDate,
    required this.status,
  });

  // Factory method to create a Subscription instance from a JSON map
  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      id:int.tryParse( json['Id'])??0,
      userId: json['UserId'].toString(),
      planId: int.tryParse(json['PlanId'])??0,
      startDate: DateTime.parse(json['StartDate']),
      endDate: DateTime.parse(json['EndDate']),
      status: json['Status'].toString(),
    );
  }

  // Method to convert a Subscription instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'planId': planId,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'status': status,
    };
  }
}