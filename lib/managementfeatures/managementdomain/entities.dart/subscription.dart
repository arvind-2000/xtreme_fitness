class Subscription {
  int? id;
  String userId;
  int planId;
  int? trainerId;
  DateTime startDate;
  DateTime endDate;
  bool isActive;

  Subscription({
    this.id,
    required this.userId,
    required this.planId,
    required this.startDate,
    required this.endDate,
    this.trainerId,
    required this.isActive
  });

  // Factory method to create a Subscription instance from a JSON map
  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      id: json['Id'],
      userId: json['UserId'].toString(),
      planId:json['PlanId'],
      startDate: DateTime.parse(json['StartDate']),
      endDate: DateTime.parse(json['EndDate']),
      trainerId: json['TrainerId'],
      isActive: json['IsActive']

    );
  }

  // Method to convert a Subscription instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'planId': planId,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'isActive': isActive,
      'trainerId':trainerId
    };
  }

    
}