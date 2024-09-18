import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/config/manageconfig.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/paymententity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/serviceusage.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/subscription.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/trainerentity.dart';

import 'package:xtreme_fitness/managementfeatures/managementmodels/imageusecase.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/managementrepoimpl.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addmemberfields/doctordetails.dart';

import '../../managementdomain/entities.dart/admission.dart';
import '../../managementdomain/entities.dart/paymentdetails.dart';
import '../../managementdomain/entities.dart/planentity.dart';
import '../../managementdomain/entities.dart/servicesentity.dart';
import '../../managementdomain/entities.dart/xtremer.dart';
import '../../managementdomain/managementrepo.dart';

class AddMemberController extends GetxController {
  Plan? selectedplan;
  ServiceEntity? selectedservice;
  String? imagesizeerrors;
  Xtremer? xtremer;
  DoctorDetails? doctorDetails;
  Paymententity? paymentdetails;
  DateTime? dob;
  int relationship = 4;
  bool disability = false;
  TrainerEntity? _trainer;
  TrainerEntity? get gettrainer => _trainer;
  bool isImageloading = false;
  Uint8List? _imageData;
  Uint8List? get getprofile => _imageData;
  bool setallquestionaire = false;
  Admission? admissionfees;
  bool checkdeclaration = false;
  String? usererrormessage;
  PaymentDetails? paymentsdetails;
  String doctorname = "";
  String surgeryname = "";
  String surgeryno = "";
  String surgeryaddress = "";

  /// payments 1[success] 2[failed] 3[initiated] 4[cancel]

  /// payments 1[success] 2[failed] 3[initiated] 4[cancel]
  int paymentstatus = 0;
  bool ispaymentcash = false;
  bool? isimagesize;
  bool isloading = false;
  bool? usercreated;
  bool userexist = false;
  String? _userid;
  bool paymentdeclaration = false;
  //questionaire set
  Map<String, bool> healthQuestions = {
    'exerciseQ': false,
    'physicianQ': false,
    'cardiacQ': false,
    'respiratoryQ': false,
    'faintingQ': false,
    'boneQ': false,
    'heartQ': false,
    'chestQ': false,
    'bpQ': false,
    'cholesterolQ': false,
    'medicationQ': false,
  };

  dynamic _scheduler;

  ManagementRepo repo = ManagementrepoImpl();
  ManagementController managectrl = Get.put(ManagementController());
  GetxAuthController authctrl = Get.find<GetxAuthController>();
  @override
  void onInit() async {
    super.onInit();
    xtremer = Xtremer();
    admissionfees = await Get.find<ManagementController>().getadmission();
    selectedplan = null;
    selectedservice = null;
    _trainer = null;
    if(authctrl.getuser!=null){
      print("Auth user submitted by ${authctrl.getuser!.id}");
    xtremer!.submittedBy = authctrl.getuser!.id; 
    }

    update();
  }

  Future<bool> createuser(String? username, String? pass, String? phone) async {
    usererrormessage = null;
    isloading = true;
    update();
    print('In user create usename: $username pass:$pass  phone: $phone');
    Map<int, String> res = await repo.addUser(
        username!, pass!, phone ?? xtremer!.mobileNumber!, "Member");
    if (res.entries.first.key >= 200 && res.entries.first.key < 300) {
      usererrormessage = res.entries.first.value;
      _userid = await repo.viewUser(username, pass);
      print("in user create in create member: ${_userid!}");
      xtremer!.XtremerId = int.tryParse(_userid!);
      userexist = false;
      // addXtremer();
      // addXtremer();
      update();
      return true;
    } else {
      print("in user create in create member: failed to create");
      usererrormessage = res.entries.first.value;
      userexist = true;
      isloading = false;
      update();
    }
 
    return false;
  }

  Future<Subscription?> addsubscription(Subscription subs) async {
    Subscription? subss = await repo.addSubscription(subs);
    return subss;
  }

  

  Future<String> updateXtremer()async{
      print("In update xtremer");
      if(xtremer!=null){
        try {
  String d  = await repo.updateMember(xtremer!);
  
  return d;
} on Exception catch (e) {
  // TODO
    return "error updating member";
}

      }else{
 return "xtremer null";

      }
     
  }


