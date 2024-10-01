import 'dart:async';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/10latestpayment.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/servicesentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/serviceusage.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/trainerentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/userpaymentmodel.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/managementrepo.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/calculationusecase.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/managementrepoimpl.dart';

import '../../../authenicationfeatures/views/controller/authcontroller.dart';
import '../../../authentifeatures/domain/userentity.dart';
import '../../managementdomain/entities.dart/admission.dart';
import '../../managementdomain/entities.dart/membership.dart';
import '../../managementdomain/entities.dart/planentity.dart';
import '../../managementdomain/entities.dart/roles.dart';
import '../../managementdomain/entities.dart/subscription.dart';
import '../../managementdomain/entities.dart/trainee.dart';
import '../../managementdomain/entities.dart/user.dart';
import '../../managementdomain/entities.dart/xtremer.dart';

class ManagementController extends GetxController {
  final ManagementRepo managementRepo = ManagementrepoImpl();

  List<Plan> _allplans = [];
  List<Plan> _allactiveplans = [];
  List<ServiceEntity> _allactiveservices = [];
  List<Alluserpaymentmodel> _allpayments = [];
  List<Alluserpaymentmodel> _searchpayments = [];
  List<Paymentlatest10> _latestpayment10 = [];
  List<UserEntity> _allstaff = [];
  List<Xtremer> _allxtremer = [];
  List<Xtremer> _allxtremerforoverall = [];
  List<Xtremer> _allinactivextremer = [];
  List<Membership> _allmembership = [];
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
  List<Alluserpaymentmodel> get getsearchpayments => _searchpayments;
  List<Plan> get getallplans => _allplans;
  List<Plan> get getallactiveplans => _allactiveplans;
  List<UserEntity> get getallstaff => _allstaff;
  List<ServiceEntity> get getallservices => _allservices;
  List<ServiceEntity> get getallactiveservices => _allactiveservices;
  List<Trainee> get getallTrainee => _alltrainee;
  List<Membership> get getallMembership => _allmembership;
  List<Role> get getallRoles => _allroles;
  List<Role> _allroles  = [];

    List<ServiceSchedule> get getallServicesSchedule => _allserviceschedule;
    List<ServiceSchedule> get searchServicesSchedule => _searchservice;
  List<ServiceSchedule> _allserviceschedule  = [];
  List<ServiceSchedule> _searchservice  = [];
      List<Subscription> get getallSubscription => _allSubscription;
  List<Subscription> _allSubscription  = [];
//users
        // List<UserEntity> get getallSubscription => _allSubscription;
  List<UserEntity> _allUsers  = [];
  List<UserEntity> get allUsers  => _allUsers;
  String? searchmessage = "";
  int searchposition = 0;
  Membership? currentmember;
  GetxAuthController authctrl = Get.find<GetxAuthController>();
  
  Xtremer? xtremer;
  Admission? _admission;
  Admission? get getAdmission=>_admission;

  /// 0 [week] 1[month]
  int servicefilter = 1;
  Map<int, List<Alluserpaymentmodel>> filterpayments = {};
  Map<int, List<Alluserpaymentmodel>> weeklypayments = {};
  bool managementloading = false;
  int planloadingstatus = 0;
  int serviceloadingstatus = 0;
  int trainerloadingstatus = 0;
  int staffloadingstatus = 0;
  int xtremerloadingstatus = 0;
  int membershiploadingstatus = 0;
  bool iseditpayment = false;

  @override
  void onInit() {
    super.onInit();
    getplans();
    getadmission();
    checkmember();
    getxtremer();
    getStaff();
    getallServices();
    getTrainer();
    viewpayment();
    getpaymentlastest10();
    getAllRoles();
    getMemberships();
    getAllServiceSchedules();
    getAllSubscriptions();
    getAllusers();

    update();
  }


