import 'dart:math';

import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/paymententity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/servicesentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/trainerentity.dart';

import '../../authentifeatures/domain/userentity.dart';
import '../managementdomain/entities.dart/planentity.dart';
import '../managementdomain/entities.dart/trainee.dart';
import '../managementdomain/entities.dart/user.dart';
import '../managementdomain/entities.dart/userpaymentmodel.dart';
import '../managementdomain/entities.dart/xtremer.dart';

List<Plan> dummyplan = [

  Plan(id: Random().nextInt(1000), name: "personal", durationInMonths:3, price: 1500, category: "Personal", discountPercentage: 0,isActive: true),
  Plan(id: Random().nextInt(1000), name: "general", durationInMonths:2, price: 1500, category: "General", discountPercentage: 10,isActive: true),
  Plan(id: Random().nextInt(1000), name: "Zumba", durationInMonths:1, price: 1400, category: "Zumba", discountPercentage: 5,isActive: false),
  Plan(id: Random().nextInt(1000), name: "Zumba", durationInMonths:1, price: 1400, category: "Zumba", discountPercentage: 5,isActive: false),
  Plan(id: Random().nextInt(1000), name: "Zumba", durationInMonths:1, price: 1400, category: "Zumba", discountPercentage: 5,isActive: false),
  Plan(id: Random().nextInt(1000), name: "Zumba", durationInMonths:1, price: 1400, category: "Zumba", discountPercentage: 5,isActive: false),
  Plan(id: Random().nextInt(1000), name: "Zumba", durationInMonths:1, price: 1400, category: "Zumba", discountPercentage: 5,isActive: false),
  Plan(id: Random().nextInt(1000), name: "Zumba", durationInMonths:1, price: 1400, category: "Zumba", discountPercentage: 5,isActive: false),
  Plan(id: Random().nextInt(1000), name: "Aerobic", durationInMonths:1, price: 1200, category: "Aerobic", discountPercentage: 20,isActive: true),

];
List<ServiceEntity> dummyservices = [
  ServiceEntity(id: Random().nextInt(1000), name: "Massage Chair", memberPrice: 300, nonMemberPrice: 400, durationInMinutes: 30,isactive: true),
  ServiceEntity(id: Random().nextInt(1000), name: "BMI", memberPrice: 200, nonMemberPrice: 300, durationInMinutes: 30,isactive: true),
  ServiceEntity(id: Random().nextInt(1000), name: "Sauna", memberPrice: 300, nonMemberPrice: 400, durationInMinutes: 30,isactive: true),

];

