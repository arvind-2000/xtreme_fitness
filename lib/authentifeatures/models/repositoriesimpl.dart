import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:xtreme_fitness/authentifeatures/config/apis.dart';
import 'package:xtreme_fitness/config/apis.dart';


import '../domain/domainrepositories.dart';
import '../domain/userentity.dart';
import 'usecases.dart';

class AuthenticationRepositoryImpl  implements AuthenticationRepository{
  //extends httprepositoriesImpl class for getting http responses
  //any updates regarding http response and change for rest api calls change in httpRepositoriesImpl

  
  @override
  Future<Map<String?,String>> emailAuthentication({required String email, required String pass}) async{
    // Future<Map<UserEntity,int>> auth = await 
    //check authentication and pass the user if correct
  print("in login auth");
  String? uid = "";
  String message = "login error";
    // Uri url =Uri.parse("http://10.10.1.96/api/Users/login?username=user1&password=userpass");
    Uri url =Uri.parse("$api/api/Users/login");

    final query = {
      "userName":email,
      "passwordHash":pass
    };
      try {
  final response = await http.post(
    url,
    headers: {
  //    "Access-Control-Allow-Origin": "*", // Required for CORS support to work
  // // "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
  // "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
  // "Access-Control-Allow-Methods": "POST, OPTIONS",
      "Content-Type":"application/json"
    },
    body:jsonEncode({
      "userName":email,
      "passwordHash":pass
    })

  );
  var d = jsonDecode( response.body);
  message = d["Message"]??d;
  uid = d["Data"]["UserId"].toString();
  
  print(response.body);
   return {uid:message};

} on Exception catch (e) {
  print(e);
   return {uid!:message};

}
      // print(response.body);

       
  }
  
  @override
  Future<Map<String, int>> userRegistration({required String email, required String pass, required String phone, required String name}) async {
   

  final Map<String, dynamic> data = {
    "Id": 1,
    "UserId": "UserId",
    "FirstName": "bfbfb",
    "Surname": "bfbf",
    "DateOfBirth": "DateOfBirth",
    "Address": "ngngngn",
    "Postcode": "fdfdf",
    "HomeNumber": "fdfd",
    "MobileNumber": "MobileNumber",
    "Email": "ngngngn",
    "ProfilePhoto": "ProfilePhoto",
    "ProfilePhotoFile": "tere.jpeg",
    "ProfilePhotoContent": "ProfilePhotoContent",
    "Disability": "ngng",
    "TrainerName": "ngng",
    "PreferTiming": true,
    "EmergencyContact": {
      "ContactName": "ngngn",
      "ContactNumber": "ngng",
      "Relationship": "nggngn"
    },
    "PhysicalActivityReadiness": {
      "UnableToExercise": true,
      "PhysicianAdvisedAgainst": true,
      "CardiacIssues": false,
      "RespiratoryDifficulties": false,
      "FaintingMigraines": false,
      "BoneJointMuscleIssues": false,
      "FamilyHeartDisease": true,
      "ChestPain": false,
      "HighBloodPressure": "--",
      "ElevatedCholesterol": true,
      "PrescribedMedication": false
    },
    "DoctorDetail": {
      "DoctorName": "ngngnn",
      "SurgeryName": "ngngn",
      "SurgeryAddress": "SurgeryAddress"
    }
  };

  try {
    final response = await http.post(
      Uri.parse(xtremerregistrationapi),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print(response.body);
      print('Data posted successfully');
    } else {
      print('Failed to post data. Status code: ${response.statusCode}');
    }
  
    return {"Data success":1000};
  } catch (e) {
    print('Error occurred while posting data: $e');
     return {"Data error":500};
  
}
  
  
  }
  
  @override
  Future<Map<UserEntity, int>> getAllUsers() async{
    //  final response =  await dio.get(getAllUsersApi);
    //       log('response ${response.data}');
    throw UnimplementedError();
  }
  



  @override
  Future<String> sendOTP(String otp,String mins,String phone)async{
    //send otp to api 
    AuthenticateUseCase useCase = AuthenticateUseCase();
    Uri url = Uri.parse("$otpapi?apikey=$smsapikey&numbers=$phone&message=${useCase.registerOTP(otp, mins)}&sender=CUBETN");
    final res = await http.post(url);

      return res.statusCode.toString();
  }

}