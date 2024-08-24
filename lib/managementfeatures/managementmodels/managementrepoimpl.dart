import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xtreme_fitness/config/apis.dart';

import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/paymententity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/planentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/servicesentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/trainerentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/user.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/managementrepo.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/dummies.dart';

import 'package:http/http.dart' as http;

class ManagementrepoImpl implements ManagementRepo {
  @override
  Future<String> addMember(
      Xtremer xtremer, Uint8List? filepath, String userid) async {
    dummyxtremer.add(xtremer);
    print("In add member : userid $userid");

    // Create the multipart request
    var request = http.MultipartRequest(
        'POST', Uri.parse('$api/api/Xtremers'));

    // Add fields to the request
    request.fields.addAll({
      'UserId': "5",
      'FirstName': xtremer.name,
      // 'Surname': xtremer.surname ?? '',
      // 'DateOfBirth': xtremer.dateOfBirth ?? '',
      // 'Address': xtremer.address ?? '',
      // 'Postcode': xtremer.postcode ?? '',
      // 'Occupation': xtremer.occupation ?? '',
      // 'HomeNumber': xtremer.homeNumber ?? '',
      // 'MobileNumber': xtremer.mobileNumber ?? '',
      // 'Email': xtremer.email ?? '',
      // 'Disability': xtremer.disability ?? '',
      // 'TrainerName': xtremer.trainerName ?? '',
      // 'PreferTiming': xtremer.preferTiming ?? '',
      // 'ContactName': xtremer.contactName ?? '',
      // 'ContactNumber': xtremer.contactNumber ?? '',
      // 'Relationship': xtremer.relationship ?? '',
      // 'UnableToExercise': xtremer.unableToExercise ?? '',
      // 'PhysicianAdvisedAgainst': xtremer.physicianAdvisedAgainst ?? '',
      // 'CardiacIssues': xtremer.cardiacIssues ?? '',
      // 'RespiratoryDifficulties': xtremer.respiratoryDifficulties ?? '',
      // 'FaintingMigraines': xtremer.faintingMigraines ?? '',
      // 'BoneJointMuscleIssues': xtremer.boneJointMuscleIssues ?? '',
      // 'FamilyHeartDisease': xtremer.familyHeartDisease ?? '',
      // 'ChestPain': xtremer.chestPain ?? '',
      // 'HighBloodPressure': xtremer.highBloodPressure ?? '',
      // 'ElevatedCholesterol': xtremer.elevatedCholesterol ?? '',
      // 'PrescribedMedication': xtremer.prescribedMedication ?? '',
      // 'DoctorName': xtremer.doctorName ?? '',
      // 'SurgeryName': xtremer.surgeryName ?? '',
      // 'SurgeryNumber': xtremer.surgeryNumber ?? '',
      // 'SurgeryAddress': xtremer.surgeryAddress ?? '',
      // 'Declaration': xtremer.declaration?.toString() ?? 'false',
    });

    // Add the file to the request
    if (filepath != null) {
      request.files.add(await http.MultipartFile.fromBytes(
        'ProfilePhotoFile',
        filepath,
        filename: 'prof${Random().nextInt(100)}.png',
        contentType: MediaType('image', 'png'),
      ));
    }

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        print('Upload successful: $responseBody');
        return responseBody;
      } else if (response.statusCode == 409) {
        String responseBody = await response.stream.bytesToString();
        print('Conflict Error: $responseBody');
        return 'Conflict Error';
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Reason: ${response.reasonPhrase}');
        return 'Failed';
      }
    } catch (e) {
      print('Error occurred: $e');
      return 'Error';
    }
  }

  @override
  Future<String> updateMember(Xtremer xtremer) {
    throw UnimplementedError();
  }

  @override
  Future<String> deleteMember(Xtremer xtremer) {
    throw UnimplementedError();
  }

  @override
  Future<List<Xtremer>> viewMember() async {
    return dummyxtremer;
  }

  @override
  Future<String> addStaff(Staff staff) async {
    // dummystaff.add(staff);
    return "added";
  }

  @override
  Future<String> deleteStaff(Staff staff) async {
    // dummystaff.removeWhere(
    //   (element) => element.uid == staff.uid,
    // );
    return "remove";
  }

  @override
  Future<List<Staff>> viewStaff() async {
    // return dummystaff;
    return [];
  }

  @override
  Future<List<Plan>> getPlans() async {
      try{
         final res = await http.get(Uri.parse("$api/api/Plans"));
          // Plan p = Plan.fromJson(jsonDecode(res.body));
        if (res.statusCode >= 200 && res.statusCode<300) {
    // Parse JSON data
    final List<dynamic> jsonList = jsonDecode(res.body);
    print("In plan list : ${jsonList.length}");
    // Convert JSON data to List<Plan>
    return jsonList.map((json) => Plan.fromJson(json)).toList();
  } else {
    
  }
      }catch(e){

            print("cant load plans");
      }

      return [];
  }

  @override
  Future<String> addPlans({required Plan plan}) async {

    try{
    final response = await http.post(Uri.parse("$api/api/Plans"),
        headers: {
          //    "Access-Control-Allow-Origin": "*", // Required for CORS support to work
          // // "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
          // "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
          // "Access-Control-Allow-Methods": "POST, OPTIONS",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          "name": plan.name,
          "price": plan.price,
          "durationInMonths": plan.durationInMonths,
          "discountPercentage": plan.discountPercentage,
          "category": plan.category,
        }));
        print("Adding plans: response ${response.statusCode}");
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var d = jsonDecode(response.body);
      print(d);
      print("${d["Category"]}   ${d["DiscountPercentage"]}  ${d["DurationInMonths"]}  ${d["Name"]}");
      // String category = d["Category"];
      // String name = d["Name"];
      // String id  = d["Id"].toString();
      // double price =  double.tryParse(d["Price"])??0;
      // double discount = double.tryParse(d["DiscountPercentage"]) ?? 0;
      // int  duration = int.tryParse(d["DurationInMonths"]) ?? 1;
      // // Plan plan = Plan(
      // //     category: category,
      // //     discount: discount,
      // //     durationinmonths: duration,
      // //     name: name,
      // //     planid: id,
      // //     price: price);
     return d["Id"].toString();
  
    }}catch(e){
        print("Error adding plans");

    }
    return "";
    
  }

  @override
  Future<bool> deletePlans({required Plan plan}) async {
     final uri = Uri.parse('$api/api/Plans/${plan.id}');

  // Send the DELETE request
  final response = await http.delete(uri);

  // Check the response status
  if (response.statusCode >= 200 && response.statusCode<300) {
    print('Plan deleted successfully.');
    return true;
  } else {
    print('Failed to delete plan. Status code: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
return false;

  }


    @override
  Future<Plan> updatePlans({required Plan plan}) async{
   final uri = Uri.parse('$api/api/Plans/${plan.id}');

  // Convert the Plan instance to JSON
  final body = jsonEncode(plan.toJson());

  // Send the PUT request
  final response = await http.put(
    uri,
    headers: {
      'Content-Type': 'application/json',
    },
    body: body,
  );

  // Check the response status
  if (response.statusCode >= 200 && response.statusCode<300) {
    print('Plan updated successfully.');
    Plan plan = Plan.fromJson(jsonDecode(response.body));
  } else {
    print('Failed to update plan. Status code: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
  
  return Plan(id: 0, name: "", price: 0, durationInMonths: 0, discountPercentage:0, category:"");
  }



  // SERVICES

  @override
  Future<String> addServices({required ServiceEntity service}) async {
  final uri = Uri.parse('$api/api/Services'); // Replace with your API endpoint

  // Convert the Service instance to JSON
  final body = jsonEncode(service.toJson());

  // Send the POST request
  final response = await http.post(
    uri,
    headers: {
      'Content-Type': 'application/json',
    },
    body: body,
  );

  // Check the response status
  if (response.statusCode == 201) {
    print('Service created successfully.');
  } else {
    print('Failed to create service. Status code: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  return "";
  }

  @override
  Future<String> deleteServices({required ServiceEntity service}) async{
      final uri = Uri.parse('$api/api/Services/${service.id}');

  // Send the DELETE request
  final response = await http.delete(uri);

  // Check the response status
  if (response.statusCode >= 200 && response.statusCode<300) {
    print('Services deleted successfully.');
    return "Deleted";
  } else {
    print('Failed to delete Services. Status code: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
    
    return  "Cannot delete";
  }

  @override
  Future<List<ServiceEntity>> getServices() async {
          try{
         final res = await http.get(Uri.parse("$api/api/Services"));
          // Plan p = Plan.fromJson(jsonDecode(res.body));
        if (res.statusCode >= 200 && res.statusCode<300) {
    // Parse JSON data
    final List<dynamic> jsonList = jsonDecode(res.body);
    print("In Services list : ${jsonList.length}");
    // Convert JSON data to List<Services>
    return jsonList.map((json) => ServiceEntity.fromJson(json)).toList();
  } else {
    
  }
      }catch(e){

            print("cant load services");
      }

      return [];
  }

  @override
  Future<String> updateServices({required ServiceEntity service}) async {
    return "not update";
  }

  @override
  Future<String> renewal(
      {required Xtremer xtremer, required PaymentModel payment}) {
    // TODO: implement renewal
    throw UnimplementedError();
  }



  @override
  Future<String> updateStaff(Staff staff) {
    // TODO: implement updateStaff
    throw UnimplementedError();
  }

  //payments
  @override
  Future<String> addPayments(Paymententity payment,{bool isonline = false}) async {
   
      //online
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse('$api/api/Payments/OnlinePayment'));
      request.body = json.encode({ 
  
  // "amount": payment.amount,
  // "discountPercentage": 0,
  "receivedAmount": 1000,
  // "paymentDate": DateTime.now(),
  // "transactionId": Random().nextInt(9999999999),
  // "paymentStatus": "Initiated",
  // "paymentMethod": "Online",
  // "paymentType": "Membership",
  // "subscriptionId": 0,
  // "serviceUsageId": 0
  
  });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var url = await response.stream.bytesToString();
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(

           Uri.parse(url)
            // forceSafariVC: true,
            // forceWebView: true,
            // enableJavaScript: true,
            // webOnlyWindowName: '_self',
          );
        } else {
          throw 'Could not launch $url';
        }
      } else {
        print(response.reasonPhrase);
      }
    } on Exception catch (e) {
      print(e.toString());
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
  
    return "added";
  }

  @override
  Future<String> deletePayment(Paymententity payment) {
    // TODO: implement deletePayment
    throw UnimplementedError();
  }

  @override
  Future<String> updatePayment(Paymententity payment) {
    // TODO: implement updatePayment
    throw UnimplementedError();
  }

  @override
  Future<List<Paymententity>> viewpayment() async {
    return dummypayments;
  }



  @override
  Future<String> addTrainer(TrainerEntity trainer) async {
   final uri = Uri.parse('$api/api/Trainers'); // Replace with your API endpoint

  // Convert the Trainer instance to JSON
  final body = jsonEncode({
    "name": trainer.name,
  "designation":'Trainer',
  "timing": "morning"
  });

  // Send the POST request
  final response = await http.post(
    uri,
    headers: {
      'Content-Type': 'application/json',
    },
    body: body,
  );

  // Check the response status
  if (response.statusCode >= 200 && response.statusCode<300) {
    print('Trainer added successfully.');
  } else {
    print('Failed to add trainer. Status code: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
    return "added";
  }

  @override
  Future<String> deleteTrainer(TrainerEntity trainer) async{
        final uri = Uri.parse('$api/api/Trainers/${trainer.id}');

  // Send the DELETE request
  final response = await http.delete(uri);

  // Check the response status
  if (response.statusCode >= 200 && response.statusCode<300) {
    print('Trainer deleted successfully.');
    return "Deleted";
  } else {
    print('Failed to delete Trainer. Status code: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
    
    return  "Cannot delete";
  }

  @override
  Future<String> updateTrainer(TrainerEntity staff) {
    // TODO: implement updateTrainer
    throw UnimplementedError();
  }

  @override
  Future<List<TrainerEntity>> viewTrainer() async {
          try{
         final res = await http.get(Uri.parse("$api/api/Trainers"));
          // Plan p = Plan.fromJson(jsonDecode(res.body));
        if (res.statusCode >= 200 && res.statusCode<300) {
    // Parse JSON data
    final List<dynamic> jsonList = jsonDecode(res.body);
    print("In trainer list : ${jsonList.length}");
    // Convert JSON data to List<Services>
    return jsonList.map((json) => TrainerEntity.fromJson(json)).toList();
  } 
      }catch(e){

            print("cant load trainers");
      }

      return [];
  }
}
