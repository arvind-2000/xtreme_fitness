import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/user.dart';

import 'roles.dart';

class TrainerEntity extends User {
  int id;
  String name;
  String designation;
  String timing;
  bool isActive;
  String maxlimit;
  TrainerEntity({
    required this.id,
    required this.name,
    required this.designation,
    required this.timing,
    required this.isActive,
    required this.maxlimit
  }) : super(uid: id.toString(), name: name, phone: '', username: '', roleid:Role(id: 0, roleName: designation));

  // Convert a Trainer instance to a Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'designation': designation,
      'timing': timing,
      "isActive":isActive,
      "maxLimit":maxlimit,
    };
  }

  // Create a Trainer instance from a Map
  factory TrainerEntity.fromJson(Map<String, dynamic> json) {
    return TrainerEntity(
      id: json['Id']??0,
      name: json['Name']??"",
      designation: json['Designation']??"",
      timing: json['Timing']??"",
      isActive: json['IsActive']??false,
      maxlimit: json['MaxLimit']??"0"
    );
  }
}