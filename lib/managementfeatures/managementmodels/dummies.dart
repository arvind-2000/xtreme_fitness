import 'dart:math';

import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/paymententity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/servicesentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/trainerentity.dart';

import '../managementdomain/entities.dart/planentity.dart';
import '../managementdomain/entities.dart/user.dart';
import '../managementdomain/entities.dart/xtremer.dart';

List<Plan> dummyplan = [

  Plan(id: Random().nextInt(1000), name: "personal", durationInMonths:3, price: 1500, category: "Personal", discountPercentage: 0),
  Plan(id: Random().nextInt(1000), name: "general", durationInMonths:2, price: 1500, category: "General", discountPercentage: 10),
  Plan(id: Random().nextInt(1000), name: "Zumba", durationInMonths:1, price: 1400, category: "Zumba", discountPercentage: 5),
  Plan(id: Random().nextInt(1000), name: "Aerobic", durationInMonths:1, price: 1200, category: "Aerobic", discountPercentage: 20),

];
List<ServiceEntity> dummyservices = [
  ServiceEntity(id: Random().nextInt(1000), name: "Massage Chair", memberPrice: 300, nonMemberPrice: 400, durationInMinutes: 30),
  ServiceEntity(id: Random().nextInt(1000), name: "BMI", memberPrice: 200, nonMemberPrice: 300, durationInMinutes: 30),
  ServiceEntity(id: Random().nextInt(1000), name: "Sauna", memberPrice: 300, nonMemberPrice: 400, durationInMinutes: 30),

];
List<Paymententity> dummypayments = [];
// List<Xtremer> dummyxtremer = [];
// List<Staff> dummystaff = [
//   TrainerEntity(uid:  Random().nextInt(1000).toString(), name:"rahul", phone:  Random().nextInt(1000000000).toString(), username:"jfhdj", roleid:Role(roleid: "4", rolename: "Manager"), isactive: true),
//   TrainerEntity(uid:  Random().nextInt(1000).toString(), name:"Gokul", phone:  Random().nextInt(1000000000).toString(), username:"jfhfdj", roleid:Role(roleid: "5", rolename: "Receptionist"), isactive: true),
//   TrainerEntity(uid:  Random().nextInt(1000).toString(), name:"Raja", phone:  Random().nextInt(1000000000).toString(), username:"lkkkk", roleid:Role(roleid: "6", rolename: "Others"), isactive: true),
// ];
// List<TrainerEntity> dummytrainers = [
//   TrainerEntity(id:  Random().nextInt(1000), name:"rahul",designation: "trainer",timing: "morning"),];