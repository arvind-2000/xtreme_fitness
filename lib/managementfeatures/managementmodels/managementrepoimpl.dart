import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:universal_html/html.dart' as html;
import 'package:http_parser/http_parser.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';
import 'package:xtreme_fitness/config/apis.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/admission.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/membership.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/paymententity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/planentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/servicesentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/serviceusage.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/subscription.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/trainee.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/trainerentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/user.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/userpaymentmodel.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/managementrepo.dart';

import '../../authentifeatures/domain/userentity.dart';
import '../managementdomain/entities.dart/10latestpayment.dart';
import '../managementdomain/entities.dart/roles.dart';
import '../managementdomain/entities.dart/xtremer.dart';

class ManagementrepoImpl implements ManagementRepo {

@override
Future<Map<String, dynamic>> addMember(
    Xtremer xtremer, Uint8List? filepath, String userid) async {
  //print("In add member: userid $userid  xtremer submitted: ${xtremer.submittedBy}  ${xtremer.category}  ${xtremer.isActive}");

  // Create a new FormData object
  final formData = html.FormData();

  // Add fields to the form data
  formData.append('UserId', xtremer.XtremerId!.toString());
  formData.append('FirstName', xtremer.firstName!);
  formData.append('Surname', xtremer.surname ?? 'no');
  formData.append('DateOfBirth', xtremer.dateOfBirth.toString());
  formData.append('Address', xtremer.address ?? '');
  formData.append('Postcode', xtremer.postcode ?? '');
  formData.append('Occupation', xtremer.occupation ?? '');
  formData.append('HomeNumber', xtremer.homeNumber ?? '');
  formData.append('MobileNumber', xtremer.mobileNumber ?? '');
  formData.append('Email', xtremer.email ?? 'emails');
  formData.append('Disability', xtremer.disability ?? 'no');
  formData.append('PreferTiming', xtremer.preferTiming ?? '');
  formData.append('ContactName', xtremer.contactName ?? '');
  formData.append('ContactNumber', xtremer.contactNumber ?? '');
  formData.append('Relationship', xtremer.relationship ?? '');
  formData.append('UnableToExercise', xtremer.unableToExercise.toString());
  formData.append('PhysicianAdvisedAgainst', xtremer.physicianAdvisedAgainst.toString());
  formData.append('CardiacIssues', xtremer.cardiacIssues.toString());
  formData.append('RespiratoryDifficulties', xtremer.respiratoryDifficulties.toString());
  formData.append('FaintingMigraines', xtremer.faintingMigraines.toString());
  formData.append('BoneJointMuscleIssues', xtremer.boneJointMuscleIssues.toString());
  formData.append('FamilyHeartDisease', xtremer.familyHeartDisease.toString());
  formData.append('ChestPain', xtremer.chestPain.toString());
  formData.append('HighBloodPressure', xtremer.highBloodPressure.toString());
  formData.append('ElevatedCholesterol', xtremer.elevatedCholesterol.toString());
  formData.append('PrescribedMedication', xtremer.prescribedMedication.toString());
  formData.append('DoctorName', xtremer.doctorName ?? '');
  formData.append('SurgeryName', xtremer.surgeryName ?? '');
  formData.append('SurgeryNumber', xtremer.surgeryNumber ?? '');
  formData.append('SurgeryAddress', xtremer.surgeryAddress ?? '');
  formData.append('Declaration', xtremer.declaration?.toString() ?? 'false');
  formData.append('SubmittedBy', xtremer.submittedBy.toString());
  formData.append('Category', xtremer.category?.toString() ?? '');
  formData.append('IsActive', xtremer.isActive?.toString()??false.toString());

  // Add the file to the form data
  if (filepath != null) {
    formData.appendBlob('ProfilePhotoFile', html.Blob([filepath], 'image/png'), 'prof${Random().nextInt(100)}.png');
  }

  try {
    // Create an XMLHttpRequest
    final xhr = html.HttpRequest();

    // Open the request
    xhr.open('POST', '$api/api/Xtremers', async: true);
    xhr.withCredentials = true; // Set withCredentials to true

    // Send the FormData
    xhr.send(formData);

    // Wait for the response
    await xhr.onLoad.first;

    // Check the status code
    if (xhr.status! >= 200 && xhr.status! < 300) {
      String responseBody = xhr.responseText!;
      //print('Upload successful: $responseBody');
      return {"response": responseBody};
    } else if (xhr.status == 409) {
      String responseBody = xhr.responseText!;
      //print('Conflict Error: $responseBody');
      return {"response": xhr.statusText};
    } else {
      //print('Request failed with status: ${xhr.status}');
      //print('Reason: ${xhr.statusText}');
      return {"response": xhr.statusText};
    }
  } catch (e) {
    //print('Error occurred: $e');
    return {"response": e.toString()};
  }
}


 @override
Future<String> updateMember(Xtremer xtremer) async {
  try {
    // Create a new FormData object
    final formData = html.FormData();

    // Add fields to the form data
    formData.append("Id", xtremer.id.toString());
    formData.append('UserId', xtremer.XtremerId.toString());
    formData.append('FirstName', xtremer.firstName!);
    formData.append('Surname', xtremer.surname ?? '');
    formData.append('DateOfBirth', xtremer.dateOfBirth.toString());
    formData.append('Address', xtremer.address ?? '');
    formData.append('Postcode', xtremer.postcode ?? '');
    formData.append('Occupation', xtremer.occupation ?? '');
    formData.append('HomeNumber', xtremer.homeNumber ?? '');
    formData.append('MobileNumber', xtremer.mobileNumber ?? '');
    formData.append('Email', xtremer.email ?? '');
    formData.append('Disability', xtremer.disability ?? '');
    formData.append('PreferTiming', xtremer.preferTiming ?? '');
    formData.append('ContactName', xtremer.contactName ?? '');
    formData.append('ContactNumber', xtremer.contactNumber ?? '');
    formData.append('Relationship', xtremer.relationship ?? '');
    formData.append('UnableToExercise', xtremer.unableToExercise.toString());
    formData.append('PhysicianAdvisedAgainst', xtremer.physicianAdvisedAgainst.toString());
    formData.append('CardiacIssues', xtremer.cardiacIssues.toString());
    formData.append('RespiratoryDifficulties', xtremer.respiratoryDifficulties.toString());
    formData.append('FaintingMigraines', xtremer.faintingMigraines.toString());
    formData.append('BoneJointMuscleIssues', xtremer.boneJointMuscleIssues.toString());
    formData.append('FamilyHeartDisease', xtremer.familyHeartDisease.toString());
    formData.append('ChestPain', xtremer.chestPain.toString());
    formData.append('HighBloodPressure', xtremer.highBloodPressure.toString());
    formData.append('ElevatedCholesterol', xtremer.elevatedCholesterol.toString());
    formData.append('PrescribedMedication', xtremer.prescribedMedication.toString());
    formData.append('DoctorName', xtremer.doctorName ?? '');
    formData.append('SurgeryName', xtremer.surgeryName ?? '');
    formData.append('SurgeryNumber', xtremer.surgeryNumber ?? '');
    formData.append('SurgeryAddress', xtremer.surgeryAddress ?? '');
    formData.append('Declaration', xtremer.declaration?.toString() ?? 'false');
    formData.append('SubmittedBy', xtremer.submittedBy.toString());
    formData.append('Category', xtremer.category ?? "General");
    formData.append('IsActive', xtremer.isActive.toString());

    // Create an XMLHttpRequest
    final xhr = html.HttpRequest();

    // Open the request
    xhr.open('PUT', '$api/api/Xtremers/${xtremer.id}', async: true);
    xhr.withCredentials = true; // Set withCredentials to true

    // Send the FormData
    xhr.send(formData);

    // Wait for the response
    await xhr.onLoad.first;

    // Check the status code
    if (xhr.status! >= 200 && xhr.status! < 300) {
      String responseBody = xhr.responseText!;
      //print('Update successful: $responseBody');
      return "Update successful";
    } else if (xhr.status == 409) {
      String responseBody = xhr.responseText!;
      return "Conflict Error: $responseBody";
    } else {
      return 'Request failed with status: ${xhr.status} ${xhr.statusText}';
    }
  } catch (e) {
    //print('Error occurred: $e');
    rethrow;
  }
}