  void addXtremer() async {
    if (xtremer!.XtremerId != null) {
  
      xtremer!.submittedBy = authctrl.getuser!.id;      
      Subscription subs = Subscription(
          userId: xtremer!.XtremerId.toString(),
          planId: selectedplan!.id,
          startDate: DateTime.now(),
          endDate: DateTime.now()
              .add(Duration(days: selectedplan!.durationInMonths * 3)),
          isActive: true,
          trainerId: _trainer?.id);

      if (checkdeclaration) {
        Paymententity payments = Paymententity(
            id: 0,
            userId: xtremer!.XtremerId!,
            amount: admissionfees!.price + selectedplan!.price,
            discountPercentage: selectedplan!.discountPercentage,
            receivedAmount: admissionfees!.price +
                (selectedplan!.price -
                    (selectedplan!.price *
                        (selectedplan!.discountPercentage / 100))),
            paymentDate: DateTime.now(),
            transactionId:
                "XTRMPAY${Random().nextInt(1000)}${xtremer!.XtremerId}",
            paymentStatus: "Initiated",
            paymentMethod: ispaymentcash ? "Cash" : "Online",
            paymentType: selectedservice != null
                ? selectedservice!.name
                : "Admission + ${selectedplan!.name}",
            subscriptionId: selectedplan?.id,
            serviceUsageId: selectedservice?.id,
            termsAndConditions: paymentdeclaration);
        paymentdetails = payments;
        print("adding payments");
        //online
        if (!ispaymentcash) {
          var d = await repo.addPayments(payments,
              userid: xtremer!.XtremerId.toString(), isonline: true);
          if (d["response"] == 200) {
            print("in response: 200");

            checkpayment(() async {
              Subscription? subss = await addsubscription(subs);
              creatextremer();
            });
          }
          //wait with dialog options
        } else {
          var d = await repo.addPayments(payments,
              userid: xtremer!.XtremerId.toString(), isonline: false);
          if (d["response"] == 200) {
            Subscription? subss = await addsubscription(subs);
            creatextremer();
          }
        }

        //cash
      } else {
        isloading = false;
        update();
        print("error");
      }

      // print("$res  ${dummyxtremer.length}");
      // print(admissionfees!.price);
      // print(percentprice(selectedplan!.price, selectedplan!.discountPercentage));
    }

    update();
  }

  void creatextremer() async {
    try {
        print(xtremer!.category);  
      Map<String, dynamic> res = await repo.addMember(
          xtremer!, _imageData, xtremer!.XtremerId.toString());
      xtremer = Xtremer.fromJson(jsonDecode(res["response"]));
      usercreated = true;
      // createAndPrintPdf(paymentsdetails!);
      isloading = false;
      // Get.toNamed("/login");
      update();
    } catch (e) {
      usercreated = false;
      isloading = false;
      update();
    }
  }

  void addServiceusage({bool paymentonline = true}) async {
    Paymententity payments = Paymententity(
        id: 0,
        userId: xtremer!.XtremerId!,
        amount: selectedservice!.nonMemberPrice,
        discountPercentage: 0,
        receivedAmount: selectedservice!.nonMemberPrice,
        paymentDate: DateTime.now(),
        transactionId: "XTRMPAY${Random().nextInt(1000)}${xtremer!.XtremerId}",
        paymentStatus: "Initiated",
        paymentMethod: paymentonline ? "Online" : "Cash",
        paymentType:
            selectedservice != null ? selectedservice!.name : "service plan",
        serviceUsageId: selectedservice?.id,
        termsAndConditions: true,
        subscriptionId: null);
    paymentdetails = payments;
    if (paymentonline) {
      var d = await repo.addPayments(payments,
          userid: xtremer!.XtremerId.toString(), isonline: true);
      if (d["response"] == 200) {
        print("in response: 200");

        checkpayment(() async {
          ServiceSchedule s = ServiceSchedule(
              id: 0,
              userId: xtremer!.id!,
              serviceId: selectedservice!.id,
              scheduleDate: DateTime.now(),
              price: selectedservice!.nonMemberPrice,
              status: "Active");
          ServiceSchedule? serv = await repo.addServiceUsage(s);
          //  creatextremer();
          // createAndPrintPdf(PaymentDetails(id: 0, userId: paymentdetails!.userId, amount: paymentsdetails!.amount, discountPercentage: paymentdetails!.discountPercentage, receivedAmount: paymentdetails!.receivedAmount, paymentDate:paymentdetails!.paymentDate, transactionId: paymentdetails!.transactionId, paymentStatus: paymentdetails!.paymentStatus, paymentMethod: paymentdetails!.paymentMethod, paymentType:paymentdetails!.paymentType, subscriptionId:paymentdetails!.subscriptionId!,serviceUsageId: paymentdetails!.serviceUsageId));
        });
      }
      //wait with dialog options
    } else {
      var d = await repo.addPayments(payments,
          userid: xtremer!.XtremerId.toString(), isonline: false);
      if (d["response"] == 200) {
        if (selectedservice != null) {
          print(
              '${selectedservice!.nonMemberPrice} ${selectedservice!.id} ${xtremer!.XtremerId}');
          ServiceSchedule s = ServiceSchedule(
              id: 0,
              userId: xtremer!.XtremerId!,
              serviceId: 5,
              scheduleDate: DateTime.now(),
              price: selectedservice!.nonMemberPrice,
              status: "Active");
          ServiceSchedule? serv = await repo.addServiceUsage(s);
        } else {
          print("no in service usage");
        }

        //  createAndPrintPdf(PaymentDetails(id: 0, userId: paymentdetails!.userId, amount: paymentsdetails!.amount, discountPercentage: paymentdetails!.discountPercentage, receivedAmount: paymentdetails!.receivedAmount, paymentDate:paymentdetails!.paymentDate, transactionId: paymentdetails!.transactionId, paymentStatus: paymentdetails!.paymentStatus, paymentMethod: paymentdetails!.paymentMethod, paymentType:paymentdetails!.paymentType, subscriptionId:paymentdetails!.subscriptionId!,serviceUsageId: paymentdetails!.serviceUsageId));
        // creatextremer();
      }
    }
  }

