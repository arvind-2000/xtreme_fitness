

import '../config/regex.dart';
import '../domain/domainusecases.dart';


class AuthenticateUseCases implements AuthUseCases{
  @override
  String? emailAuth(String data) {
      if(data.trim().isEmpty){
          return "Email empty";
      }

      // log(' email authentication ${email.hasMatch(data)}');
      return email.hasMatch(data)?null:"Email should XX@XXXXX.XXX";
  }
  
  @override
  String? passwordAuth(String data) {

      if(data.trim().length<5 || data.trim().length>10){
          return "Password must be between 8  to 10 characters.";
      }
      return null;
        // log(' password auth ${passregex.hasMatch(data)}');
        //  return passregex.hasMatch(data)?null:"should contain alphanumeric, special characters";
  }
  
  @override
  String? nameAuth(String name) {
       if(name.trim().isEmpty)
       {
          return "Name empty";

       }
        return nameregex.hasMatch(name)?null:"Name must be alphabet";
  }
  
  @override
  String? phoneAuth(String phone) {
   if(phone.trim().isEmpty)
       {
          return "Phone number empty";

       }
        return phoneregex.hasMatch(phone)?null:"Phone must have 10 digits";
  }
  
  @override
 String? forgotpassOTP(String otp, String mins) {
   return "MOBEDS: One-time-Password (OTP) to access the MOBEDS Recruitment Portal is $otp valid till $mins mins. CubeTen technologies";
  }
  
  @override
  String? registerOTP(String otp, String mins) {
      return "MOBEDS: One-time-Password (OTP) to access the MOBEDS Recruitment Portal is $otp valid till 5 mins. CubeTen technologies";
  }



}