  @override
  Future<String> deleteMember(Xtremer xtremer) {
    throw UnimplementedError();
  }

  @override
  Future<List<Xtremer>> viewgeneralmembers() async {
    List<Xtremer> allxtremelist = [];
    List<Xtremer> generalxtremelist = [];
    try {
      final res = await http.get(Uri.parse("$api/api/Xtremers"));
      if (res.statusCode >= 200 && res.statusCode < 300) {
        final List<dynamic> jsonList = jsonDecode(res.body);
        //print("In Xtremer list : ${jsonList.length}");
        allxtremelist = jsonList.map((json) => Xtremer.fromJson(json)).toList();
        // Filter for today's elements
        for (var element in allxtremelist) {
          if (generalxtremelist.contains(element)) {
            //print('already added to today list');
          } else {
            if (element.category == 'General') {
              if (element.isActive == true) {
                generalxtremelist.add(element);
              }
              // Add all elements whose createddate is today
            }
          }
        }
        //print("General :${generalxtremelist.length}");
        return generalxtremelist;
      }
    } catch (e) {}
    return [];
  }

  @override
  Future<List<Xtremer>> viewpersonalmembers() async {
    List<Xtremer> allxtremelist = [];
    List<Xtremer> personalxtremelist = [];
    try {
      final res = await http.get(Uri.parse("$api/api/Xtremers"));
      if (res.statusCode >= 200 && res.statusCode < 300) {
        final List<dynamic> jsonList = jsonDecode(res.body);
        //print("In Xtremer list : ${jsonList.length}");
        allxtremelist = jsonList.map((json) => Xtremer.fromJson(json)).toList();
        // Filter for today's elements
        for (var element in allxtremelist) {
          if (personalxtremelist.contains(element)) {
            //print('already added to today list');
          } else {
            if (element.category == 'Personal') {
              if (element.isActive == true) {
                personalxtremelist.add(element);
              }
              // Add all elements whose createddate is today
            }
          }
        }
        return personalxtremelist;
      }
    } catch (e) {}
    return [];
  }

  @override
  Future<List<Xtremer>> viewinactivemembers() async {
    List<Xtremer> allxtremelist = [];
    List<Xtremer> inactivextremelsit = [];
    try {
      final res = await http.get(Uri.parse("$api/api/Xtremers"));
      if (res.statusCode >= 200 && res.statusCode < 300) {
        final List<dynamic> jsonList = jsonDecode(res.body);
        //print("In Xtremer list : ${jsonList.length}");
        allxtremelist = jsonList.map((json) => Xtremer.fromJson(json)).toList();
        // Filter for today's elements
        for (var element in allxtremelist) {
          if (inactivextremelsit.contains(element)) {
            //print('already added to today list');
          } else {
            if (element.isActive == false) {
              // Add all elements whose createddate is today
              inactivextremelsit.add(element);
            }
          }
        }
        return inactivextremelsit;
      }
    } catch (e) {}
    return [];
  }

//   @override
//   Future<List<Xtremer>> viewMemberforoverall() async {
//     List<Xtremer> allxtremelist = [];
//     List<Xtremer> todayxtremelsit = [];
//     List<Xtremer> yesterdayxtremlist = [];
//     try {
//       final res = await http.get(Uri.parse("$api/api/Xtremers"));

//       if (res.statusCode >= 200 && res.statusCode < 300) {
//         // Parse JSON data
//         final List<dynamic> jsonList = jsonDecode(res.body);
//         //print("In Xtremer list : ${jsonList.length}");
//         allxtremelist = jsonList.map((json) => Xtremer.fromJson(json)).toList();
//         DateTime now = DateTime.now();
//         DateTime today = DateTime(now.year, now.month, now.day);
//         DateTime yesterday = today.subtract(const Duration(days: 1));

// // Filter for today's elements
//         for (var element in allxtremelist) {
//           if (todayxtremelsit.contains(element)) {
//             //print('already added to today list');
//           } else {
//             // Create a new DateTime object from createddate without time component
//             DateTime createdDate = DateTime(element.createddate!.year,
//                 element.createddate!.month, element.createddate!.day);

//             if (createdDate.isAtSameMomentAs(today)) {
//               // Add all elements whose createddate is today (ignoring time)
//               todayxtremelsit.add(element);
//             }
//           }
//         }

// // Filter for yesterday's elements
//         for (var element in allxtremelist) {
//           if (yesterdayxtremlist.contains(element)) {
//             //print('already added to today list');
//           } else {
//             // Create a new DateTime object from createddate without time component
//             DateTime createdDate = DateTime(element.createddate!.year,
//                 element.createddate!.month, element.createddate!.day);

//             if (createdDate.isAtSameMomentAs(yesterday)) {
//               // Add all elements whose createddate is today (ignoring time)
//               yesterdayxtremlist.add(element);
//             }
//           }
//         }

//         //print("Today Register members :${todayxtremelsit.length}");
//         //print("Yesterday Register members :${yesterdayxtremlist.length}");
//         //print("Drop down index :${pgctrl.overalldropdownindex.value}");
//         switch (pgctrl.overalldropdownindex.value) {
//           case 0:
//             return allxtremelist;
//           case 1:
//             return todayxtremelsit;
//           case 2:
//             return yesterdayxtremlist;
//           default:
//         }
//       } else {}
//     } catch (e) {
//       //print("cant load Xtremer for overall : $e");
//     }

//     return [];
//   }

@override
Future<List<Xtremer>> viewMember() async {
  try {
    // Create a new XMLHttpRequest
    final xhr = html.HttpRequest();

    // Open the request
    xhr.open('GET', '$api/api/Xtremers', async: true);
    xhr.withCredentials = true; // Set withCredentials to true

    // Send the request
    xhr.send();

    // Wait for the response
    await xhr.onLoad.first;

    if (xhr.status! >= 200 && xhr.status! < 300) {
      // Parse JSON data
      final List<dynamic> jsonList = jsonDecode(xhr.responseText!);
      //print("In Xtremer list: ${jsonList.length}");
      List<Xtremer> xtremelist = jsonList.map((json) => Xtremer.fromJson(json)).toList();

      return xtremelist;
    } else {
      //print('Failed to load Xtremer. Status: ${xhr.status}');
    }
  } catch (e) {
    //print("Can't load Xtremer: $e");
  }

  return [];
}

@override
Future<List<Xtremer>> viewPersonalTrainer() async {
  try {
    // Create a new XMLHttpRequest
    final xhr = html.HttpRequest();

    // Open the request
    xhr.open('GET', '$api/api/Xtremers', async: true);
    xhr.withCredentials = true; // Set withCredentials to true

    // Send the request
    xhr.send();

    // Wait for the response
    await xhr.onLoad.first;

    if (xhr.status! >= 200 && xhr.status! < 300) {
      // Parse JSON data
      final List<dynamic> jsonList = jsonDecode(xhr.responseText!);
      //print("In Xtremer list: ${jsonList.length}");

      return jsonList.map((json) => Xtremer.fromJson(json)).toList();
    } else {
      //print('Failed to load Xtremer. Status: ${xhr.status}');
    }
  } catch (e) {
    //print("Can't load Xtremer: $e");
  }

  return [];
}

@override
Future<Map<int, String>> addStaff(Staff staff) async {
  final uri = '$api/api/Users/register'; // Replace with your API endpoint

  // Convert the Staff instance to JSON
  final body = jsonEncode({
    "mobileNumber": staff.phone,
    "userName": staff.username,
    "passwordHash": staff.phone,
    "roleName": "Staff",
    "createdAt": DateTime.now().toString(),
    "isActive": true,
  });

  try {
    // Create a new XMLHttpRequest
    final xhr = html.HttpRequest();

    // Open the request
    xhr.open('POST', uri, async: true);
    xhr.withCredentials = true; // Set withCredentials to true
    xhr.setRequestHeader('Content-Type', 'application/json'); // Set content type

    // Send the request with the JSON body
    xhr.send(body);

    // Wait for the response
    await xhr.onLoad.first;

    // Check the response status
    if (xhr.status! >= 200 && xhr.status! < 300) {
      //print('User added successfully.');
      return {200: xhr.responseText!};
    } else {
      //print('Failed to add user. Status code: ${xhr.status}');
      //print('Response body: ${xhr.responseText}');

      if (xhr.status! >= 500) {
        return {xhr.status!: "Server error. Try Again after some time"};
      } else {
        return {xhr.status!: xhr.responseText!};
      }
    }
  } catch (e) {
    //print("Error in user registration: $e");
    return {0: "Error in user registration"};
  }
}


