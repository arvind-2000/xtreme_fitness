import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/10latestpayment.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/servicesentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/serviceusage.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/trainerentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/userpaymentmodel.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/managementrepo.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/calculationusecase.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/managementrepoimpl.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';

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
import '../../managementdomain/entities.dart/xtremerwithsubs.dart';

class ManagementController extends GetxController {
  final ManagementRepo managementRepo = ManagementrepoImpl();

  List<Plan> _allplans = [];
  List<Plan> _allactiveplans = [];
  List<ServiceEntity> _allactiveservices = [];
  List<Alluserpaymentmodel> _allpayments = [];
  List<Alluserpaymentmodel> _searchpayments = [];
  List<Paymentlatest10> _latestpayment10 = [];
  List<UserEntity> _allstaff = [];
  List<XtremerWithSubscription> _allxtremer = [];
  final List<XtremerWithSubscription> _allxtremerforoverall = [];
  List<XtremerWithSubscription> _allinactivextremer = [];
  List<Membership> _allmembership = [];
  bool ismember = true;
  List<XtremerWithSubscription> get allinactivextremer => _allinactivextremer;
  List<XtremerWithSubscription> _allpersonalxtremer = [];
  final List<XtremerWithSubscription> _allpersonalxtremerforoverall = [];
  List<XtremerWithSubscription> get allpersonalxtremerforoverall =>
      _allpersonalxtremerforoverall;

  final List<XtremerWithSubscription> _allgeneralxtremerforoverall = [];
  List<XtremerWithSubscription> get allgenerallxtremerforoverall =>
      _allgeneralxtremerforoverall;

  final List<XtremerWithSubscription> _allinactivextremerforoverall = [];
  List<XtremerWithSubscription> get allinactivextremerforoverall =>
      _allinactivextremerforoverall;
  List<XtremerWithSubscription> _allgeneralxtremer = [];
  List<TrainerEntity> _alltrainer = [];
  List<XtremerWithSubscription> _searchxtremerlist = [];
  List<TrainerEntity> get getalltrainer => _alltrainer;
  List<XtremerWithSubscription> get getallXtremer => _allxtremer;
  List<XtremerWithSubscription> get getallxtremerforoverall => _allxtremerforoverall;
  List<XtremerWithSubscription> get getsearchXtremer => _searchxtremerlist;
  List<XtremerWithSubscription> get allpersonalxtremer => _allpersonalxtremer;
  List<XtremerWithSubscription> get allgeneralxtremer => _allgeneralxtremer;
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
  List<Role> _allroles = [];

  List<ServiceSchedule> get getallServicesSchedule => _allserviceschedule;
  List<ServiceSchedule> get searchServicesSchedule => _searchservice;
  List<ServiceSchedule> _allserviceschedule = [];
  List<ServiceSchedule> _searchservice = [];
  List<Subscription> get getallSubscription => _allSubscription;
  List<Subscription> _allSubscription = [];
//users
  // List<UserEntity> get getallSubscription => _allSubscription;
  List<UserEntity> _allUsers = [];
  List<UserEntity> get allUsers => _allUsers;
  String? searchmessage = "";
  int searchposition = 0;
  Membership? currentmember;
  GetxAuthController authctrl = Get.find<GetxAuthController>();
  AddMemberController addmemberctrl = Get.put(AddMemberController());
  XtremerWithSubscription? xtremer;
  Admission? _admission;
  Admission? get getAdmission => _admission;

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
  bool managementloadings = false;

  @override
  void onInit() {
    super.onInit();
    getplans();
    getallServices();
    getadmission();
    getTrainer();
    getxtremer();
    getAllRoles();
    getMemberships();
    getStaff();
    // if(authctrl.ismember!=null && !authctrl.ismember!){

    // }





    update();
    
  }


  void callforAdminDashboard(){
    
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
    log("all ACtive Plans : ${_allactiveplans.length}");
  }

