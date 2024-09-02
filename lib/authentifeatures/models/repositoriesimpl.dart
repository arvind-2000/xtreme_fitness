import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:xtreme_fitness/authentifeatures/config/apis.dart';
import 'package:xtreme_fitness/config/apis.dart';
import 'package:dio/dio.dart';
import 'dart:html' as html;
import '../domain/domainrepositories.dart';
import '../domain/userentity.dart';
import 'usecasesimpl.dart';

class AuthenticationRepositoryImpl  implements AuthenticationRepository{
  
//   @override
//   Future<Map<String?,String>> emailAuthentication({required String email, required String pass}) async{
   
//   print("in login auth");
//   String? uid = "";
//   String message = "login error";
//     Uri url =Uri.parse("$api/api/Users/login");

//     final query = {
//       "userName":email,
//       "passwordHash":pass
//     };

//       try {
//   final response = await http.post(
//     url,
//     headers: {
//       "Content-Type":"application/json"
//     },
//     body:jsonEncode({
//       "userName":email,
//       "passwordHash":pass
//     })

//   );


//   var d = jsonDecode( response.body);
//   message = d["Message"]??d;
//   uid = d["Data"]["UserId"].toString();
  
//   print(response.body);
//    return {uid:message};

// } on Exception catch (e) {
//   print(e);
//    return {uid!:message};

// }
//       // print(response.body);

       
//   }



  final Dio _dio = Dio();

  // Store cookies in a map
  Map<String, String> _cookies = {};

  // Function to save cookies from response headers
  void _saveCookies(Response response) {
    if (response.headers['Set-Cookie'] != null) {
      print("set cookie");  
      for (var cookie in response.headers['Set-Cookie']!) {
        // Split cookies and parse them
        var cookieParts = cookie.split(';');
        for (var part in cookieParts) {
          var keyValue = part.split('=');
          if (keyValue.length == 2) {
            _cookies[keyValue[0].trim()] = keyValue[1].trim();
          }
        }
      }
    }else{
          print("no cookie"); 
    }
  }

  // Function to create a cookie header for subsequent requests
  String _getCookieHeader() {
    return _cookies.entries.map((e) => '${e.key}=${e.value}').join('; ');
  }

  @override
  Future<Map<String?, String>> emailAuthentication({
    required String email,
    required String pass,
  }) async {
    print("In login auth");
    String? uid = "";
    String message = "login error";
// Replace with your actual API base URL
    Uri url = Uri.parse("$api/api/Users/login");

    try {
      // Request payload
      final query = {
        "userName": email,
        "passwordHash": pass,
      };
      var headers = {
  'Content-Type': 'application/json',
  'Cookie': '.AspNetCore.Cookies=CfDJ8N571pgN-xRBq0zBu820fVB_gwGOd0-jCUdhW9sJHNciQgB1soQqnjyZfu8gzpkjoMKCoRlgqXzuod_Geaoj8tc_69pNsb0_1H81HfDMuO-RIFeHMHSW5H5_2y-3N7AnLMj-rHq3MhSPxKG8klaCrOedlxoKF92VV3IJ6IGAnM1oLdXQot_emXKaykcIcaXMU6lWrYuhLwuvBctYOZT_nbXSKmZ06LWo0Oq96GjeO1axwoO5YlqEFLenRXpwlcCOGdChKEOU5BN8aACY-HRYL_4reEpwPtZCfxxaNnAFiIGNFXwnl28oUGFyDtp8cG39zXuGFvXRijalSmJ9ksCO5uRmNqUwR-GeMywU2ukF8I0dMazvXhmzEythpk2O1IQNuzfl8yPreSz_5wWXs-ChVOo'

};
      // Make the POST request using Dio
      final response = await _dio.post(
        
        url.toString(),
        options: Options(
          headers: headers,
        ),
        data: query,
      );

      // Save cookies from the response
      _saveCookies(response);

      // Handling the response
      if (response.statusCode == 200) {
        var data = response.data;
        message = data["Message"] ?? "Login successful";
        uid = data["Data"]["UserId"]?.toString();
        print(response.data);
      } else {
        message = response.data['Message'] ?? "Unexpected error";
      }

      return {uid: message};
    } on DioError catch (e) {
      print("DioError: ${e.message}");
      if (e.response != null) {
        message = e.response?.data['Message'] ?? "Error occurred";
      } else {
        message = e.message!;
      }
      return {uid: message};
    } catch (e) {
      print("Exception: $e");
      return {uid: message};
    }


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
  return {null:"User not found or error with the connection"};

} }
on Exception catch (e) {
  print(e);
   return {null:"Error in data parsing"};

}

  }
}

