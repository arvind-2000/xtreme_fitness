import 'dart:math';

import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/paymententity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/servicesentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/trainerentity.dart';

import '../managementdomain/entities.dart/planentity.dart';
import '../managementdomain/entities.dart/user.dart';
import '../managementdomain/entities.dart/xtremer.dart';

// List<Plan> dummyplan = [

//   Plan(planid: Random().nextInt(1000).toString(), name: "personal", durationinmonths:3, price: 1500, category: "Personal", discount: 0),
//   Plan(planid: Random().nextInt(1000).toString(), name: "general", durationinmonths:2, price: 1500, category: "General", discount: 10),
//   Plan(planid: Random().nextInt(1000).toString(), name: "Zumba", durationinmonths:1, price: 1400, category: "Zumba", discount: 5),
//   Plan(planid: Random().nextInt(1000).toString(), name: "Aerobic", durationinmonths:1, price: 1200, category: "Aerobic", discount: 20),

// ];
// List<ServicesEntity> dummyservices = [
//   ServicesEntity(serviceid: Random().nextInt(1000).toString(), servicename:"Steam Bath", memberprice: 200, nonmemberprice: 300),
//   ServicesEntity(serviceid: Random().nextInt(1000).toString(), servicename:"Massage Chair", memberprice: 300, nonmemberprice: 400),

// ];
List<Paymententity> dummypayments = [];
// List<Xtremer> dummyxtremer = [];
// List<Staff> dummystaff = [
//   TrainerEntity(uid:  Random().nextInt(1000).toString(), name:"rahul", phone:  Random().nextInt(1000000000).toString(), username:"jfhdj", roleid:Role(roleid: "4", rolename: "Manager"), isactive: true),
//   TrainerEntity(uid:  Random().nextInt(1000).toString(), name:"Gokul", phone:  Random().nextInt(1000000000).toString(), username:"jfhfdj", roleid:Role(roleid: "5", rolename: "Receptionist"), isactive: true),
//   TrainerEntity(uid:  Random().nextInt(1000).toString(), name:"Raja", phone:  Random().nextInt(1000000000).toString(), username:"lkkkk", roleid:Role(roleid: "6", rolename: "Others"), isactive: true),
// ];
// List<TrainerEntity> dummytrainers = [
//   TrainerEntity(uid:  Random().nextInt(1000).toString(), name:"rahul", phone:  Random().nextInt(1000000000).toString(), username:"jfhdj", roleid:Role(roleid: "12", rolename: "Trainer"), isactive: true),
//   TrainerEntity(uid:  Random().nextInt(1000).toString(), name:"Gokul", phone:  Random().nextInt(1000000000).toString(), username:"jfhfdj", roleid:Role(roleid: "12", rolename: "Trainer"), isactive: true),
//   TrainerEntity(uid:  Random().nextInt(1000).toString(), name:"Raja", phone:  Random().nextInt(1000000000).toString(), username:"lkkkk", roleid:Role(roleid: "12", rolename: "Trainer"), isactive: true),
// ];