  @override
  Future<String> deleteStaff(Staff staff) async {
    // dummystaff.removeWhere(
    //   (element) => element.uid == staff.uid,
    // );
    return "remove";
  }

@override
Future<List<UserEntity>> viewStaff() async {
  List<UserEntity> stafflist = [];

  try {
    // Create a new XMLHttpRequest
    final xhr = html.HttpRequest();

    // Open the request
    xhr.open('GET', '$api/api/Users', async: true);
    xhr.withCredentials = true; // Set withCredentials to true

    // Send the request
    xhr.send();

    // Wait for the response
    await xhr.onLoad.first;

    // Check the response status
    final int? statusCode = xhr.status; // Nullable status code
    if (statusCode != null && statusCode >= 200 && statusCode < 300) {
      // Parse JSON data
      final List<dynamic> jsonList = jsonDecode(xhr.responseText!);
      //print("In staff list: ${jsonList.length}");

      // Convert JSON data to List<UserEntity>
      stafflist = jsonList.map((json) {
        //print(json);
        return UserEntity.fromJson(json);
      }).toList();

      //print("In staff list actual: ${stafflist.length}");
    } else {
      //print('Failed to load staff. Status code: $statusCode');
    }
  } catch (e) {
    //print("Can't load staff: $e");
  }

  return stafflist.where((element) =>
      element.roleName?.toLowerCase() != "super admin" &&
      element.roleName?.toLowerCase() != 'member').toList();
}


  @override
  Future<List<Plan>> getPlans() async {
    try {
      final res = await http.get(Uri.parse("$api/api/Plans"));
      // Plan p = Plan.fromJson(jsonDecode(res.body));
      if (res.statusCode >= 200 && res.statusCode < 300) {
        // Parse JSON data
        final List<dynamic> jsonList = jsonDecode(res.body);
        //print("In plan list : ${jsonList.length}");
        // Convert JSON data to List<Plan>
        return jsonList.map((json) => Plan.fromJson(json)).toList();
      } else {}
    } catch (e) {
      //print("cant load plans");
    }

    return [];
  }



@override
Future<String> addPlans({required Plan plan}) async {
  try {
    // Create a new XMLHttpRequest
    final xhr = html.HttpRequest();

    // Open the request
    xhr.open('POST', '$api/api/Plans', async: true);
    xhr.withCredentials = true; // Set withCredentials to true
    xhr.setRequestHeader('Content-Type', 'application/json'); // Set content type

    // Prepare the body
    final body = jsonEncode({
      "name": plan.name,
      "price": plan.price,
      "durationInMonths": plan.durationInMonths,
      "discountPercentage": plan.discountPercentage,
      "category": plan.category,
    });

    // Send the request with the JSON body
    xhr.send(body);

    // Wait for the response
    await xhr.onLoad.first;

    //print("Adding plans: response ${xhr.status}");
    if (xhr.status! >= 200 && xhr.status! < 300) {
      final d = jsonDecode(xhr.responseText!);
      //print(d);
      //print("${d["Category"]}   ${d["DiscountPercentage"]}  ${d["DurationInMonths"]}  ${d["Name"]}");
      
      return d["Id"].toString();
    } else {
      //print('Failed to add plan. Status code: ${xhr.status}');
    }
  } catch (e) {
    //print("Error adding plans: $e");
  }
  return "";
}

