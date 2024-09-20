import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/10latestpayment.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/servicesentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/trainerentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/userpaymentmodel.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/managementrepo.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/dummies.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/managementrepoimpl.dart';

import '../../../authenicationfeatures/views/controller/authcontroller.dart';
import '../../../authentifeatures/domain/userentity.dart';
import '../../managementdomain/entities.dart/admission.dart';
import '../../managementdomain/entities.dart/membership.dart';
import '../../managementdomain/entities.dart/planentity.dart';
import '../../managementdomain/entities.dart/trainee.dart';
import '../../managementdomain/entities.dart/user.dart';
import '../../managementdomain/entities.dart/xtremer.dart';

class ManagementController extends GetxController {
  final ManagementRepo managementRepo = ManagementrepoImpl();

  List<Plan> _allplans = [];
  List<Plan> _allactiveplans = [];
  List<ServiceEntity> _allactiveservices = [];
  List<Alluserpaymentmodel> _allpayments = [];
  List<Paymentlatest10> _latestpayment10 = [];
  List<UserEntity> _allstaff = [];
  List<Xtremer> _allxtremer = [];
  List<Xtremer> _allxtremerforoverall = [];
  List<Xtremer> _allinactivextremer = [];
  bool ismember = true;
  List<Xtremer> get allinactivextremer => _allinactivextremer;
  List<Xtremer> _allpersonalxtremer = [];
  final List<Xtremer> _allpersonalxtremerforoverall = [];
  List<Xtremer> get allpersonalxtremerforoverall =>
      _allpersonalxtremerforoverall;

  final List<Xtremer> _allgeneralxtremerforoverall = [];
  List<Xtremer> get allgenerallxtremerforoverall =>
      _allgeneralxtremerforoverall;

  final List<Xtremer> _allinactivextremerforoverall = [];
  List<Xtremer> get allinactivextremerforoverall =>
      _allinactivextremerforoverall;
  List<Xtremer> _allgeneralxtremer = [];
  List<TrainerEntity> _alltrainer = [];
  List<Xtremer> _searchxtremerlist = [];
  List<TrainerEntity> get getalltrainer => _alltrainer;
  List<Xtremer> get getallXtremer => _allxtremer;
  List<Xtremer> get getallxtremerforoverall => _allxtremerforoverall;
  List<Xtremer> get getsearchXtremer => _searchxtremerlist;
  List<Xtremer> get allpersonalxtremer => _allpersonalxtremer;
  List<Xtremer> get allgeneralxtremer => _allgeneralxtremer;
  List<Paymentlatest10> get latestpayment10 => _latestpayment10;

  List<ServiceEntity> _allservices = [];
  List<Trainee> _alltrainee = [];
  List<Alluserpaymentmodel> get getallpayments => _allpayments;
  List<Plan> get getallplans => _allplans;
  List<Plan> get getallactiveplans => _allactiveplans;
  List<UserEntity> get getallstaff => _allstaff;
  List<ServiceEntity> get getallservices => _allservices;
  List<ServiceEntity> get getallactiveservices => _allactiveservices;
  List<Trainee> get getallTrainee => _alltrainee;
  String? searchmessage = "";
  int searchposition = 0;
  Membership?  currentmember; 
    GetxAuthController authctrl = Get.find<GetxAuthController>();
  @override
  void onInit() {
    super.onInit();
    getplans();
    getxtremer();
    getinactivextremer();
    getallpersonalextremer();
    getStaff();
    getallServices();
    getTrainer();
    viewpayment();
    getpaymentlastest10();
    getAllTraineess(10);
    getallgeneralextremer();
    checkmember();
    getxtremerforoverall();

    // dashboardTimer();
  }


  void dashboardTimer(){
      
    Timer.periodic(const Duration(seconds: 5), (timer) {
    print("In periodic timer");
    getxtremer();
    getinactivextremer();
    getallpersonalextremer();
    getpaymentlastest10();
    getAllTraineess(10);
    getxtremerforoverall();
      },);

  }
  ///checking member or admin
  void checkmember() {
    ismember = authctrl.ismember;
    update();
  }

