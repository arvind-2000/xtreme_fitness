abstract class AuthUseCases{

  String? emailAuth(String email);
  String? nameAuth(String name);
  String? passwordAuth(String password);
String? phoneAuth(String password);
  String? registerOTP(String otp,String mins);
  String? forgotpassOTP(String opt,String mins);


}