  @override
  Future<bool> deletePlans({required Plan plan}) async {
    final uri = Uri.parse('$api/api/Plans/${plan.id}');

    // Send the DELETE request
    final response = await http.delete(uri);

    // Check the response status
    if (response.statusCode >= 200 && response.statusCode < 300) {
      //print('Plan deleted successfully.');
      return true;
    } else {
      //print('Failed to delete plan. Status code: ${response.statusCode}');
      //print('Response body: ${response.body}');
    }
    return false;
  }



@override
Future<String> updatePlans({required Plan plan}) async {
  final uri = '$api/api/Plans/${plan.id}';

  // Convert the Plan instance to JSON
  final body = jsonEncode(plan.toJson());

  // Create a new XMLHttpRequest
  final xhr = html.HttpRequest();

  try {
    // Open the request
    xhr.open('PUT', uri, async: true);
    xhr.withCredentials = true; // Set withCredentials to true
    xhr.setRequestHeader('Content-Type', 'application/json'); // Set content type

    // Send the request with the JSON body
    xhr.send(body);

    // Wait for the response
    await xhr.onLoad.first;

    // Check the response status
    if (xhr.status! >= 200 && xhr.status! < 300) {
      return "Plan updated successfully";
    } else {
      return 'Failed to update plan. Status code: ${xhr.status}';
    }
  } catch (e) {
    //print("Error updating plans: $e");
    return "Error updating plans";
  }
}

  // SERVICES
@override
Future<String> addServices({required ServiceEntity service}) async {
  final uri = '$api/api/Services'; // Replace with your API endpoint

  // Convert the Service instance to JSON
  final body = jsonEncode(service.toJson());

  // Create a new XMLHttpRequest
  final xhr = html.HttpRequest();

  try {
    // Open the request
    xhr.open('POST', uri, async: true);
    xhr.withCredentials = true; // Set withCredentials to true
    xhr.setRequestHeader('Content-Type', 'application/json'); // Set content type
    xhr.withCredentials = true;
    // Send the request with the JSON body
    xhr.send(body);

    // Wait for the response
    await xhr.onLoad.first;

    // Check the response status
    if (xhr.status! >= 200 && xhr.status! < 300) {
      return 'Service created successfully.';
    } else {
      return 'Failed to create service. Status code: ${xhr.status}';
    }
  } catch (e) {
    //print("Error adding service: $e");
    return "Error adding service";
  }
}

  @override
  Future<String> deleteServices({required ServiceEntity service}) async {
    final uri = Uri.parse('$api/api/Services/${service.id}');

    // Send the DELETE request
    final response = await http.delete(uri);

    // Check the response status
    if (response.statusCode >= 200 && response.statusCode < 300) {
      //print('Services deleted successfully.');
      return "Deleted";
    } else {
      //print('Failed to delete Services. Status code: ${response.statusCode}');
      //print('Response body: ${response.body}');
    }

    return "Cannot delete";
  }


@override
Future<List<ServiceEntity>> getServices() async {
  final uri = '$api/api/Services'; // Replace with your API endpoint
  List<ServiceEntity> servicesList = [];

  // Create a new XMLHttpRequest
  final xhr = html.HttpRequest();

  try {
    // Open the request
    xhr.open('GET', uri, async: true);
    xhr.withCredentials = true; // Set withCredentials to true

    // Send the request
    xhr.send();

    // Wait for the response
    await xhr.onLoad.first;

    // Check the response status
    if (xhr.status! >= 200 && xhr.status! < 300) {
      // Parse JSON data
      final List<dynamic> jsonList = jsonDecode(xhr.responseText!);
      //print("In Services list : ${jsonList.length}");
      
      // Convert JSON data to List<ServiceEntity>
      servicesList = jsonList.map((json) => ServiceEntity.fromJson(json)).toList();
    } else {
      //print('Failed to load services. Status code: ${xhr.status}');
    }
  } catch (e) {
    //print("Can't load services: $e");
  }

  return servicesList;
}


@override
Future<String> updateServices({required ServiceEntity service}) async {
  final uri = '$api/api/Services/${service.id}'; // Replace with your API endpoint

  // Convert the Service instance to JSON
  final body = jsonEncode(service.toJson());

  // Create a new XMLHttpRequest
  final xhr = html.HttpRequest();

  try {
    // Open the request
    xhr.open('PUT', uri, async: true);
    xhr.withCredentials = true; // Set withCredentials to true

    // Set the request headers
    xhr.setRequestHeader('Content-Type', 'application/json');

    // Send the request
    xhr.send(body);

    // Wait for the response
    await xhr.onLoad.first;

    // Check the response status
    if (xhr.status! >= 200 && xhr.status! < 300) {
      return 'Service updated successfully.';
    } else {
      return 'Failed to update service. Status code: ${xhr.status}';
    }
  } catch (e) {
    return "Error updating service: $e";
  }
}


  @override
  Future<String> renewal(
      {required Xtremer xtremer, required PaymentModel payment}) {
    // TODO: implement renewal
    throw UnimplementedError();
  }



@override
Future<String> updateStaff(UserEntity staff) async {
  final uri = '$api/api/Users/${staff.id}'; // Replace with your API endpoint

  // Convert the User instance to JSON
  final body = jsonEncode(staff.toJson());

  // Create a new XMLHttpRequest
  final xhr = html.HttpRequest();

  try {
    // Open the request
    xhr.open('PUT', uri, async: true);
    xhr.withCredentials = true; // Set withCredentials to true

    // Set the request headers
    xhr.setRequestHeader('Content-Type', 'application/json');

    // Send the request
    xhr.send(body);

    // Wait for the response
    await xhr.onLoad.first;

    // Check the response status
    if (xhr.status! >= 200 && xhr.status! < 300) {
      return 'Staff updated successfully.';
    } else {
      return 'Failed to update staff. Status code: ${xhr.status}';
    }
  } catch (e) {
    return "Error updating staff: $e";
  }
}


