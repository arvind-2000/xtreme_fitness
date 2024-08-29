import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/AuthHandlerPage.dart';
import 'package:xtreme_fitness/handlerpage.dart';

import '../../../authentifeatures/domain/domainrepositories.dart';
import '../../../authentifeatures/domain/userentity.dart';
import '../../../authentifeatures/models/repositoriesimpl.dart';
import '../../../authentifeatures/models/usermodel.dart';
import '../../../config/coreusecase.dart';

class GetxAuthController extends GetxController{

  ///login 0 signup 1 forgotpass 2
  int changeAuthindex = 0;

  bool _authentication = false;
  bool loginloading = false;

  UserEntity? _user;
  String? userid;
  AuthenticationRepository authrepo = AuthenticationRepositoryImpl();
  bool ismember = false;
  int? otp;
  bool otploading = false;
  ///change between login signup forgot password page [0] [1] [2]
  void changeAuthPage(int index){
    changeAuthindex = index;
    update();
  }

  Future<Map<bool, String>> authenticate(String email, String pass) async {
   loginloading = true;
    update();
    Map<String?, String> d;
    _user = UserEntity(id: 0, email: "", pass: "");

    try {
      debugPrint('in email authenticate');

      d = await authrepo.emailAuthentication(email: email,pass: pass);


      debugPrint(d.toString());
      
      if (d.isNotEmpty) {
        _authentication = d.entries.first.key!.isNotEmpty;
        print(d.entries.first.key);
         userid = d.entries.first.key;
       debugPrint(_authentication.toString());
       loginloading = false;
        _user = User(id: 0, email: email, pass: pass);
        if(_authentication){
            Get.to(()=>const HandlerPage());
        }
    loginloading = false;
     update();
        
        return {_authentication: d.entries.first.value};
        
      }

      
    } catch (e) {
      debugPrint('in sign up catch');
      _authentication = false;
      loginloading = false;
      update();
      return {_authentication: responseCode(0)};
    }
    loginloading = false;
    _authentication = false;
    update();
    return {_authentication:responseCode(1)};

 

  }


  void logout(){
    loginloading = true;
    update();
    Future.delayed(const Duration(seconds: 2)).then((v){
        _authentication = false;
      loginloading = false;
      update();
          if(_authentication==false){
    Get.offAll(()=>const AuthHandlerPage());

    }

    });

  }

  void signup(){

  }


  void sendotp(String phone){
    int rand = Random().nextInt(9000) + 1000;
    otp = rand;
    debugPrint(otp.toString());
  //  authrepo.sendOTP(rand.toString(), "10",phone);
    
  }

  bool confirmotp(String confirmotp){
    otploading = true;
    update();
    Timer(const Duration(seconds: 2),(){
      otploading = false;
      update();
    });
    return confirmotp == otp.toString();
  }
}