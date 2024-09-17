import 'dart:typed_data';

import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/10latestpayment.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/paymententity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/servicesentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/trainerentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/user.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/userpaymentmodel.dart';

import '../../authentifeatures/domain/userentity.dart';
import 'entities.dart/admission.dart';
import 'entities.dart/paymentdetails.dart';
import 'entities.dart/planentity.dart';
import 'entities.dart/serviceusage.dart';
import 'entities.dart/subscription.dart';
import 'entities.dart/trainee.dart';
import 'entities.dart/xtremer.dart';

abstract class ManagementRepo {
  ///adding staff for management
  Future<Map<int,String>> addStaff(Staff staff);
  Future<String> updateStaff(Staff staff);
  Future<String> deleteStaff(Staff staff);
  Future<List<UserEntity>> viewStaff();

  ///adding members
  Future<Map<String, dynamic>> addMember(
      Xtremer xtremer, Uint8List? filepath, String userid);
  Future<String> updateMember(
      Xtremer xtremer);
  Future<String> deleteMember(Xtremer xtremer);
  Future<List<Xtremer>> viewMember();
  Future<List<Xtremer>> viewMemberforoverall();
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
  Future<String> addTrainer(TrainerEntity staff);
  Future<String> updateTrainer(TrainerEntity staff);
  Future<String> deleteTrainer(TrainerEntity staff);
  Future<List<TrainerEntity>> viewTrainer();
  Future<List<Xtremer>> viewPersonalTrainer();

  //payments api

  Future<Map<String, dynamic>> addPayments(Paymententity payment,
      {bool isonline, required String userid});
  Future<String> deletePayment(Paymententity payment);
  Future<String> updatePayment(Paymententity payment);
  Future<List<Alluserpaymentmodel>> viewpayment();
  Future<List<Paymentlatest10>> viewlatest10payment();
  Future<PaymentDetails?> getpayment(String transcationid);

  ///users api
  Future<Map<int,String>> addUser(String username ,String pass, String phone,String role);

  Future<String?> viewUser(String username, String pass);

  ///subscription api
  Future<Subscription?> addSubscription(Subscription subs);
  Future<Subscription?> getSubscription(int id);

  ///service usage api
  Future<ServiceSchedule?> addServiceUsage(ServiceSchedule serviceschedule);
  Future<ServiceSchedule?> getServiceUsage(int id);

  //admission
  Future<Admission?> viewadmission();

  Future<List<Trainee>> viewTrainee(int id );
}