  void getAllusers() async {
    _allUsers = await authctrl.authrepo.getAllUsers();
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

  // void getinactivextremer() async {
  //   _allinactivextremer = await managementRepo.viewinactivemembers();
  //   update();
  // }

  // void getallpersonalextremer() async {
  //   _allpersonalxtremer = await managementRepo.viewpersonalmembers();
  //   update();
  // }

  // void getallgeneralextremer() async {
  //   _allgeneralxtremer = await managementRepo.viewgeneralmembers();
  //   update();
  // }

  void getxtremer() async {
    // _allxtremer = dummyxtremer;
    _allxtremer = await managementRepo.viewMemberwithSubs();
    List<Xtremer> d  = await managementRepo.viewMember();

    for(int i = 0;i<_allxtremer.length;i++){

        _allxtremer[i].category = d.firstWhereOrNull((element) => _allxtremer[i].XtremerId==element.XtremerId,)?.category??"";
        

    }
  

  if (!authctrl.ismember) {
    _searchxtremerlist = _allxtremer;
    _allgeneralxtremer = _allxtremer
        .where(
          (element) =>
              element.category?.toLowerCase() == 'general' && element.isActive == true,
        )
        .toList();
    _allpersonalxtremer = _allxtremer
        .where(
          (element) =>
              element.category?.toLowerCase() == 'personal' && element.isActive == true,
        )
        .toList();
    _allinactivextremer = _allxtremer
        .where(
          (element) => element.isActive == false,
        )
        .toList();
  }else{
        getmemberxtreme();
  }


    update();
  }

  void getmemberxtreme(){
            if (authctrl.ismember) {
    // print("In get xtremer");
    xtremer = _allxtremer.firstWhereOrNull(
      (element) => element.XtremerId == authctrl.getuser!.id,
    );
    if(xtremer!=null){
       addmemberctrl.addxtremersrenewaledit(xtremer);
    }

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
    Map<Admission?, int> d = await managementRepo.viewadmission();
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
    checkmemberships();
    update();
  }


  void checkmemberships(){


  if (authctrl.ismember) {

    currentmember = _allmembership.firstWhereOrNull(
      (element) =>
          element.userId == authctrl.getuser?.id,
    );
     
  }


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
    _latestpayment10 = await managementRepo.viewlatest10payment();
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
      _searchservice = _allserviceschedule;
    } else {
      List<UserEntity> d = _allUsers
          .where(
            (element) => element.mobileNumber != null
                ? element.mobileNumber!.contains(keyword.trim())
                : false,
          )
          .toList();
      _searchservice = _allserviceschedule.where((element) {
        UserEntity? x = d.firstWhereOrNull(
          (e) => e.id == element.userId,
        );
        if (x == null) {
          return false;
        } else {
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

    void tobeexpiredlist() {
    _searchxtremerlist = tobeExpired();
    update();
  }

  ///roles get all role list
  void getAllRoles() async {
    Map<List<Role>, int> d = await managementRepo.getRoles();
    _allroles = d.entries.first.key;
    update();
  }

  ///add roles to api
  Future<String> addroles(Role role) async {
    String v = await managementRepo.addRoles(role: role);
    getAllRoles();
    return v;
  }

  Future<String> updateAdmission(Admission admissionfees) async {
    String v = await managementRepo.updateadmission(admissionfees);
    getadmission();
    return v;
  }

  Future<String> updateroles(Role role) async {
    String v = await managementRepo.updateRole(role: role);
    getAllRoles();
    return v;
  }

  Future<String> deleteRole(Role role) async {
    String v = await managementRepo.deleteRole(role: role);
    getAllRoles();
    return v;
  }

  ///allservice schedules
  void getAllServiceSchedules() async {
    _allserviceschedule = await managementRepo.getAllServiceUsage();
    _searchservice = _allserviceschedule;
    update();
  }

  void getAllSubscriptions() async {
    _allSubscription = await managementRepo.getAllSubscription();
    update();
  }

  Future<String> updateserviceschedule(ServiceSchedule serviceschedule) async {
    String v = await managementRepo.updateServiceUsage(serviceschedule);
    getAllServiceSchedules();
    return v;
  }

  List<XtremerWithSubscription> tobeExpired() {
    List<XtremerWithSubscription > tobeexpiredlist = [];
    DateTime dateaddSevenDays =
        DateTime.now().add(const Duration(days: 7));
    for (XtremerWithSubscription e in _allxtremer.where((element) => element.isActive!,)) {

        if(e.endDate!.compareTo(DateTime.now())>-1 && e.endDate!.compareTo(dateaddSevenDays)<1 ){

            tobeexpiredlist.add(e);
        }


    }

    return tobeexpiredlist;
  }
}
