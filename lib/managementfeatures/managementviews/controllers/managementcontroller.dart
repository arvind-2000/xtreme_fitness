import 'dart:developer';

import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/10latestpayment.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/servicesentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/trainerentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/userpaymentmodel.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/managementrepo.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/dummies.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/managementrepoimpl.dart';

import '../../managementdomain/entities.dart/admission.dart';
import '../../managementdomain/entities.dart/planentity.dart';
import '../../managementdomain/entities.dart/user.dart';
import '../../managementdomain/entities.dart/xtremer.dart';

class ManagementController extends GetxController {
  final ManagementRepo managementRepo = ManagementrepoImpl();

  List<Plan> _allplans = [];
  List<Alluserpaymentmodel> _allpayments = [];
  List<Paymentlatest10> _latestpayment10 = [];
  List<Staff> _allstaff = [];
  List<Xtremer> _allxtremer = [];
  final List<Xtremer> _allpersonalxtremer = [];
  final List<Xtremer> _allgeneralxtremer = [];
  List<TrainerEntity> _alltrainer = [];
  List<Xtremer> _searchxtremerlist = [];
  List<TrainerEntity> get getalltrainer => _alltrainer;
  List<Xtremer> get getallXtremer => _allxtremer;
  List<Xtremer> get getsearchXtremer => _searchxtremerlist;
  List<Xtremer> get allpersonalxtremer => _allpersonalxtremer;
  List<Xtremer> get allgeneralxtremer => _allgeneralxtremer;
  List<Paymentlatest10> get latestpayment10 => _latestpayment10;

  List<ServiceEntity> _allservices = [];
  List<Alluserpaymentmodel> get getallpayments => _allpayments;
  List<Plan> get getallplans => _allplans;
  List<Staff> get getallstaff => _allstaff;
  List<ServiceEntity> get getallservices => _allservices;
  String? searchmessage = "";
  int searchposition = 0;
  @override
  void onInit() {
    super.onInit();
    getplans();
    getxtremer();
    getStaff();
    getallServices();
    getTrainer();
    viewpayment();
    getpaymentlastest10();
  }

  void getplans() async {
      // _allplans = dummyplan;
    _allplans = await managementRepo.getPlans();

    update();
  }

  void getxtremer() async {
    _allxtremer = await managementRepo.viewMember();

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

  void getallServices() async {
    _allservices = await managementRepo.getServices();
    update();
  }

  Future<String> addservice(ServiceEntity service) async {
    String v = await managementRepo.addServices(service: service);

    // update service

    getallServices();

    return v;
  }

  void deletservices(ServiceEntity service) async {
    await managementRepo.deleteServices(service: service).then((value) async {
      getallServices();
    });
  }

  Future<Admission?> getadmission() async{
    
    return await managementRepo.viewadmission();

  }

  void getStaff() async {
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



  void searchusers(String keyword){
      searchmessage = "";
      if(keyword.isEmpty){
        if(searchposition == 0){

            _searchxtremerlist = _allxtremer;
        }else if(searchposition == 1){
            _searchxtremerlist = _allpersonalxtremer;
        }else{
          _searchxtremerlist = _allgeneralxtremer;
        }
      }else{

      _searchxtremerlist = _allxtremer.where((element) {
        return element.XtremerId.toString().contains(keyword)||element.firstName!.contains(keyword)||element.mobileNumber!.contains(keyword);
    },).toList();
      }
   
    searchmessage = keyword.isEmpty?"":"Found ${_searchxtremerlist.length} records with keyoword: $keyword";
    update();
}
  ///call in search to make personal only
  void personalxtremer(){
    
      _searchxtremerlist = _allpersonalxtremer;
      update();
}
  ///call in search xtremer to make general only
  void generalxtremer(){
    
      _searchxtremerlist = _allgeneralxtremer;
      update();
}

  void allxtremer(){
    
      _searchxtremerlist = _allxtremer;
      update();
}

//   void exXtremer(){
    
//       _searchxtremerlist = _allxtremer.where((element) {
       
//       },).toList();
//       update();
// }

}