  void getplans() async {
    // _allplans = dummyplan;
    _allplans = await managementRepo.getPlans();
    _allactiveplans = _allplans.where((element) => element.isActive??false,).toList();
    update();
  }

  Future<List<Trainee>> getAllTraineess(int id) async {
    List<Trainee> d = [];
    // _alltrainee = dummytrainees;
    d = await managementRepo.viewTrainee(id);
    print("In trainer list ${_alltrainee.length}");
    _alltrainee = d;
    update();
    return d;
  }

  void getinactivextremer() async {
    _allinactivextremer = await managementRepo.viewinactivemembers();
    update();
  }

  void getallpersonalextremer() async {
    _allpersonalxtremer = await managementRepo.viewpersonalmembers();
    update();
  }

  void getallgeneralextremer() async {
    _allgeneralxtremer = await managementRepo.viewgeneralmembers();
    update();
  }

  void getxtremerforoverall() async {
    _allinactivextremerforoverall.clear();
    _allpersonalxtremerforoverall.clear();
    _allgeneralxtremerforoverall.clear();
    var alldata = await managementRepo.viewMemberforoverall();

    for (var element in alldata) {
      if (_allinactivextremerforoverall.contains(element)) {
        print('already added to today list');
      } else {
        if (element.isActive == false) {
          // Add all elements whose createddate is today
          _allinactivextremerforoverall.add(element);
        }
      }
    }

    for (var element in alldata) {
      if (_allpersonalxtremerforoverall.contains(element)) {
        print('already added to today list');
      } else {
        if (element.category == 'Personal') {
          if (element.isActive == true) {
            _allpersonalxtremerforoverall.add(element);
          }
          // Add all elements whose createddate is today
        }
      }
    }

    for (var element in alldata) {
      if (_allgeneralxtremerforoverall.contains(element)) {
        print('already added to today list');
      } else {
        if (element.category == 'General') {
          if (element.isActive == true) {
            _allgeneralxtremerforoverall.add(element);
          }
          // Add all elements whose createddate is today
        }
      }
    }
    _allxtremerforoverall = alldata;
    update();
    log(_allxtremerforoverall.length.toString());
  }

  void getxtremer() async {
    _allxtremer = await managementRepo.viewMember();
    // _allxtremer = dummyxtremer;
  
    //for getting search xtremer list
    _searchxtremerlist = _allxtremer;
    for (var element in _allxtremer) {
      // if (element.trainerName == null || element.trainerName!.isEmpty) {
      //   if (_allgeneralxtremer.contains(element)) {
      //     log('Already Added general');
      //   } else {
      //     _allgeneralxtremer.add(element);
      //   }
      // } else {
      //   if (_allpersonalxtremer.contains(element)) {
      //     log('Already Added');
      //   } else {
      //     log(element.trainerName.toString());
      //     _allpersonalxtremer.add(element);
      //   }
      // }
    }
    update();
  }

  Future<String> addplan(Plan plan) async {
    String v = await managementRepo.addPlans(plan: plan);
    // update plans

    getplans();

    return v;
  }

  Future<String> editplan(Plan plan) async {
    String d = await managementRepo.updatePlans(plan: plan);
    // update plans
    getplans();
    return d;
  }

  Future<String> edittrainer(TrainerEntity trainerentity) async {
    String d = await managementRepo.updateTrainer(trainerentity);
    // update plans
    getTrainer();
    return d;
  }

  void getallServices() async {
    _allservices = await managementRepo.getServices();
    // _allservices = dummyservices;
     _allactiveservices = _allservices.where((element) => element.isactive).toList();
    update();
  }

  Future<String> addservice(ServiceEntity service) async {
    String v = await managementRepo.addServices(service: service);

    // update service

    getallServices();

    return v;
  }

  Future<String> editservice(ServiceEntity service) async {
    String v = await managementRepo.updateServices(service: service);
    // update service
    getallServices();
    return v;
  }

