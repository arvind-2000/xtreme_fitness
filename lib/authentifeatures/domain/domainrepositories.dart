import 'userentity.dart';

abstract class AuthenticationRepository{

    // user authentication based on email id
    Future<Map<String?,String>> emailAuthentication({required String email,required String pass});
    Future<Map<String,int>> userRegistration({required String email,required String pass,required String phone,required String name});
    Future<Map<UserEntity,int>> getAllUsers();
    Future<Map<UserEntity?,String>> getUserbyId(int id);
    Future<Map<int?,String?>> changePass(int id,String password);
    Future<Map<int?,String>> getUserbyNumber(String number);
    Future<String> logout();
    Future<String> sendOTP(String otp,String mins,String phone);

}