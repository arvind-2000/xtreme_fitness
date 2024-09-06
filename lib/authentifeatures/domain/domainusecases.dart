abstract class AuthUseCases{

  String? emailAuth(String email,String hint);
  String? nameAuth(String name,String hint);
  String? passwordAuth(String password);
String? phoneAuth(String password,String hint);
String? pincodeauth(String pincode,String hint);
  String? registerOTP(String otp,String mins);
  String? forgotpassOTP(String opt,String mins);


}