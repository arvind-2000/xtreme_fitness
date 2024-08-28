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
      id: json['id'],
      userId: json['userId'],
      serviceId: json['serviceId'],
      scheduleDate: DateTime.parse(json['scheduleDate']),
      price: (json['price'] as num).toDouble(),
      status: json['status'],
    );
  }

  // Method to convert a ServiceSchedule instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'serviceId': serviceId,
      'scheduleDate': scheduleDate.toIso8601String(),
      'price': price,
      'status': status,
    };
  }
}
