class Role {
  int id;
  String roleName;

  Role({required this.id, required this.roleName});

  // Factory constructor to create an instance from a map (useful for JSON decoding)
  factory Role.fromMap(Map<String, dynamic> map) {
    return Role(
      id: map['Id'] ?? 0,
      roleName: map['RoleName'] ?? '',
    );
  }

  // Method to convert an instance to a map (useful for JSON encoding)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'roleName': roleName,
    };
  }
}
