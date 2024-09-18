class Xtremer {
  int? id;
  int? XtremerId;
  String? firstName;
  String? surname;
  DateTime? dateOfBirth;
  String? address;
  String? postcode;
  String? occupation;
  String? homeNumber;
  String? mobileNumber;
  String? email;
  String? profilePhotoPath;
  String? disability;
  String? preferTiming;
  String? contactName;
  String? contactNumber;
  String? relationship;
  bool unableToExercise;
  bool physicianAdvisedAgainst;
  bool cardiacIssues;
  bool respiratoryDifficulties;
  bool faintingMigraines;
  bool boneJointMuscleIssues;
  bool familyHeartDisease;
  bool chestPain;
  bool highBloodPressure;
  bool elevatedCholesterol;
  bool prescribedMedication;
  String? doctorName;
  String? surgeryName;
  String? surgeryNumber;
  String? surgeryAddress;
  bool? declaration;
  String? category;
  int? submittedBy;
  bool? isActive;
  String? category;
  DateTime? createddate;
  Xtremer(
      {this.id,
      this.XtremerId,
      this.firstName,
      this.surname,
      this.dateOfBirth,
      this.address,
      this.postcode,
      this.occupation,
      this.homeNumber,
      this.mobileNumber,
      this.email,
      this.profilePhotoPath,
      this.disability,
      this.preferTiming,
      this.contactName,
      this.contactNumber,
      this.relationship,
      this.unableToExercise = false,
      this.physicianAdvisedAgainst = false,
      this.cardiacIssues= false,
      this.respiratoryDifficulties = false,
      this.faintingMigraines= false,
      this.boneJointMuscleIssues = false,
      this.familyHeartDisease = false,
      this.chestPain = false,
      this.highBloodPressure = false,
      this.elevatedCholesterol = false,
      this.prescribedMedication = false,
      this.doctorName,
      this.surgeryName,
      this.surgeryNumber,
      this.surgeryAddress,
      this.declaration,
      this.submittedBy,
      this.category,
      this.isActive,
      this.category,
      this.createddate});

  // Factory method to create a Xtremer instance from a JSON map
  factory Xtremer.fromJson(Map<String, dynamic> json) {
    return Xtremer(
        id: json['Id'] ?? 0, // Provide a default value if null
        XtremerId: json['UserId'] ?? 0,
        firstName: json['FirstName'] ?? '',
        surname: json['Surname'] ?? '',
        dateOfBirth: json['DateOfBirth'] != null
            ? DateTime.parse(json['DateOfBirth'])
            : null, // Handle null date
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
        category: json['Category'] ?? 'General',
        submittedBy: json['SubmittedBy'],
<<<<<<< HEAD
        isActive: json['IsActive'] ?? false,
        category: json['Category'],
        createddate: json['CreatedDate'] ?? DateTime.now());
=======
        isActive: json['isActive'] ?? true,
        createddate: json['createddate'] ?? DateTime.now());
>>>>>>> 134541aab72beed05a76bb08a7707b07eb2a2da5
  }

  // Method to convert a Xtremer instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'XtremerId': XtremerId,
      'firstName': firstName,
      'surname': surname,
      'dateOfBirth': dateOfBirth!.toIso8601String(),
      'address': address,
      'postcode': postcode,
      'occupation': occupation,
      'homeNumber': homeNumber,
      'mobileNumber': mobileNumber,
      'email': email,
      'profilePhotoPath': profilePhotoPath,
      'disability': disability,
      'preferTiming': preferTiming,
      'contactName': contactName,
      'contactNumber': contactNumber,
      'relationship': relationship,
      'unableToExercise': unableToExercise,
      'physicianAdvisedAgainst': physicianAdvisedAgainst,
      'cardiacIssues': cardiacIssues,
      'respiratoryDifficulties': respiratoryDifficulties,
      'faintingMigraines': faintingMigraines,
      'boneJointMuscleIssues': boneJointMuscleIssues,
      'familyHeartDisease': familyHeartDisease,
      'chestPain': chestPain,
      'highBloodPressure': highBloodPressure,
      'elevatedCholesterol': elevatedCholesterol,
      'prescribedMedication': prescribedMedication,
      'doctorName': doctorName,
      'surgeryName': surgeryName,
      'surgeryNumber': surgeryNumber,
      'surgeryAddress': surgeryAddress,
      'declaration': declaration,
      'submittedBy': submittedBy,
      'isActive': isActive,
<<<<<<< HEAD
      'category': category,
      'createddate': createddate
=======
      'createddate': createddate,
      'category': category
>>>>>>> 134541aab72beed05a76bb08a7707b07eb2a2da5
    };
  }
}