List<Xtremer> dummyxtremer = [
    Xtremer(id: 1,XtremerId: 2,firstName: "Boka",surname: 'Sarungbam',address: "keis",mobileNumber: '1234567899',isActive: true),
    Xtremer(id: 1,XtremerId: 2,firstName: "Boka",surname: 'Sarungbam',address: "keis",mobileNumber: '1234567899',isActive: true),
    Xtremer(id: 1,XtremerId: 2,firstName: "Boka",surname: 'Sarungbam',address: "keis",mobileNumber: '1234567899',isActive: true),
    Xtremer(id: 1,XtremerId: 2,firstName: "Boka",surname: 'Sarungbam',address: "keis",mobileNumber: '1234567899',isActive: true),
    Xtremer(id: 1,XtremerId: 2,firstName: "Boka",surname: 'Sarungbam',address: "keis",mobileNumber: '1234567899',isActive: true),
    Xtremer(id: 1,XtremerId: 2,firstName: "Boka",surname: 'Sarungbam',address: "keis",mobileNumber: '1234567899',isActive: true),
    Xtremer(id: 1,XtremerId: 2,firstName: "Boka",surname: 'Sarungbam',address: "keis",mobileNumber: '1234567899',isActive: true),
    Xtremer(id: 1,XtremerId: 2,firstName: "Boka",surname: 'Sarungbam',address: "keis",mobileNumber: '1234567899',isActive: true),
    Xtremer(id: 1,XtremerId: 2,firstName: "Boka",surname: 'Sarungbam',address: "keis",mobileNumber: '1234567899',isActive: true),
    Xtremer(id: 1,XtremerId: 2,firstName: "Boka",surname: 'Sarungbam',address: "keis",mobileNumber: '1234567899',isActive: true),
];
List<UserEntity> dummystaff = [
    UserEntity(userName: 'Rahuls', passwordHash: 'fjdf',mobileNumber: '129948394893',isActive: true),
    UserEntity(userName: 'Rahuls', passwordHash: 'fjdf',mobileNumber: '129948394893',isActive: true),
    UserEntity(userName: 'Rahuls', passwordHash: 'fjdf',mobileNumber: '129948394893',isActive: true),
    UserEntity(userName: 'Rahuls', passwordHash: 'fjdf',mobileNumber: '129948394893',isActive: true),
    UserEntity(userName: 'Rahuls', passwordHash: 'fjdf',mobileNumber: '129948394893',isActive: true),
];
List<TrainerEntity> dummytrainers = [
  TrainerEntity(id:  Random().nextInt(1000), name:"rahul",designation: "trainer",timing: "morning", isActive: true),
  TrainerEntity(id:  Random().nextInt(1000), name:"raja",designation: "trainer",timing: "morning", isActive: true),
  TrainerEntity(id:  Random().nextInt(1000), name:"ramon",designation: "trainer",timing: "morning", isActive: true),
  TrainerEntity(id:  Random().nextInt(1000), name:"tomal",designation: "trainer",timing: "morning", isActive: true),
  TrainerEntity(id:  Random().nextInt(1000), name:"Kesho",designation: "trainer",timing: "morning", isActive: true),
  TrainerEntity(id:  Random().nextInt(1000), name:"rahul",designation: "trainer",timing: "morning", isActive: false),
  TrainerEntity(id:  Random().nextInt(1000), name:"rahul",designation: "trainer",timing: "morning", isActive: false),
  TrainerEntity(id:  Random().nextInt(1000), name:"rahul",designation: "trainer",timing: "morning", isActive: false),
  TrainerEntity(id:  Random().nextInt(1000), name:"rahul",designation: "trainer",timing: "morning", isActive: false),
  TrainerEntity(id:  Random().nextInt(1000), name:"rahul",designation: "trainer",timing: "morning", isActive: false),
  TrainerEntity(id:  Random().nextInt(1000), name:"rahul",designation: "trainer",timing: "morning", isActive: false),
  
  ];

  List<Trainee> dummytrainees = [
    Trainee(id: 0, userId: 20, firstName: "raashi", mobileNumber: '839849381', trainerId: 20, email: 'fdfh@gm.com', subscriptionId: 10, startDate: DateTime.now(), endDate: DateTime.now(), isActive: true),
    Trainee(id: 0, userId: 20, firstName: "raashi", mobileNumber: '839849381', trainerId: 20, email: 'fdfh@gm.com', subscriptionId: 10, startDate: DateTime.now(), endDate: DateTime.now(), isActive: true),
    Trainee(id: 0, userId: 20, firstName: "raashi", mobileNumber: '839849381', trainerId: 20, email: 'fdfh@gm.com', subscriptionId: 10, startDate: DateTime.now(), endDate: DateTime.now(), isActive: true),
    Trainee(id: 0, userId: 20, firstName: "raashi", mobileNumber: '839849381', trainerId: 20, email: 'fdfh@gm.com', subscriptionId: 10, startDate: DateTime.now(), endDate: DateTime.now(), isActive: true),
    Trainee(id: 0, userId: 20, firstName: "raashi", mobileNumber: '839849381', trainerId: 20, email: 'fdfh@gm.com', subscriptionId: 10, startDate: DateTime.now(), endDate: DateTime.now(), isActive: true),
    Trainee(id: 0, userId: 20, firstName: "raashi", mobileNumber: '839849381', trainerId: 20, email: 'fdfh@gm.com', subscriptionId: 10, startDate: DateTime.now(), endDate: DateTime.now(), isActive: true),
    Trainee(id: 0, userId: 20, firstName: "raashi", mobileNumber: '839849381', trainerId: 20, email: 'fdfh@gm.com', subscriptionId: 10, startDate: DateTime.now(), endDate: DateTime.now(), isActive: true),
    Trainee(id: 0, userId: 20, firstName: "raashi", mobileNumber: '839849381', trainerId: 20, email: 'fdfh@gm.com', subscriptionId: 10, startDate: DateTime.now(), endDate: DateTime.now(), isActive: true),
  ];

   List<Alluserpaymentmodel> dummypayments = [
    Alluserpaymentmodel(
        id: 1,
          amount: 1000,
        receivedAmount: 100.0,
        paymentDate: DateTime.now().subtract(Duration(days: 2)), 
        
        
        paymentMethod: 'fdfdf', paymentStatus: 'success', paymentType: 'cash', transactionId: 'vxvxvxvxvxv', userId: 68
        
        
        
        ),
    Alluserpaymentmodel(
        id: 2,
        receivedAmount: 150.0,
        paymentDate: DateTime.now().subtract(Duration(days: 10)), amount: 300,
         paymentMethod: 'fdfdf', paymentStatus: 'success', paymentType: 'cash', transactionId: 'vxvxvxvxvxv', userId: 68
        ),
    Alluserpaymentmodel(
        id: 3,
        receivedAmount: 200.0,
         amount: 500,
        paymentDate: DateTime.now().subtract(Duration(days: 40)),
         paymentMethod: 'fdfdf', paymentStatus: 'success', paymentType: 'cash', transactionId: 'vxvxvxvxvxv', userId: 68
        ),
    Alluserpaymentmodel(
        id: 4,
        receivedAmount: 250.0,
          amount: 600,
        paymentDate: DateTime.now().subtract(Duration(days: 370)),
         paymentMethod: 'fdfdf', paymentStatus: 'success', paymentType: 'cash', transactionId: 'vxvxvxvxvxv', userId: 68
        ),
  ];