  //payments


@override
Future<Map<String, dynamic>> addPayments(
  Paymententity payment, {
  bool isonline = false,
  required String userid,
}) async {
  double amount = payment.amount;
  double discount = payment.discountPercentage;
  double receivedAmount = payment.receivedAmount;
  String transid = payment.transactionId;
  String status = payment.paymentStatus;
  String method = payment.paymentMethod;
  String type = payment.paymentType;
  int? subsid = payment.subscriptionId;
  int? serviceid = payment.serviceUsageId;
  String dates = payment.paymentDate.toString();
  bool tnc = payment.termsAndConditions;

  //print("$amount  $discount  $receivedAmount  $transid  $status  $method  $type $subsid  $dates");

  if (isonline) {
    try {
      var uri = Uri.parse('$api/api/Payments/OnlinePayment');
      var body = jsonEncode({
        "userId": userid,
        "amount": amount,
        "discountPercentage": discount.round(),
        "receivedAmount": receivedAmount,
        "paymentDate": dates,
        "transactionId": transid,
        "paymentStatus": status,
        "paymentMethod": method,
        "paymentType": type,
        "subscriptionId": subsid,
        "serviceUsageId": serviceid,
        'termsAndConditions': tnc
      });

      // Create a new XMLHttpRequest
      final xhr = html.HttpRequest();
      xhr.open('POST', uri.toString(), async: true);
      xhr.withCredentials = true; // Set withCredentials to true
      xhr.setRequestHeader('Content-Type', 'application/json');

      // Send the request
      xhr.send(body);

      // Wait for the response
      await xhr.onLoad.first;

      // Check the response status
      if (xhr.status! >= 200 && xhr.status! < 300) {
        var url = xhr.responseText; // Get the response URL
          if (await canLaunchUrl(Uri.parse(url!))) {
          await launchUrl(
            Uri.parse(url),
            // forceSafariVC: true,
            // forceWebView: true,
            // enableJavaScript: true,
            webOnlyWindowName: '_self',
          );
          return {"response": xhr.status};
          } 
          else {
          return {"response": xhr.status};
        }
      } else {
        //print("${xhr.statusText} ${xhr.status}");
        return {"response": xhr.status};
      }
    } catch (e) {
      //print("Error during online payment: $e");
      return {"response": 0}; // Error response
    }
  } else {
    try {
      var uri = Uri.parse('$api/api/Payments/CashPayment');
      var body = jsonEncode({
        "userId": userid,
        "amount": amount,
        "discountPercentage": discount.round(),
        "receivedAmount": receivedAmount,
        "paymentDate": dates,
        "transactionId": transid,
        "paymentStatus": status,
        "paymentMethod": method,
        "paymentType": type,
        "subscriptionId": subsid,
      });

      // Create a new XMLHttpRequest for cash payment
      final xhr = html.HttpRequest();
      xhr.open('POST', uri.toString(), async: true);
      xhr.withCredentials = true; // Set withCredentials to true
      xhr.setRequestHeader('Content-Type', 'application/json');

      // Send the request
      xhr.send(body);

      // Wait for the response
      await xhr.onLoad.first;

      // Check the response status
      if (xhr.status! >= 200 && xhr.status! < 300) {
        //print("Payment added: ${xhr.status}");
        return {"response": 200};
      } else {
        //print(xhr.statusText);
        return {"response": xhr.status};
      }
    } catch (e) {
      //print("Error during cash payment: $e");
      return {"response": 0}; // Error response
    }
  }
}


  @override
  Future<String> deletePayment(Paymententity payment) {
    // TODO: implement deletePayment
    throw UnimplementedError();
  }


@override
Future<String> updatePayment(Alluserpaymentmodel payment) async {
  double amount = payment.amount!;
  double discount = payment.discountPercentage!.toDouble();
  double receivedAmount = payment.receivedAmount;
  String transid = payment.transactionId!;
  String status = payment.paymentStatus!;
  String method = payment.paymentMethod!;
  String type = payment.paymentType!;
  int? subsid = payment.subscriptionId;
  int? serviceid = payment.serviceUsageId;
  String dates = payment.paymentDate.toString();

  //print("$amount  $discount  $receivedAmount  $transid  $status  $method  $type $subsid  $dates");

  var uri = Uri.parse('$api/api/Payments/PaymentStatus?transId=${payment.transactionId}');
  var headers = {'Content-Type': 'application/json'};

  try {
    // Create a new XMLHttpRequest
    final xhr = html.HttpRequest();
    xhr.open('PUT', uri.toString(), async: true);
    xhr.withCredentials = true; // Set withCredentials to true
    xhr.setRequestHeader('Content-Type', 'application/json');

    // Prepare the request body
    var body = jsonEncode({
     
      "paymentDate": DateTime.now().toIso8601String(),
      "transactionId": transid,
      "paymentStatus": status,
    });

    // Send the request
    xhr.send(body);

    // Wait for the response
    await xhr.onLoad.first;

    // Check the response status
    if (xhr.status! >= 200 && xhr.status! < 300) {
      //print("Payment updated: ${xhr.status}");
      return "Payment Updated Successfully";
    } else {
      //print(xhr.statusText);
      return "Failed to update payments.";
    }
  } catch (e) {
    //print("Error updating payments: $e");
    return "Error updating payments";
  }
}




@override
Future<List<Alluserpaymentmodel>> viewpayment() async {
  //print('viewpayment function');
  final url = Uri.parse("$api/api/Payments"); // Example endpoint

  try {
    // Create a new XMLHttpRequest
    final xhr = html.HttpRequest();
    xhr.open('GET', url.toString(), async: true);
    xhr.withCredentials = true; // Set withCredentials to true

    // Send the request
    xhr.send();

    // Wait for the response
    await xhr.onLoad.first;

    // Check the response status
    if (xhr.status!  >= 200 &&  xhr.status! < 300) {
      var alldata = alluserpaymentmodelFromJson(xhr.responseText!);
      //print(alldata[1].receivedAmount);
      return alldata;
    } else {
      //print('Failed to fetch payments. Status: ${xhr.status}');
    }
  } catch (e) {
    //print("Error fetching payments: $e");
  }

  return [];
}


@override
Future<String> addTrainer(TrainerEntity trainer) async {
  final uri = Uri.parse('$api/api/Trainers'); // Replace with your API endpoint

  // Convert the Trainer instance to JSON
  final body = jsonEncode({
    "name": trainer.name,
    "designation": 'Trainer',
    "timing": "morning",
    'isActive': true,
  });

  try {
    // Create a new XMLHttpRequest
    final xhr = html.HttpRequest();
    xhr.open('POST', uri.toString(), async: true);
    xhr.withCredentials = true; // Include credentials in the request
    xhr.setRequestHeader('Content-Type', 'application/json');

    // Send the request
    xhr.send(body);

    // Wait for the response
    await xhr.onLoad.first;

    // Check the response status
    if (xhr.status! >= 200 && xhr.status! < 300) {
      //print('Trainer added successfully.');
      return 'added';
    } else {
      //print('Failed to add trainer. Status code: ${xhr.status}');
      //print('Response body: ${xhr.responseText}');
      return 'error';
    }
  } catch (e) {
    //print('Error adding trainer: $e');
    return 'error';
  }
}

