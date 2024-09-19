class Membership {
  int? id;
  int? userId;
  int? membershipId;
  int? admissionId;
  bool? admissionFeePaid;
  DateTime? startDate;
  bool? bmiUsed;
  bool? isActive;

  Membership({
    this.id,
    this.userId,
    this.membershipId,
    this.admissionId,
    this.admissionFeePaid,
    this.startDate,
    this.bmiUsed,
    this.isActive,
  });

  factory Membership.fromJson(Map<String, dynamic> json) {
    return Membership(
      id: json['Id'] as int?,
      userId: json['UserId'] as int?,
      membershipId: json['MembershipId'] as int?,
      admissionId: json['AdmissionId'] as int?,
      admissionFeePaid: json['AdmissionFeePaid'] as bool?,
      startDate: json['StartDate'] != null 
          ? DateTime.tryParse(json['StartDate']) 
          : null,
      bmiUsed: json['BmiUsed'] as bool?,
      isActive: json['IsActive'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'membershipId': membershipId,
      'admissionId': admissionId,
      'admissionFeePaid': admissionFeePaid,
      'startDate': startDate?.toIso8601String(), // Use ISO format for date
      'bmiUsed': bmiUsed,
      'isActive': isActive,
    };
  }
}
