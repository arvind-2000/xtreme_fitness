import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/user.dart';

class TrainerEntity extends User {
  int id;
  String name;
  String designation;
  String timing;

  TrainerEntity({
    required this.id,
    required this.name,
    required this.designation,
    required this.timing,
  }) : super(uid: id.toString(), name: name, phone: '', username: '', roleid:Role(roleid: "0", rolename: designation));

  // Convert a Trainer instance to a Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'designation': designation,
      'timing': timing,
    };
  }

  // Create a Trainer instance from a Map
  factory TrainerEntity.fromJson(Map<String, dynamic> json) {
    return TrainerEntity(
      id: json['Id'],
      name: json['Name'],
      designation: json['Designation'],
      timing: json['Timing'],
    );
  }
}