  @override
  Future<String> deleteTrainer(TrainerEntity trainer) async {
    final uri = Uri.parse('$api/api/Trainers/${trainer.id}');

    // Send the DELETE request
    final response = await http.delete(uri);

    // Check the response status
    if (response.statusCode >= 200 && response.statusCode < 300) {
      //print('Trainer deleted successfully.');
      return "Deleted";
    } else {
      //print('Failed to delete Trainer. Status code: ${response.statusCode}');
      //print('Response body: ${response.body}');
    }

    return "Cannot delete";
  }



@override
Future<String> updateTrainer(TrainerEntity trainer) async {
  final uri = Uri.parse('$api/api/Trainers/${trainer.id}'); // API endpoint

  // Convert the Trainer instance to JSON
  final body = jsonEncode({
    "id": trainer.id,
    "name": trainer.name,
    "designation": 'Trainer',
    "timing": trainer.timing,
    "isActive": trainer.isActive,
  });
  
  //print(body);

  try {
    // Create a new XMLHttpRequest
    final xhr = html.HttpRequest();
    xhr.open('PUT', uri.toString(), async: true);
    xhr.withCredentials = true; // Include credentials in the request
    xhr.setRequestHeader('Content-Type', 'application/json');

    // Send the request
    xhr.send(body);

    // Wait for the response
    await xhr.onLoad.first;

    // Check the response status
    if (xhr.status! >= 200 && xhr.status! < 300) {
      return 'Trainer updated successfully.';
    } else {
      //print('Failed to update trainer. Status code: ${xhr.status}');
      //print('Response body: ${xhr.responseText}');
    }
  } catch (e) {
    //print('Error updating trainer: $e');
    return "Failed to update trainer";
  }
  
  return "Failed to update trainer";
}


@override
Future<List<TrainerEntity>> viewTrainer() async {
  try {
    // Send GET request using universal_html's HttpRequest
    final request = await html.HttpRequest.request(
      "$api/api/Trainers",
    withCredentials: true, // Include credentials in the request
      method: "GET",
    );

    // Check the response status
    if (request.status!  >= 200 &&  request.status! < 300) {
      // Parse JSON data
      final List<dynamic> jsonList = jsonDecode(request.responseText!);
      //print("In trainer list: ${jsonList.length}");
      // Convert JSON data to List<TrainerEntity>
      return jsonList.map((json) => TrainerEntity.fromJson(json)).toList();
    } else {
      //print('Failed to load trainers. Status code: ${request.status}');
      //print('Response body: ${request.responseText}');
    }
  } catch (e) {
    //print("Error loading trainers: $e");
  }

  return [];
}


@override
Future<Map<int, String>> addUser(
    String username, String pass, String phone, String role) async {
  final uri = '$api/api/Users/register'; // Replace with your API endpoint

  // Convert the User instance to JSON
  final body = jsonEncode({
    "mobileNumber": phone,
    "userName": username,
    "passwordHash": pass,
    "roleName": role,
    "createdAt": DateTime.now().toString(),
    "isActive": true
  });

  // Send the POST request using universal_html's HttpRequest
  try {
    final request = await html.HttpRequest.request(
      uri,
      method: 'POST',
      sendData: body,
      withCredentials: true,
      requestHeaders: {
        'Content-Type': 'application/json',
      },
    );

    // Check the response status
    if (request.status!  >= 200 &&  request.status! < 300) {
      //print('User added successfully.');
      return {200: request.responseText!};
    } else {
      //print('Failed to add user. Status code: ${request.status}');
      //print('Response body: ${request.responseText}');
      if (request.status! >= 500) {
        return {request.status!: "Server error. Try again after some time"};
      } else {
        return {request.status!: request.responseText!};
      }
    }
  } catch (e) {
    //print("Error in user register: $e");
    return {0: "Error in user register"};
  }
}




@override
Future<String?> viewUser(String username, String pass) async {
  //print("in login auth");
  String? uid = "";
  String url = "$api/api/Users/login";

  try {
    // Send the POST request using universal_html's HttpRequest
    final request = await html.HttpRequest.request(
      url,
      method: 'POST',
      requestHeaders: {
        "Content-Type": "application/json",
      },
      sendData: jsonEncode({
        "userName": username,
        "passwordHash": pass,
      }),
    );

    // Check the response status and parse the JSON response
    if (request.status!  >= 200 &&  request.status! < 300) {
      var d = jsonDecode(request.responseText!);
      uid = d["Data"]["UserId"].toString();
      //print(request.responseText);
      return uid;
    } else {
      //print('Failed to log in. Status code: ${request.status}');
      //print('Response body: ${request.responseText}');
    }
  } catch (e) {
    //print("Error: $e");
  }

  return null;
}

  ///service schedules add


@override
Future<ServiceSchedule?> addServiceUsage(ServiceSchedule serviceschedule) async {
  String userid = serviceschedule.userId.toString();
  String serviceid = serviceschedule.serviceId.toString();
  String scheduledate = serviceschedule.scheduleDate.toString();
  String price = serviceschedule.price.toString();
  String status = serviceschedule.status;
  String uri = '$api/api/ServiceUsages'; // Replace with your API endpoint
  //print("$userid  $serviceid $scheduledate $price $status");

  // Convert the ServiceSchedule instance to JSON
  final body = jsonEncode({
    'userId': userid,
    'serviceId': serviceid,
    'scheduleDate': scheduledate,
    'price': price,
    'status': status,
  });

  // Send the POST request using universal_html's HttpRequest
  try {
    final request = await html.HttpRequest.request(
      uri,
      method: 'POST',
      requestHeaders: {
        'Content-Type': 'application/json',
      },
      sendData: body,
    );

    // Check the response status
    if (request.status!  >= 200 &&  request.status! < 300) {
      //print('Service schedule added successfully.');
      return ServiceSchedule.fromJson(jsonDecode(request.responseText!));
    } else {
      //print('Failed to add service schedule. Status code: ${request.status}');
      //print('Response body: ${request.responseText}');
    }
  } catch (e) {
    //print("Error: $e");
  }

  return null;
}


@override
Future<ServiceSchedule?> getServiceUsage(int id) async {
  String uri = '$api/api/ServiceUsages/$id'; // Replace with your API endpoint

  try {
    // Send the GET request using universal_html's HttpRequest
    final request = await html.HttpRequest.request(
      uri,
      method: 'GET',
      requestHeaders: {
        'Content-Type': 'application/json',
      },
      withCredentials: true
    );

    // Check the response status
    if (request.status!  >= 200 &&  request.status! < 300) {
      //print('Service schedule retrieved successfully.');
      return ServiceSchedule.fromJson(jsonDecode(request.responseText!));
    } else {
      //print('Failed to get service schedule. Status code: ${request.status}');
      //print('Response body: ${request.responseText}');
    }
  } catch (e) {
    //print("Error: $e");
  }

  return null;
}


  /// subscription page
@override
Future<Subscription?> addSubscription(Subscription subs) async {
  String uri = '$api/api/Subscriptions'; // Replace with your API endpoint

  // Convert the Subscription instance to JSON
  final body = jsonEncode({
    "userId": subs.userId,
    "planId": subs.planId,
    "startDate": subs.startDate.toString(),
    "endDate": subs.endDate.toString(),
    "isActive": subs.isActive,
    "trainerId": subs.trainerId
  });

  try {
    // Send the POST request using universal_html's HttpRequest
    final request = await html.HttpRequest.request(
      uri,
      method: 'POST',
      requestHeaders: {
        'Content-Type': 'application/json',
      },
      withCredentials: true,
      sendData: body,
    );

    // Check the response status
    if (request.status!  >= 200 &&  request.status! < 300) {
      //print('Subscription added successfully.');
      return Subscription.fromJson(jsonDecode(request.responseText!));
    } else {
      //print('Failed to add subscription. Status code: ${request.status}');
      //print('Response body: ${request.responseText}');
    }
  } catch (e) {
    //print("Error: $e");
  }

  return null;
}