  void addpersonaldetails({
    required String name,
    required String phone,
    required String homephone,
    required String address,
    required String postalcode,
    required String occupation,
    required String email,
    required String emergencycontact,
    required String emergencyname,
  }) {
    // print("in add details $name");
    String names = name;
    try {
      xtremer!.firstName = names;
      print("true");
    } catch (e) {
      print("in add details $name  $e");
    }

    print("in add details 1");

    try {
      xtremer!.mobileNumber = phone;
      print("in add details 2");
      xtremer!.homeNumber = homephone;
      print("in add details 3");
      xtremer!.postcode = postalcode;
      print("in add details 4");
      xtremer!.occupation = occupation;
      print("in add details 5");
      xtremer!.address = address;
      print("in add details 6");
      xtremer!.email = email;
      print("in add details 7");
      xtremer!.relationship = relation[relationship]!;
      print("in add details 8");
      xtremer!.contactNumber = emergencycontact;
      print("in add details 9");
      xtremer!.contactName = emergencyname;
      print("in add details 10");
    } catch (e) {
      print("error");
    }

    update();
  }

  void setpaymentmethod(bool v) {
    ispaymentcash = v;
  }

  void setQuestyionaireall(bool v) {
    setallquestionaire = v;
    healthQuestions.updateAll((key, value) => v);
    update();
  }

  void updatequestion(String key, bool newValue) {
    if (healthQuestions.containsKey(key)) {
      healthQuestions[key] = newValue;
    } else {
      print('Key $key not found in the map.');
    }
    update();
  }

  void addTrainer(TrainerEntity trainere) {
    _trainer = trainere;
    update();
  }

  void addDOB(DateTime datetime) {
    dob = datetime;
    xtremer!.dateOfBirth = dob;
    update();
  }

  void setRelation(int rel) {
    relationship = rel;
    // xtremer!.relationship ="grandpa";
    update();
  }

  void setdisability(bool dis) {
    disability = dis;
    update();
  }

  void addDoctor(
      String doctorname, String surgeryno, String surgeryname, String t) {
    xtremer!.doctorName = doctorname;
    xtremer!.surgeryName = surgeryname;
    xtremer!.surgeryNumber = surgeryno;
    xtremer!.surgeryAddress = "Imphal";
    update();
  }

  void addplan(Plan plan) {
    if (plan.category != plancategory[0]) {
      _trainer = null;
    }

    selectedplan = plan;
    xtremer!.category = selectedplan!.category; 
    // if (selectedplan != null) {
    //   // if (selectedplan!.planid == plan.planid) {
    //   //   selectedplan = null;
    //   // } else {
    //   //   selectedplan = plan;
    //   // }
    // } else {

    // }
    update();
  }

  void addservices(ServiceEntity services) {
    selectedservice = services;
    update();
  }

  void addxtremersrenewaledit(Xtremer? xtremere) {
    xtremer = xtremere!;
    update();
  }

    void addxtremersedit(Xtremer? xtremere) async{
      
  
    try {
        xtremer = xtremere;
      dob = xtremere!.dateOfBirth!;
      // relationship = relation.keys.firstWhere((element) =>
      //   relation[element]==xtremere.relationship
      // ,orElse: () => 20,);
      relationship = 0;
      isImageloading = true;
      _imageData = await repo.getImage(xtremer!.id!);
      isImageloading = false;
      update();
    } catch (e) {}
  }


  


  @override
  void onClose() {
    // selectedplan = null;
    // xtremer = null;
    paymentdetails = null;
    disability = false;
    relationship = 4;
    _trainer = null;
    _imageData = null;
    usererrormessage = null;
    // xtremer = null;
    imagesizeerrors = null;
    selectedplan = null;
    super.onClose();
  }

