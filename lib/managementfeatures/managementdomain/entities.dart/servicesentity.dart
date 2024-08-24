class ServiceEntity {
  int id;
  String name;
  double memberPrice;
  double nonMemberPrice;
  int durationInMinutes;

  ServiceEntity({
    required this.id,
    required this.name,
    required this.memberPrice,
    required this.nonMemberPrice,
    required this.durationInMinutes,
  });

  // Convert a Service instance to a Map
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'MemberPrice': memberPrice,
      'NonMemberPrice': nonMemberPrice,
      'DurationInMinutes': durationInMinutes,
    };
  }

  // Create a Service instance from a Map
  factory ServiceEntity.fromJson(Map<String, dynamic> json) {
    return ServiceEntity(
      id: json['Id'],
      name: json['Name'],
      memberPrice: json['MemberPrice'],
      nonMemberPrice: json['NonMemberPrice'],
      durationInMinutes: json['DurationInMinutes'],
    );
  }
}