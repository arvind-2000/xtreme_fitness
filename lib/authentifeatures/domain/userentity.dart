class UserEntity {
  int? id;
  String? mobileNumber;
  String userName;
  String passwordHash;
  String? roleName;
  DateTime? createdAt;
  bool? isActive;

  UserEntity({
   this.id,
     this.mobileNumber,
    required this.userName,
    required this.passwordHash,
    this.roleName,
   this.createdAt,
   this.isActive,
  });

  // Factory method to create a User instance from JSON
  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['Id'] as int,
      mobileNumber: json['MobileNumber'],
      userName: json['UserName'],
      passwordHash: json['PasswordHash'],
      roleName: json['RoleName'],
      createdAt: DateTime.parse(json['CreatedAt'] as String),
      isActive: json['IsActive']??false,
    );
  }

  // Method to convert User instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'mobileNumber': mobileNumber,
      'userName': userName,
      'passwordHash': passwordHash,
      'roleName': roleName,
      'createdAt':createdAt?.toIso8601String(),
      'isActive': isActive,
    };
  }
}