  Future<void> pickImage() async {
    isImageloading = true;
    update();
    try {
      final result = await ImagePickerWeb.getImageAsBytes();
      if (result != null && recognizeImageFormat(result) != "Unknown format") {
        print("in image format");
        // _imageData = await resizeImage(result, 100, 100);
        if (await isImageSizeExceeds(result) == false) {
          _imageData = result;
          isimagesize = true;
          imagesizeerrors = "Photo Added";
        } else {
          _imageData = null;
          isimagesize = false;
          imagesizeerrors = "Photo exceeds 500 x 500 pixels";
        }

        isImageloading = false;
        update();
      } else {
        print("error in images");
        _imageData = null;
        imagesizeerrors = "The photo must be a png or jpg/jpeg";
        isImageloading = false;
        update();
      }

      update();
    } catch (e) {
      isImageloading = false;
      update();
      debugPrint("Error in image picker");
    }
  }

  void checkpayment(Function() callback) async {
    print("payments checking");
    if (paymentdetails != null) {
      print("in payment start");
      int t = 0;
      paymentstatus = 3;
      update();
      _scheduler = Timer.periodic(
        const Duration(seconds: 5),
        (timer) async {
          t = t + 5;

          ///timeout
          if (t > (60 * 5)) {
            paymentstatus = 4;
            update();
            cancelscheduler();
          }

          paymentsdetails =
              await repo.getpayment(paymentdetails!.transactionId);
          if (paymentsdetails != null) {
            if (paymentsdetails!.paymentStatus.toLowerCase() == "success") {
              paymentstatus = 1;
              update();
              callback();

              cancelscheduler();
            } else if (paymentsdetails!.paymentStatus.toLowerCase() ==
                "failed") {
              paymentstatus = 2;
              update();
              cancelscheduler();
            } else if (paymentsdetails!.paymentStatus.toLowerCase() ==
                "initiated") {
              paymentstatus = 3;
              update();
            } else {
              if (paymentsdetails!.paymentStatus.toLowerCase() == "canceled") {
                paymentstatus = 4;
              }
              paymentstatus = 4;
              update();
              cancelscheduler();
            }
          }
        },
      );
    }
  }

  void renewalsubmission() async {
    print("In renewal submission");
    if (xtremer!.XtremerId != null) {
         print("In renewal submission");
 
  Subscription subs = Subscription(
      userId: xtremer!.XtremerId.toString(),
      planId: selectedplan!.id,
      startDate: DateTime.now(),
      endDate: DateTime.now()
          .add(Duration(days: selectedplan!.durationInMonths * 3)),
      isActive: true,
      trainerId: _trainer?.id);


      if (checkdeclaration) {
        print("adding payments");
        print(" xtremer: ${xtremer!.XtremerId}  amount: ${selectedplan!.price}  discount: ${selectedplan!.price} paymenttype: ${selectedplan!.name}");
        Paymententity payments = Paymententity(
            id: 0,
            userId: xtremer!.XtremerId!,
            amount:selectedservice!=null?selectedservice!.memberPrice:selectedplan!.price,
            discountPercentage:selectedservice!=null? 0 : selectedplan!.discountPercentage,
            receivedAmount:selectedservice!=null? selectedservice!.memberPrice:(selectedplan!.price -
                (selectedplan!.price *
                    (selectedplan!.discountPercentage / 100))),
            paymentDate: DateTime.now(),
            transactionId:
                "XTRMPAY${Random().nextInt(1000)}${xtremer!.XtremerId}",
            paymentStatus: "Initiated",
            paymentMethod: ispaymentcash ? "Cash" : "Online",
            paymentType: selectedplan!.name,
            subscriptionId: selectedplan?.id,
            serviceUsageId:selectedservice?.id,
            termsAndConditions: true);
        paymentdetails = payments;
        print("adding payments");
        payments.printPayment();
        //online
        if (!ispaymentcash) {
          var d = await repo.addPayments(payments,
              userid: xtremer!.XtremerId.toString(), isonline: true);
          if (d["response"] == 200) {
            print("in response: 200");

            checkpayment(() async {
              Subscription? subss = await repo.addSubscription(subs);
            });
          }
          //wait with dialog options
        } else {
          var d = await repo.addPayments(payments,
              userid: xtremer!.XtremerId.toString(), isonline: false);
          if (d["response"] == 200) {
            Subscription? subss = await repo.addSubscription(subs);
            // Xtremer? x = await repo.addSubscription(subs);
          }
        }

        //cash
      } else {
        isloading = false;
        update();
        print("error");
      }

      // print("$res  ${dummyxtremer.length}");
      // print(admissionfees!.price);
      // print(percentprice(selectedplan!.price, selectedplan!.discountPercentage));
    }

    update();
  }

  void changedeclaration(bool val) {
    checkdeclaration = val;
    update();
  }

  void changepaymentdeclaration(bool val) {
    paymentdeclaration = val;
    update();
  }

  void cancelscheduler() {
    _scheduler.cancel();
    isloading = false;
    update();
    print("in payment");
  }

  void changepaymentstatus(int i) {
    paymentstatus = i;
    update();
  }
}
