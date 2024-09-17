class Trainee {
  final int? id;
  final int? userId;
  final String? firstName;
  final String? surname;
  final String? mobileNumber;
  final int? trainerId;
  final String? email;
  final String? preferTiming;
  final int? subscriptionId;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool? isActive;

  Trainee({
    required this.id,
    required this.userId,
    required this.firstName,
    this.surname,
    required this.mobileNumber,
    required this.trainerId,
    required this.email,
    this.preferTiming,
    required this.subscriptionId,
    required this.startDate,
    required this.endDate,
    required this.isActive,
  });

  // Factory constructor to create an instance from a JSON map
  factory Trainee.fromJson(Map<String, dynamic> json) {
    return Trainee(
      id: json['Id'],
      userId: json['UserId'],
      firstName: json['FirstName'],
      surname: json['Surname'],
      mobileNumber: json['MobileNumber'],
      trainerId: json['TrainerId'],
      email: json['Email'],
      preferTiming: json['PreferTiming'],
      subscriptionId: json['SubscriptionId'],
      startDate: DateTime.parse(json['StartDate']),
      endDate: DateTime.parse(json['EndDate']),
      isActive: json['IsActive'],
    );
  }

  // Method to convert an instance into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'UserId': userId,
      'FirstName': firstName,
      'Surname': surname,
      'MobileNumber': mobileNumber,
      'TrainerId': trainerId,
      'Email': email,
      'PreferTiming': preferTiming,
      'SubscriptionId': subscriptionId,
      'StartDate': startDate.toString(),
      'EndDate': endDate.toString(),
      'IsActive': isActive,
    };
  }
}