  ///for realtime data calls
  void dashboardTimer() {
    Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        //print("In periodic timer");
        getxtremer();
        // getinactivextremer();
        // getallpersonalextremer();
        getpaymentlastest10();
        getAllTraineess(10);
        // getxtremerforoverall();
      },
    );
  }

  ///checking member or admin
  void checkmember() {
    ismember = authctrl.ismember;
    update();
  }

  void getplans() async {
    _allplans = await managementRepo.getPlans();
    _allactiveplans = _allplans
        .where(
          (element) => element.isActive ?? false,
        )
        .toList();

    update();
  }

    
  void getAllusers() async {
    _allUsers= await authctrl.authrepo.getAllUsers();
    update();
  }

  Future<List<Trainee>> getAllTraineess(int id) async {
    List<Trainee> d = [];
    // _alltrainee = dummytrainees;
    d = await managementRepo.viewTrainee(id);
    //print("In trainer list ${_alltrainee.length}");
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

  void getxtremer() async {
    // _allxtremer = dummyxtremer;
    _allxtremer = await managementRepo.viewMember();
    if (authctrl.ismember) {
      //print("In get xtremer");
      xtremer = _allxtremer.firstWhereOrNull(
        (element) => element.XtremerId.toString() == authctrl.userid,
      );
      update();
    }else{
      _searchxtremerlist = _allxtremer;
      _allgeneralxtremer = _allxtremer.where((element) => element.category == 'General'&& element.isActive == true,).toList();
      _allpersonalxtremer = _allxtremer.where((element) => element.category == 'Personal'&& element.isActive == true,).toList();
      _allinactivextremer = _allxtremer.where((element) =>element.isActive == false,).toList();
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

  Future<String> editpayments(Alluserpaymentmodel paymnet) async {
    iseditpayment = true;
    update();
    String d = await managementRepo.updatePayment(paymnet);
    iseditpayment = false;
    update();
    viewpayment();
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
    _allactiveservices =
        _allservices.where((element) => element.isactive).toList();
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

  // void deletservices(ServiceEntity service) async {
  //   await managementRepo.deleteServices(service: service).then((value) async {
  //     getallServices();
  //   });
  // }

  void getadmission() async {
    Map<Admission?,int> d =  await managementRepo.viewadmission();
    _admission = d.entries.first.key;
    update();

  }

  void getMembershipbyid(int id) async {
    //print('$id');
    if (_allmembership.isNotEmpty) {
      try {
        for (Membership i in _allmembership) {
          //print(i.userId);
          if (i.userId == id) {
            currentmember = i;
            
            //print("membership found");
            update();
            return;
          }
        }
      } on Exception catch (e) {
        // TODO
        //print(e);
      }
    }
    update();
  }

  Future<String> activateXtremer(Xtremer? xtremer) async {
    //print("In update xtremer");
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

  Xtremer? getxtremerbyId(int id) {
    return _allxtremer.firstWhereOrNull(
      (element) {
        return element.XtremerId == id;
      },
    );
  }

  void getMemberships() async {
    _allmembership = await managementRepo.viewMembership();
    if (authctrl.ismember) {
      // //print("In current meber");
      currentmember = _allmembership.firstWhereOrNull(
        (element) =>
            element.userId.toString() == authctrl.userid && element.isActive!,
      );
      // currentmember = Membership(id: 1,userId: 12,membershipId: 1200,admissionId: 12,admissionFeePaid: true,bmiUsed: false,isActive: true,startDate: DateTime.now());
    }
    update();
  }

  void getStaff() async {
    // _allstaff = dummystaff;
    _allstaff = await managementRepo.viewStaff();
    update();
  }

  Future<String> addStaffs(Staff staff) async {
    var v = await managementRepo.addStaff(staff);
    if (v.entries.first.key == 200) {
      getStaff();
    }

    return v.entries.first.value;
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
    // managementloading = true;
    // update();
    _latestpayment10 = await managementRepo.viewlatest10payment();

    managementloading = false;

    update();
  }

  void viewpayment() async {
    // _allpayments = dummypayments;
    _allpayments = await managementRepo.viewpayment();
    _searchpayments = _allpayments;
    filterpayments = groupPaymentsByMonth(
        _allpayments
            .where(
              (element) => element.paymentStatus!.toLowerCase() == 'success',
            )
            .toList(),
        DateTime.now());
    weeklypayments = groupPaymentsByDate(
        _allpayments
            .where(
              (element) => element.paymentStatus!.toLowerCase() == 'success',
            )
            .toList(),
        );
    //print("In view payment : ${_allpayments.length}");
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

  void searchpayments(String keyword) {
    searchmessage = "";
    if (keyword.isEmpty) {
      _searchpayments = _allpayments;

      _searchxtremerlist = _allpersonalxtremer;

      _searchxtremerlist = _allgeneralxtremer;
    } else {
      _searchpayments = _allpayments.where(
        (element) {
          return element.transactionId
                  .toString()
                  .toLowerCase()
                  .contains(keyword.toLowerCase()) ||
              element.userId
                  .toString()
                  .toLowerCase()
                  .contains(keyword.toLowerCase());
        },
      ).toList();
    }

    searchmessage = keyword.isEmpty
        ? ""
        : "Found ${_searchpayments.length} records with keyoword: $keyword";
    update();
  }


  void searchservice(String keyword) {
    searchmessage = "";
    if (keyword.isEmpty) {
      _searchservice  = _allserviceschedule;

 
    } else {
      // _searchservice = _allserviceschedule.where(
      //   (element){
      //    for(UserEntity d in _allUsers){
      //     if(d.id == element.userId && d.mobileNumber!.contains(keyword.trim())){
      //         return true;
      //    }else{
      //     return false;
      //    }

      //   }
      //      return false;
        
      //   }
      // ).toList();
      List<UserEntity> d = _allUsers.where((element) => element.mobileNumber!=null?element.mobileNumber!.contains(keyword.trim()):false,).toList();
      _searchservice = _allserviceschedule.where((element) {
       UserEntity? x = d.firstWhereOrNull((e) => e.id==element.userId,);
        if(x==null){
          return false;
        }else{
          return true;
        }
      }).toList();

    }

    searchmessage = keyword.isEmpty
        ? ""
        : "Found ${_searchservice.length} records with keyoword: $keyword";
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



  ///roles get all role list
  void getAllRoles()async{
    Map<List<Role>,int> d = await managementRepo.getRoles();
    _allroles = d.entries.first.key;
    update();
  }


  ///add roles to api
  Future<String> addroles(Role role)async{

    String v = await managementRepo.addRoles(role: role);
    getAllRoles();
    return v;

  }

    Future<String> updateAdmission(Admission admissionfees)async{

    String v = await managementRepo.updateadmission(admissionfees);
    getadmission();
    return v;

  }

  Future<String> updateroles(Role role)async{

    String v = await managementRepo.updateRole(role: role);
     getAllRoles();
    return v;
  
  }


  Future<String> deleteRole(Role role)async{

    String v = await managementRepo.deleteRole(role: role);
     getAllRoles();
    return v;
  
  }


  ///allservice schedules
  void getAllServiceSchedules()async{
    _allserviceschedule = await managementRepo.getAllServiceUsage();
    _searchservice = _allserviceschedule;
    update();
  }


  void getAllSubscriptions()async{
    _allSubscription = await managementRepo.getAllSubscription();
    update();
  }

 Future<String> updateserviceschedule(ServiceSchedule serviceschedule)async{

    String v = await managementRepo.updateServiceUsage(serviceschedule);
     getAllServiceSchedules();
    return v;
  
  }


  List<Xtremer> tobeExpired(){
    List<Xtremer> tobeexpiredlist = [];
     DateTime dateMinusSevenDays = DateTime.now().subtract(Duration(days: 7));
    for(Xtremer e in _allxtremer){

      for(Subscription d in _allSubscription){
        if(d.userId.toString() == e.XtremerId.toString() && d.isActive){  
            if(d.endDate.isAtSameMomentAs(dateMinusSevenDays)||d.endDate.isAfter(dateMinusSevenDays)){
                tobeexpiredlist.add(e);
            }
        }
      }
        

    }


return tobeexpiredlist;
  }


}