  @override
  Future<Subscription?> getSubscription(int id) async {
    final uri = Uri.parse(
        '$api/api/Subscriptions/$id'); // Replace with your API endpoint

    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    // Check the response status
    if (response.statusCode >= 200 && response.statusCode < 300) {
      //print('Subscription get successfully.');
      //print(response.body);
      return Subscription.fromJson(jsonDecode(response.body));
    } else {
      //print('Failed to get subscription. Status code: ${response.statusCode}');
      //print('Response body: ${response.body}');
    }

    return null;
  }



@override
Future<Paymententity?> getpayment(String transactionid) async {
  String uri = '$api/api/Payments/GetByTranId?transactionId=$transactionid'; // Replace with your API endpoint

  try {
    // Send the GET request using universal_html's HttpRequest
    final request = await html.HttpRequest.request(
      uri,
      method: 'GET',
      withCredentials: true,
      requestHeaders: {
        'Content-Type': 'application/json',
      },
    );

    // Check the response status
    if (request.status!  >= 200 &&  request.status! < 300) {
      //print('Payment retrieved successfully.');
      //print(request.responseText);
      return Paymententity.fromJson(jsonDecode(request.responseText!));
    } else {
      //print('Failed to get payment. Status code: ${request.status}');
      //print('Response body: ${request.responseText}');
    }
  } catch (e) {
    //print("Error: $e");
  }

  return null;
}


@override
Future<List<Paymentlatest10>> viewlatest10payment() async {
  String url = "$api/api/Payments/latest10"; // Example endpoint

  try {
    // Send the GET request using universal_html's HttpRequest
    final request = await html.HttpRequest.request(
      url,
      method: 'GET',
      withCredentials:true,
      requestHeaders: {
        'Content-Type': 'application/json',
      },
    );

    // Check if the request was successful
    if (request.status!  >= 200 &&  request.status! < 300) {
      var alldata = Paymentlatest10FromJson(request.responseText!);
      //print(alldata[1].receivedAmount);
      return alldata;
    }
  } catch (e) {
    //print("Error: ${e.toString()}");
  }

  return [];
}

  @override
Future<Map<Admission?, int>> viewadmission() async {
  final url = '$api/api/Admissions'; // Replace with your API endpoint

  try {
    // Create a new XMLHttpRequest
    final xhr = html.HttpRequest();
    // Open the request
    xhr.open('GET', url, async: true);
    // Set withCredentials to true
    xhr.withCredentials = true;
    // Send the request
    xhr.send();

    // Wait for the response
    await xhr.onLoad.first;

    // Check the status code
    if (xhr.status! >= 200 && xhr.status! < 300) {
      // Parse the response body
      final List<dynamic> jsonList = json.decode(xhr.responseText!);

      // Convert the JSON data to an Admission object
      return {jsonList.map((json) => Admission.fromJson(json)).toList().first: xhr.status!};
    } else {
      // Handle error response
      //print('Failed to load admission. Status code: ${xhr.status}');
      return {null: xhr.status!};
    }
  } catch (e) {
    // Handle exceptions like network errors
    //print('Error fetching admission: $e');
    return {null: 0};
  }
}



@override
Future<Uint8List?> getImage(int id) async {
  String url = "$api/api/Xtremers/$id/photo"; // Replace with your API endpoint

  try {
    // Send the GET request using universal_html's HttpRequest
    final request = await html.HttpRequest.request(
      url,
      method: 'GET',
      responseType: 'arraybuffer', // To handle binary data (image)
      withCredentials: true
    );

    // Check if the request was successful
    if (request.status!  >= 200 &&  request.status! < 300) {
      // Convert the response (ArrayBuffer) to Uint8List
      final Uint8List bytes = Uint8List.fromList(request.response as List<int>);
      return bytes;
    } else {
      // Handle errors or unsuccessful responses
      //print('Failed to load photo. Status code: ${request.status}');
      return null;
    }
  } catch (e) {
    // Handle exceptions
    //print('Error fetching photo: $e');
    return null;
  }
}




@override
Future<List<Trainee>> viewTrainee(int id) async {
  //print("in trainee api calls");
  try {
    final request = await html.HttpRequest.request(
      "$api/api/Trainers/trainer/$id",
      method: 'GET',
      requestHeaders: {
        'Content-Type': 'application/json',
      },
      withCredentials: true, // Include credentials
    );

    //print("${request.status}");
    if (request.status! >= 200 && request.status! < 300) {
      // Parse JSON data
      final List<dynamic> jsonList = jsonDecode(request.responseText!);
      //print("In Trainee list : ${jsonList.length}");
      List<Trainee> xtremelist =
          jsonList.map((json) => Trainee.fromJson(json)).toList();

      return xtremelist;
    } else {
      //print('Failed to load trainees. Status code: ${request.status}');
    }
  } catch (e) {
    //print("Can't load Trainee: $e");
  }

  return [];
}



@override
Future<List<Membership>> viewMembership() async {
  //print("in membership api calls");
  try {
    final request = await html.HttpRequest.request(
      "$api/api/Memberships",
      method: 'GET',
      requestHeaders: {
        'Content-Type': 'application/json',
      },
      withCredentials: true, // Include credentials
    );

    //print("${request.status}");
    if (request.status! >= 200 && request.status! < 300) {
      // Parse JSON data
      final List<dynamic> jsonList = jsonDecode(request.responseText!);
      //print("In Membership list : ${jsonList.length}");
      List<Membership> membershiplist =
          jsonList.map((json) => Membership.fromJson(json)).toList();

      return membershiplist;
    } else {
      //print('Failed to load memberships. Status code: ${request.status}');
    }
  } catch (e) {
    //print("Can't load Membership data: $e");
  }

  return [];
}


@override
Future<String> editMembership(Membership membership) async {
  final uri = Uri.parse('$api/api/Membership/${membership.id}');

  // Convert the Plan instance to JSON
  final body = jsonEncode(membership.toJson());

  // Send the PUT request
  try {
    final request = await html.HttpRequest.request(
      uri.toString(),
      method: 'PUT',
      requestHeaders: {
        'Content-Type': 'application/json',
      },
      sendData: body,
      withCredentials: true, // Include credentials
    );

    // Check the response status
    if (request.status! >= 200 && request.status! < 300) {
      return "Membership Updated Successfully";
    } else {
      return 'Failed to update membership. Status code: ${request.status}';
      // //print('Response body: ${request.responseText}');
    }
  } catch (e) {
    //print("Error updating membership: $e");
    return "Error updating membership";
  }
}

  @override
  Future<String> addRoles({required Role role})async {
    String uri = '$api/api/Roles'; // Replace with your API endpoint

  // Convert the Subscription instance to JSON
  final body = jsonEncode(role.toMap());

  try {
    // Send the POST request using universal_html's HttpRequest
    final request = await html.HttpRequest.request(
      uri,
      method: 'POST',
      requestHeaders: {
        'Content-Type': 'application/json',
      },
      withCredentials: true,
      sendData: body,
    );

    // Check the response status
    if (request.status!  >= 200 &&  request.status! < 300) {
      //print('Roles added successfully.');
      return "Roles added";
    } else {
      //print('Failed to add Roles. Status code: ${request.status}');
      //print('Response body: ${request.responseText}');
    }
  } catch (e) {
    //print("Error: $e");
  }

  return "Failed to add Roles";
  }

