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
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/subscription.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/trainerentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/user.dart';
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
    admissionfees = await Get.find<ManagementController>().getadmission();
    selectedplan = null;
    xtremer = Xtremer();

    update();
  }

  Future<bool> createuser(String? username, String? pass) async {
    usererrormessage = null;
    isloading = true;
    update();

    Map<int, String> res = await repo.addUser(
        User(
            uid: "",
            name: xtremer!.firstName!,
            phone: xtremer!.mobileNumber!,
            username: username!,
            roleid: Role(roleid: "0", rolename: "Member")),
        pass!,
        xtremer!.mobileNumber!);
    if (res.entries.first.key >= 200 && res.entries.first.key < 300) {
      usererrormessage = res.entries.first.value;
      _userid = await repo.viewUser(username, pass);
      print("in user create in create member: ${_userid!}");
      xtremer!.XtremerId = int.tryParse(_userid!);
      userexist = false;

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

  void addXtremer() async {
    if (xtremer!.XtremerId != null) {
      Subscription subs = Subscription(
          userId: xtremer!.XtremerId.toString(),
          planId: selectedplan!.id,
          startDate: DateTime.now(),
          endDate: DateTime.now()
              .add(Duration(days: selectedplan!.durationInMonths * 3)),
          isActive: true,
          trainerId: _trainer?.id);
      Subscription? subss = await repo.addSubscription(subs);

      if (subss != null && checkdeclaration) {
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
            paymentType: "Admission + ${selectedplan!.name}",
            subscriptionId: selectedplan!.id,
            serviceUsageId: selectedservice!.id,
            termsAndConditions: paymentdeclaration);
        paymentdetails = payments;
        print("adding payments");
        //online
        if (!ispaymentcash) {
          var d = await repo.addPayments(payments,
              userid: xtremer!.XtremerId.toString(), isonline: true);
          if (d["response"] == 200) {
            print("in response: 200");

            checkpayment(creatextremer);
          }
          //wait with dialog options
        } else {
          var d = await repo.addPayments(payments,
              userid: xtremer!.XtremerId.toString(), isonline: false);
          if (d["response"] == 200) {
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

  void addpersonaldetails({
    required String name,
    required String phone,
    required String homephone,
    required String address,
    required String postalcode,
    required String occupation,
    String? email,
    required String emergencycontact,
    required String emergencyname,
  }) {
    xtremer!.firstName = name;
    xtremer!.mobileNumber = phone;
    xtremer!.homeNumber = homephone;
    xtremer!.postcode = postalcode;
    xtremer!.occupation = occupation;
    xtremer!.address = address;
    xtremer!.email = email;
    xtremer!.relationship = relation[relationship]!;
    xtremer!.contactNumber = emergencycontact;
    xtremer!.contactName = emergencyname;
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

  void addxtremersrenewaledit(Xtremer? xtremere) {
    xtremer = xtremere;
    update();
  }

  void addxtremersedit(Xtremer? xtremere) async {
    // xtremer = xtremere;
    try {
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
    xtremer = null;
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
    if (xtremer!.XtremerId != null) {
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
            amount: selectedplan!.price,
            discountPercentage: selectedplan!.discountPercentage,
            receivedAmount: (selectedplan!.price -
                (selectedplan!.price *
                    (selectedplan!.discountPercentage / 100))),
            paymentDate: DateTime.now(),
            transactionId:
                "XTRMPAY${Random().nextInt(1000)}${xtremer!.XtremerId}",
            paymentStatus: "Initiated",
            paymentMethod: ispaymentcash ? "Cash" : "Online",
            paymentType: selectedplan!.name,
            subscriptionId: selectedplan!.id,
            serviceUsageId: selectedservice!.id,
            termsAndConditions: true);
        paymentdetails = payments;
        print("adding payments");
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
