import 'dart:typed_data';

import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/10latestpayment.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/paymententity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/servicesentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/trainerentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/user.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/userpaymentmodel.dart';

import '../../authentifeatures/domain/userentity.dart';
import 'entities.dart/admission.dart';
import 'entities.dart/membership.dart';
import 'entities.dart/paymenttrans.dart';
import 'entities.dart/planentity.dart';
import 'entities.dart/roles.dart';
import 'entities.dart/serviceusage.dart';
import 'entities.dart/subscription.dart';
import 'entities.dart/trainee.dart';
import 'entities.dart/xtremer.dart';
import 'entities.dart/xtremerwithsubs.dart';

abstract class ManagementRepo {
  ///adding staff for management
  Future<Map<int, String>> addStaff(Staff staff);
  Future<String> updateStaff(UserEntity staff);
  Future<String> deleteStaff(Staff staff);
  Future<List<UserEntity>> viewStaff();

  ///adding members
  Future<Map<String, dynamic>> addMember(
      Xtremer xtremer, Uint8List? filepath, String userid);
  Future<String> updateMember(Xtremer xtremer);
  Future<String> deleteMember(Xtremer xtremer);
  Future<List<Xtremer>> viewMember();
  Future<List<XtremerWithSubscription>> viewMemberwithSubs();
  // Future<List<Xtremer>> viewMemberforoverall();
  Future<List<Xtremer>> viewinactivemembers();
  Future<List<Xtremer>> viewpersonalmembers();
  Future<List<Xtremer>> viewgeneralmembers();
  Future<Uint8List?> getImage(int id);

  ///subscription renewal function
  Future<String> renewal(
      {required Xtremer xtremer, required PaymentModel payment});

  //CRUD for services
  Future<List<ServiceEntity>> getServices();
  Future<String> addServices({required ServiceEntity service});
  Future<String> deleteServices({required ServiceEntity service});
  Future<String> updateServices({required ServiceEntity service});

  //CRUD for plans

  /// adding plans api
  Future<String> addPlans({required Plan plan});

  ///deleting plans api
  Future<bool> deletePlans({required Plan plan});

  /// updating plans api
  Future<String> updatePlans({required Plan plan});

  ///getplans api
  Future<List<Plan>> getPlans();

  ///adding trainer for management
  Future<String> addTrainer(TrainerEntity staff,Uint8List? image);
  Future<String> updateTrainer(TrainerEntity staff,Uint8List? image);
  Future<String> deleteTrainer(TrainerEntity staff);
  Future<List<TrainerEntity>> viewTrainer();
  Future<Uint8List?> viewTrainerphoto(int id);
  Future<List<Xtremer>> viewPersonalTrainer();

  //payments api

  Future<Map<String, dynamic>> addPayments(Paymententity payment,
      {bool isonline, required String userid});
  Future<String> deletePayment(Paymententity payment);
  Future<String> updatePayment(Alluserpaymentmodel payment);
  Future<List<Alluserpaymentmodel>> viewpayment();
  Future<List<Paymentlatest10>> viewlatest10payment();
  Future<PaymentByTransaction?> getpayment(String transcationid);

  ///users api
  Future<Map<int,String>> addUser(String username ,String pass, String phone,String role,String fullname);

  Future<String?> viewUser(String username, String pass);

  ///subscription api
  Future<Subscription?> addSubscription(Subscription subs);
  Future<Subscription?> getSubscription(int id);
  Future<List<Subscription>> getAllSubscription();

  ///service usage api
  Future<ServiceSchedule?> addServiceUsage(ServiceSchedule serviceschedule);
  Future<ServiceSchedule?> getServiceUsage(int id);
  Future<String> updateServiceUsage(ServiceSchedule serviceschedule);
  Future<List<ServiceSchedule>> getAllServiceUsage();

  //admission
  Future<Map<Admission?,int>> viewadmission();
  Future<String> updateadmission(Admission admission);

  Future<List<Trainee>> viewTrainee(int id);

  Future<List<Membership>> viewMembership();
  Future<String> editMembership(Membership membership);


   //CRUD for roles
  Future<Map<List<Role>,int>> getRoles();
  Future<String> addRoles({required Role role});
  Future<String> deleteRole({required Role role});
  Future<String> updateRole({required Role role});


  


}
