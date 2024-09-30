class ServiceSchedule {
  int id;
  int userId;
  int serviceId;
  DateTime scheduleDate;
  double price;
  String status;

  ServiceSchedule({
    required this.id,
    required this.userId,
    required this.serviceId,
    required this.scheduleDate,
    required this.price,
    required this.status,
  });

  // Factory method to create a ServiceSchedule instance from a JSON map
  factory ServiceSchedule.fromJson(Map<String, dynamic> json) {
  
    return ServiceSchedule(
      id: json['Id'],
      userId: json['UserId'],
      serviceId: json['ServiceId'],
      scheduleDate: DateTime.parse(json['ScheduleDate']),
      price: (json['Price'] as num).toDouble(),
      status: json['Status'],
    );
  }

  // Method to convert a ServiceSchedule instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'Id':id,
      'UserId': userId,
      'ServiceId': serviceId,
      'ScheduleDate': scheduleDate.toIso8601String(),
      'Price': price,
      'Status': status,
    };
  }
}
