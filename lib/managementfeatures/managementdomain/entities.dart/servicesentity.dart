class ServiceEntity {
  int id;
  String name;
  double memberPrice;
  double nonMemberPrice;
  int durationInMinutes;
  bool isactive;

  ServiceEntity({
    required this.id,
    required this.name,
    required this.memberPrice,
    required this.nonMemberPrice,
    required this.durationInMinutes,
    required this.isactive
  });

  // Convert a Service instance to a Map
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'MemberPrice': memberPrice,
      'NonMemberPrice': nonMemberPrice,
      'DurationInMinutes': durationInMinutes,
      'IsActive':isactive
    };
  }

  // Create a Service instance from a Map
  factory ServiceEntity.fromJson(Map<String, dynamic> json) {

    return ServiceEntity(
      id: json['Id'],
      name: json['Name'],
      memberPrice: json['MemberPrice'],
      nonMemberPrice: json['NonMemberPrice'],
      isactive: json['IsActive']??false,
      durationInMinutes: json['DurationInMinutes'],
    );
  }
}