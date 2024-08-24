import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/config/manageconfig.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/paymententity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/trainerentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/user.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/imageusecase.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/managementrepoimpl.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addmemberfields/doctordetails.dart';

import '../../managementdomain/entities.dart/planentity.dart';
import '../../managementdomain/managementrepo.dart';

class AddMemberController extends GetxController {
  Plan? selectedplan;
  final Xtremer xtremer = Xtremer(
      doctorname: "",
      doctorsurgeryno: "",
      doctorsurgeryname: "",
      emergencyname: "",
      emergencycontact: "",
      emergencyrelation: "Brother",
      uid: Random().nextInt(199).toString(),
      name: "",
      phone: "",
      username: "",
      roleid: Role(roleid: "4", rolename: "Member"),
      isactive: true);
  DoctorDetails? doctorDetails;
  Paymententity? paymentdetails;
  DateTime dob = DateTime.now();
  int relationship = 4;
  bool disability = false;
  TrainerEntity? _trainer;
  TrainerEntity? get gettrainer => _trainer;
  bool isImageloading = false;
  Uint8List? _imageData;
  Uint8List? get getprofile => _imageData;
  bool setallquestionaire = false;
  Plan? admissionfees;

  String doctorname = "";
  String surgeryname = "";
  String surgeryno = "";
  String surgeryaddress = "";

  bool ispaymentcash = true;
  bool isimagesize = true;
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

  ManagementRepo repo = ManagementrepoImpl();
  ManagementController managectrl = Get.find<ManagementController>();
  GetxAuthController authctrl = Get.find<GetxAuthController>();
  @override
  void onInit() {
    super.onInit();
    admissionfees = Get.find<ManagementController>().getadmission();
    update();
  }

  void addXtremer() async {
    // String res =
    //     await repo.addMember(xtremer, _imageData, authctrl.userid ?? "");
    // print("$res  ${dummyxtremer.length}");
    // print(admissionfees!.price);
    // print(percentprice(selectedplan!.price, selectedplan!.discountPercentage));
   print("adding payments");
   
    await repo.addPayments(Paymententity(ispaymentcash ? "Cash" : "Online",
        paymentid: Random().nextInt(1000).toString(),
        transactionid: Random().nextInt(1000).toString(),
        uid: xtremer.uid,
        amount: 1000,
        // amount: admissionfees!.price +
        //     percentprice(selectedplan!.price, selectedplan!.discountPercentage),
        datetime: DateTime.now()));

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
    xtremer.name = name;
    xtremer.phone = phone;
    xtremer.homephone = homephone;
    xtremer.postalcode = postalcode;
    xtremer.occupation = occupation;
    xtremer.address = address;
    xtremer.emergencyrelation = relation[relationship]!;
    xtremer.emergencycontact = emergencycontact;
    xtremer.emergencyname = emergencyname;
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
    update();
  }

  void setdisability(bool dis) {
    disability = dis;
    update();
  }

  void addDoctor(
      String doctorname, String surgeryno, String surgeryname, String t) {
    this.doctorname = doctorname;
    this.surgeryname = surgeryname;
    this.surgeryno = surgeryno;
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

  @override
  void onClose() {
    // selectedplan = null;
    // xtremer = null;
    paymentdetails = null;
    disability = false;
    relationship = 4;
    _trainer = null;
    _imageData = null;
    super.onClose();
  }

  Future<void> pickImage() async {
    isImageloading = true;
    update();
    try {
      final result = await ImagePickerWeb.getImageAsBytes();
      if (result != null && recognizeImageFormat(result) != "Unknown format") {
        _imageData = await resizeImage(result, 100, 100);
        // if(await isImageSizeExceeds(_imageData!)){

        //     _imageData = result;
        //     isimagesize = true;
        // }else{
        //          _imageData = null;
        //     isimagesize = false;
        // }

        isImageloading = false;
        update();
      } else {
        _imageData = null;
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

  Future<void> createAndPrintPdf() async {
    final pdf = pw.Document();

    final logoData = await _loadImageData('assets/logo1.png');

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Padding(
            padding: const pw.EdgeInsets.all(20),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Image(pw.MemoryImage(logoData), width: 100, height: 100),
                  ],
                ),
                pw.SizedBox(height: 20),
                pw.Text('Company Name',
                    style: pw.TextStyle(
                        fontSize: 24, fontWeight: pw.FontWeight.bold)),
                pw.Text('Phone: (123) 456-7890',
                    style: const pw.TextStyle(fontSize: 18)),
                pw.Text('Email: info@company.com',
                    style: const pw.TextStyle(fontSize: 18)),
                pw.SizedBox(height: 20),
                pw.Divider(),
                pw.SizedBox(height: 10),
                pw.Text('Transaction ID: 123456789',
                    style: const pw.TextStyle(fontSize: 18)),
                pw.Text('Date: ${DateTime.now().toLocal().toString()}',
                    style: const pw.TextStyle(fontSize: 18)),
                pw.SizedBox(height: 20),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Amount Due',
                        style: const pw.TextStyle(fontSize: 18)),
                    pw.Text('\$123.45',
                        style: const pw.TextStyle(fontSize: 18)),
                  ],
                ),
                pw.SizedBox(height: 20),
                pw.Text('Thank you for your purchase!',
                    style: const pw.TextStyle(fontSize: 16)),
              ],
            ),
          );
        },
      ),
    );

    final pdfData = await pdf.save();
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdfData,
    );

    // final outputFile = await _getOutputFile();
    // final file = File(outputFile.path);
    // await file.writeAsBytes(pdfData);

    // print('PDF saved and sent to printer: ${outputFile.path}');
  }

  Future<Uint8List> _loadImageData(String path) async {
    final ByteData data = await rootBundle.load(path);
    return data.buffer.asUint8List();
  }


sendpayment() async {

  }


}
