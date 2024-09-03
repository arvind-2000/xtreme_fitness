import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:xtreme_fitness/authentifeatures/config/apis.dart';
import 'package:xtreme_fitness/config/apis.dart';
import '../domain/domainrepositories.dart';
import '../domain/userentity.dart';
import 'usecasesimpl.dart';

class AuthenticationRepositoryImpl  implements AuthenticationRepository{
  
  @override
  Future<Map<String?,String>> emailAuthentication({required String email, required String pass}) async{
   
  print("in login auth");
  String? uid = "";
  String message = "";
    Uri url =Uri.parse("$api/api/Users/login");

    final query = {
      "userName":email,
      "passwordHash":pass
    };

      try {
  final response = await http.post(
    url,
    headers: {
      "Content-Type":"application/json"
    },
    body:jsonEncode({
      "userName":email,
      "passwordHash":pass
    })

  );

  if(response.statusCode>=200 && response.statusCode<300){
  var d = jsonDecode( response.body);
  

  message = d["Message"]??d;
  uid = d["Data"]["UserId"].toString();

  }else if (response.statusCode>=400 && response.statusCode<500){

  print(response.body);
  return {uid:response.body};

  }else if(response.statusCode>500){
      return {uid:"There is an internal Error\n We will get back soon."};
  }

} on Exception catch (e) {
  print(e);
 return {uid!:"Session tiome out\nTry again"};
}
      // print(response.body);
   return {uid:"Session time out.Try again"}; 
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
    AuthenticateUseCases useCase = AuthenticateUseCases();
    Uri url = Uri.parse("$otpapi?apikey=$smsapikey&numbers=$phone&message=${useCase.registerOTP(otp, mins)}&sender=CUBETN");
    final res = await http.post(url);

      return res.statusCode.toString();
  }
  
  @override
  Future<Map<UserEntity?, String>> getUserbyId(int id) async{
    print("In get bu id $id");
      Uri url =Uri.parse("$api/api/Users/$id");
          try {
  final response = await http.get(
    url,
    headers: {
      "Content-Type":"application/json"
    },
 
  );
    print(response.body);

  // Check if the request was successful
  if (response.statusCode >= 200 && response.statusCode<300) {
    print(response.body);
    return {UserEntity.fromJson(jsonDecode(response.body)):"found"};

}else{
  return {null:"User not found"};

} }
on Exception catch (e) {
  print(e);
   return {null:"Error in data parsing"};

}

  }
  
  @override
  Future<String> logout() async{
   
      Uri url =Uri.parse("$api/api/Users/logout");
          try {
  final response = await http.post(
    url,
    headers: {
      "Content-Type":"application/json"
    },
   
  );
  print(response.body);
     return response.body;
  }on Exception catch(e){
    print(e);
    
  }
  return "Error in logging out";
}

  @override
  Future<Map<int?, String>> getUserbyNumber(String number)async {
     print("In get user by number $number");
      Uri url =Uri.parse("$api/api/Users/GetByNumber?mobileNumber=$number");
          try {
  final response = await http.get(
    url,
    headers: {
      "Content-Type":"application/json"
    },
 
  );
    print(response.body);

  // Check if the request was successful
  if (response.statusCode >= 200 && response.statusCode<300) {
    print(response.body);
    return {int.tryParse(response.body)!>0?int.tryParse(response.body):null:"User Found"};

}else{
  if(response.statusCode >= 500){
  return {-1:"User not found or error with the connection"};
  }
  else{
     return {-3:"User not found or error with the connection"};
  }
} }
on Exception catch (e) {
  print(e);
   return {-3:"Error in data parsing"};

}

  }
  
  @override
  Future<Map<int?, String?>> changePass(int id, String password)async {
        Uri url = Uri.parse("$api/api/Users/$id");
         print("password  change status code user id $id    $password");
        try {
  var res = await http.put(url,body: jsonEncode({
  "Id": id,
  "PasswordHash":password,
  }),
  
     headers:{'Content-Type': 'application/json'}
  );
     print("password  change status code ${res.statusCode}");
    if(res.statusCode>=200 && res.statusCode<300){
 
        return {res.statusCode:"The password is successfully changed."};

    }else if(res.statusCode>=500){
    
        return {res.statusCode:"There is some internal error on our side.\n We will get back to you soon."};
    }else if(res.statusCode>=400 &&res.statusCode<500){
      
      return {res.statusCode:"Error in changing password. Try again later"};
    }else{
         return {res.statusCode:"Something went wrong. Check your interney connection\nTry again"};
    }

} on Exception catch (e) {
   return {0:"Error while changing your password.\n Try again after some time"};  
}
  }

  

}

