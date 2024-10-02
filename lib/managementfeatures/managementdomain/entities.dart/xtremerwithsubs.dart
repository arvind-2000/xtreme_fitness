import 'xtremer.dart';

class XtremerWithSubscription extends Xtremer {
  DateTime? startDate;
  DateTime? endDate;

  XtremerWithSubscription({
    int? id,
    int? XtremerId,
    String? firstName,
    String? surname,
    DateTime? dateOfBirth,
    String? address,
    String? postcode,
    String? occupation,
    String? homeNumber,
    String? mobileNumber,
    String? email,
    String? profilePhotoPath,
    String? disability,
    String? preferTiming,
    String? contactName,
    String? contactNumber,
    String? relationship,
    bool unableToExercise = false,
    bool physicianAdvisedAgainst = false,
    bool cardiacIssues = false,
    bool respiratoryDifficulties = false,
    bool faintingMigraines = false,
    bool boneJointMuscleIssues = false,
    bool familyHeartDisease = false,
    bool chestPain = false,
    bool highBloodPressure = false,
    bool elevatedCholesterol = false,
    bool prescribedMedication = false,
    String? doctorName,
    String? surgeryName,
    String? surgeryNumber,
    String? surgeryAddress,
    bool? declaration,
    int? submittedBy,
    bool? isActive,
    String? category,
    DateTime? createddate,
    this.startDate,
    this.endDate,
  }) : super(
          id: id,
          XtremerId: XtremerId,
          firstName: firstName,
          surname: surname,
          dateOfBirth: dateOfBirth,
          address: address,
          postcode: postcode,
          occupation: occupation,
          homeNumber: homeNumber,
          mobileNumber: mobileNumber,
          email: email,
          profilePhotoPath: profilePhotoPath,
          disability: disability,
          preferTiming: preferTiming,
          contactName: contactName,
          contactNumber: contactNumber,
          relationship: relationship,
          unableToExercise: unableToExercise,
          physicianAdvisedAgainst: physicianAdvisedAgainst,
          cardiacIssues: cardiacIssues,
          respiratoryDifficulties: respiratoryDifficulties,
          faintingMigraines: faintingMigraines,
          boneJointMuscleIssues: boneJointMuscleIssues,
          familyHeartDisease: familyHeartDisease,
          chestPain: chestPain,
          highBloodPressure: highBloodPressure,
          elevatedCholesterol: elevatedCholesterol,
          prescribedMedication: prescribedMedication,
          doctorName: doctorName,
          surgeryName: surgeryName,
          surgeryNumber: surgeryNumber,
          surgeryAddress: surgeryAddress,
          declaration: declaration,
          submittedBy: submittedBy,
          isActive: isActive,
          category: category,
          createddate: createddate,
        );

  // Factory method to create an instance from JSON
  factory XtremerWithSubscription.fromJson(Map<String, dynamic> json) {
    return XtremerWithSubscription(
      id: json['Id'] ?? 0,
      XtremerId: json['UserId'] ?? 0,
      firstName: json['FirstName'] ?? '',
      surname: json['Surname'] ?? '',
      dateOfBirth: json['DateOfBirth'] != null
          ? DateTime.parse(json['DateOfBirth'])
          : null,
      address: json['Address'] ?? '',
      postcode: json['Postcode'] ?? '',
      occupation: json['Occupation'] ?? '',
      homeNumber: json['HomeNumber'] ?? '',
      mobileNumber: json['MobileNumber'] ?? '',
      email: json['Email'] ?? '',
      profilePhotoPath: json['ProfilePhotoPath'] ?? '',
      disability: json['Disability'] ?? '',
      preferTiming: json['PreferTiming'] ?? '',
      contactName: json['ContactName'] ?? '',
      contactNumber: json['ContactNumber'] ?? '',
      relationship: json['Relationship'] ?? '',
      unableToExercise: json['UnableToExercise'] ?? false,
      physicianAdvisedAgainst: json['PhysicianAdvisedAgainst'] ?? false,
      cardiacIssues: json['CardiacIssues'] ?? false,
      respiratoryDifficulties: json['RespiratoryDifficulties'] ?? false,
      faintingMigraines: json['FaintingMigraines'] ?? false,
      boneJointMuscleIssues: json['BoneJointMuscleIssues'] ?? false,
      familyHeartDisease: json['FamilyHeartDisease'] ?? false,
      chestPain: json['ChestPain'] ?? false,
      highBloodPressure: json['HighBloodPressure'] ?? false,
      elevatedCholesterol: json['ElevatedCholesterol'] ?? false,
      prescribedMedication: json['PrescribedMedication'] ?? false,
      doctorName: json['DoctorName'] ?? '',
      surgeryName: json['SurgeryName'] ?? '',
      surgeryNumber: json['SurgeryNumber'] ?? '',
      surgeryAddress: json['SurgeryAddress'] ?? '',
      declaration: json['Declaration'] ?? false,
      submittedBy: json['SubmittedBy'],
      isActive: json['IsActive'] ?? false,
      category: json['Category'] ?? "General",
      createddate: json['CreatedAt'] != null
          ? DateTime.parse(json['CreatedAt'])
          : DateTime.now(),
      startDate: json['StartDate'] != null
          ? DateTime.parse(json['StartDate'])
          : null,
      endDate: json['EndDate'] != null
          ? DateTime.parse(json['EndDate'])
          : null,
    );
  }

  // Method to convert an instance to JSON
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['startDate'] = startDate?.toIso8601String();
    data['endDate'] = endDate?.toIso8601String();
    return data;
  }
}