  void deletservices(ServiceEntity service) async {
    await managementRepo.deleteServices(service: service).then((value) async {
      getallServices();
    });
  }

  Future<Admission?> getadmission() async {
    return await managementRepo.viewadmission();
  }


    void getMembershipbyid(int id) async {
      
      List<Membership> d = await managementRepo.viewMembership();

      if(d.isNotEmpty){
          Membership x =  d.firstWhere((element) => element.userId==id,);
        currentmember = x;
        print(x.toJson().toString());
    

      } 
     update();

  }

  Future<String> activateXtremer(Xtremer? xtremer) async {
    print("In update xtremer");
    if (xtremer != null) {
      try {
        Xtremer y = xtremer;
        y.isActive = !xtremer.isActive!;
        String d = await managementRepo.updateMember(y);
        getxtremer();

        return d;
      } on Exception catch (e) {
        // TODO
        return "error updating member";
      }
    } else {
      return "xtremer null";
    }
  }


  Xtremer? getxtremerbyId(int id){

      return _allxtremer.firstWhereOrNull((element) {
        return element.XtremerId == id;
      },);


  }



  void getStaff() async {
    // _allstaff = dummystaff;
    _allstaff = await managementRepo.viewStaff();
    update();
  }

  void addStaffs(Staff staff) async {
    await managementRepo.addStaff(staff);
    getStaff();
  }

  void getTrainer() async {
    // _alltrainer = dummytrainers;
    _alltrainer = await managementRepo.viewTrainer();

    update();
  }

  void addTrainer(TrainerEntity trainer) async {
    await managementRepo.addTrainer(trainer);
    getTrainer();
  }

  void deleteTrainer(TrainerEntity trainer) async {
    await managementRepo.deleteTrainer(trainer).then((value) async {
      getTrainer();
    });
  }

  void getpaymentlastest10() async {
    _latestpayment10 = await managementRepo.viewlatest10payment();
    update();
  }

  void viewpayment() async {
    _allpayments = await managementRepo.viewpayment();

    update();
  }

  void deletplans(Plan plan) async {
    await managementRepo.deletePlans(plan: plan).then((value) async {
      getplans();
    });
  }

  void updateplans(Plan plan) async {
    await managementRepo.updatePlans(plan: plan).then((value) async {
      getplans();
    });
  }


  Future<String> updateStaffs(UserEntity staff) async {
    String v = await managementRepo.updateStaff(staff);
  
    getStaff();
    return v;
  }



  void searchusers(String keyword) {
    searchmessage = "";
    if (keyword.isEmpty) {
      if (searchposition == 0) {
        _searchxtremerlist = _allxtremer;
      } else if (searchposition == 1) {
        _searchxtremerlist = _allpersonalxtremer;
      } else {
        _searchxtremerlist = _allgeneralxtremer;
      }
    } else {
      _searchxtremerlist = _allxtremer.where(
        (element) {
          return element.XtremerId.toString()
                  .toLowerCase()
                  .contains(keyword.toLowerCase()) ||
              element.firstName
                  .toString()
                  .toLowerCase()
                  .contains(keyword.toLowerCase()) ||
              element.mobileNumber
                  .toString()
                  .toLowerCase()
                  .contains(keyword.toLowerCase());
        },
      ).toList();
    }

    searchmessage = keyword.isEmpty
        ? ""
        : "Found ${_searchxtremerlist.length} records with keyoword: $keyword";
    update();
  }

  ///call in search to make personal only
  void personalxtremer() {
    _searchxtremerlist = _allpersonalxtremer;
    update();
  }

  ///call in search xtremer to make general only
  void generalxtremer() {
    _searchxtremerlist = _allgeneralxtremer;
    update();
  }

  void inactivextremer() {
    _searchxtremerlist = _allinactivextremer;
    update();
  }

  void allxtremer() {
    _searchxtremerlist = _allxtremer;
    update();
  }

  



//   void exXtremer(){

//       _searchxtremerlist = _allxtremer.where((element) {

//       },).toList();
//       update();
// }
}
