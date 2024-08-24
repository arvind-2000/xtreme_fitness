import 'userentity.dart';

abstract class AuthenticationRepository{

    // user authentication based on email id
    Future<Map<String?,String>> emailAuthentication({required String email,required String pass});
    Future<Map<String,int>> userRegistration({required String email,required String pass,required String phone,required String name});
    Future<Map<UserEntity,int>> getAllUsers();




}