class UserEntity {
  int? id;
  String? fullName;
  String? mobileNumber;
  String? userName;
  String? passwordHash;
  String? roleName;
  DateTime? createdAt;
  bool? isActive;

  UserEntity({
    this.id,
    this.mobileNumber,
    this.fullName,
    required this.userName,
    required this.passwordHash,
    this.roleName,
    this.createdAt,
    this.isActive,
  });

  // Factory method to create a User instance from JSON
  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['Id'] != null ? json['Id'] as int : null,
      fullName: json['FullName'] != null ? json['FullName'] as String : null,
      mobileNumber: json['MobileNumber'] != null ? json['MobileNumber'] as String : null,
      userName: json['UserName'] as String? ?? '',  // Ensuring userName is not null
      passwordHash: json['PasswordHash'] as String? ?? '',  // Ensuring passwordHash is not null
      roleName: json['RoleName'] != null ? json['RoleName'] as String : null,
      createdAt: json['CreatedAt'] != null ? DateTime.tryParse(json['CreatedAt']) : null,
      isActive: json['IsActive'] as bool? ?? false, // Default to false if null
    );
  }

  // Method to convert User instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'FullName':fullName,
      'MobileNumber': mobileNumber,
      'UserName': userName,
      'PasswordHash': passwordHash,
      'RoleName': roleName,
      'CreatedAt': createdAt?.toIso8601String(),
      'IsActive': isActive,
    };
  }
}