  @override
  Future<String> deleteRole({required Role role}) async{
        final uri = Uri.parse('$api/api/Roles/${role.id}');

  // Convert the Plan instance to JSON


  // Send the PUT request
  try {
    final request = await html.HttpRequest.request(
      uri.toString(),
      method: 'DELETE',
      requestHeaders: {
        'Content-Type': 'application/json',
      },
      withCredentials: true, // Include credentials
    );

    // Check the response status
    if (request.status! >= 200 && request.status! < 300) {
      return "Roles deleted Successfully";
    } else {
      return 'Failed to delete roles. Status code: ${request.status}';
      // //print('Response body: ${request.responseText}');
    }
  } catch (e) {
    //print("Error deleteing roles: $e");
    return "Error deleteing roles";
  }
  }

  @override
  Future<List<Role>> getRoles() async{
   //print("in roles api calls");
  try {
    final request = await html.HttpRequest.request(
      "$api/api/Roles",
      method: 'GET',
      requestHeaders: {
        'Content-Type': 'application/json',
      },
      withCredentials: true, // Include credentials
    );

    //print("${request.status}");
    if (request.status! >= 200 && request.status! < 300) {
      // Parse JSON data
      final List<dynamic> jsonList = jsonDecode(request.responseText!);
      //print("In Role list : ${jsonList.length}");
      List<Role> rolelist=
          jsonList.map((json) => Role.fromMap(json)).toList();

      return rolelist;
    } else {
      //print('Failed to load roles. Status code: ${request.status}');
    }
  } catch (e) {
    //print("Can't load roles data: $e");
  }

  return [];
  }

  @override
  Future<String> updateRole({required Role role}) async{
     final uri = Uri.parse('$api/api/Roles/${role.id}');

  // Convert the Plan instance to JSON
  final body = jsonEncode(role);

  // Send the PUT request
  try {
    final request = await html.HttpRequest.request(
      uri.toString(),
      method: 'PUT',
      requestHeaders: {
        'Content-Type': 'application/json',
      },
      sendData: body,
      withCredentials: true, // Include credentials
    );

    // Check the response status
    if (request.status! >= 200 && request.status! < 300) {
      return "Roles Updated Successfully";
    } else {
      return 'Failed to update roles. Status code: ${request.status}';
      // //print('Response body: ${request.responseText}');
    }
  } catch (e) {
    //print("Error updating roles: $e");
    return "Error updating roles";
  }
  }
  
  @override
  Future<String> updateadmission(Admission admission) async{
     final uri = Uri.parse('$api/api/Admissions/${admission.id}');

  // Convert the Plan instance to JSON
  final body = jsonEncode(admission.toJson());

  // Send the PUT request
  try {
    final request = await html.HttpRequest.request(
      uri.toString(),
      method: 'PUT',
      requestHeaders: {
        'Content-Type': 'application/json',
      },
      sendData: body,
      withCredentials: true, // Include credentials
    );

    // Check the response status
    if (request.status! >= 200 && request.status! < 300) {
      return "Admission Updated Successfully";
    } else {
      return 'Failed to update admission. Status code: ${request.status}';
      // //print('Response body: ${request.responseText}');
    }
  } catch (e) {
    //print("Error updating admission: $e");
    return "Error updating admission";
  }
  }
  
  @override
  Future<List<ServiceSchedule>> getAllServiceUsage() async{
   String uri = '$api/api/ServiceUsages'; // Replace with your API endpoint


  // Convert the ServiceSchedule instance to JSON

  // Send the POST request using universal_html's HttpRequest
  try {
    final request = await html.HttpRequest.request(
      uri,
      method: 'GET',
      requestHeaders: {
        'Content-Type': 'application/json',
      },
      withCredentials: true,
    );

    // Check the response status
    if (request.status!  >= 200 &&  request.status! < 300) {
         // Parse the response body
      final List<dynamic> jsonList = json.decode(request.responseText!);

      // Convert the JSON data to an Admission object
      return jsonList.map((json) => ServiceSchedule.fromJson(json)).toList();
      
    } else {
      //print( 'Failed to add service schedule. Status code: ${request.status}');

    }
  } catch (e) {
    //print("Error: $e");
  }

     return [];
  }
  
  
  @override
  Future<String> updateServiceUsage(ServiceSchedule serviceschedule)async {
    String userid = serviceschedule.userId.toString();
  String serviceid = serviceschedule.serviceId.toString();
  String scheduledate = serviceschedule.scheduleDate.toString();
  String price = serviceschedule.price.toString();
  String status = serviceschedule.status;
  String uri = '$api/api/ServiceUsages/${serviceschedule.id}'; // Replace with your API endpoint
  //print("$userid  $serviceid $scheduledate $price $status");

  // Convert the ServiceSchedule instance to JSON
  // final body = jsonEncode({
  //   'id':serviceschedule.serviceId,
  //   'userId': userid,
  //   'serviceId': serviceid,
  //   'scheduleDate': scheduledate,
  //   'price': price,
  //   'status': status,
  // });
final body = jsonEncode(serviceschedule.toJson());
  // Send the POST request using universal_html's HttpRequest
  try {
    final request = await html.HttpRequest.request(
      uri,
      method: 'PUT',
      requestHeaders: {
        'Content-Type': 'application/json',
      },
      sendData: body,
      withCredentials: true,
    );

    // Check the response status
    if (request.status! >= 200 && request.status! < 300) {
      return 'Service schedule added successfully.';
     
    } else {
      //print('Failed to add service schedule. Status code: ${request.status}');
      //print('Response body: ${request.responseText}');
    }
  } catch (e) {
    //print("Error: $e");
  }

  return "failed to update service usage";
  }
  
  @override
  Future<List<Subscription>> getAllSubscription() async{
    final uri = Uri.parse(
        '$api/api/Subscriptions'); // Replace with your API endpoint

  try {
    final request = await html.HttpRequest.request(
      uri.toString(),
      method: 'GET',
      requestHeaders: {
        'Content-Type': 'application/json',
      },
      withCredentials: true,
    );

    // Check the response status
    if (request.status!  >= 200 &&  request.status! < 300) {
         // Parse the response body
      final List<dynamic> jsonList = json.decode(request.responseText!);

      // Convert the JSON data to an Admission object
      return jsonList.map((json) => Subscription.fromJson(json)).toList();
      
    } else {
      //print( 'Failed to add service schedule. Status code: ${request.status}');

    }
  } catch (e) {
    //print("Error: $e");
  }

     return [];
  }

}
