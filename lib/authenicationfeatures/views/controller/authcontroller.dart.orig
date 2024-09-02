import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/handlerpage.dart';

import '../../../authentifeatures/domain/domainrepositories.dart';
import '../../../authentifeatures/domain/userentity.dart';
import '../../../authentifeatures/models/repositoriesimpl.dart';
import '../../../config/coreusecase.dart';

class GetxAuthController extends GetxController {
  ///login 0 signup 1 forgotpass 2
  int changeAuthindex = 0;
  String? cookies;

  bool _authentication = false;
  bool loginloading = false;

  UserEntity? _user;
  UserEntity? get getuser => _user;
  String? userid;

  bool? numberexists;
  AuthenticationRepository authrepo = AuthenticationRepositoryImpl();
  bool ismember = true;
  int? otp;
  bool otploading = false;

  ///change between login signup forgot password page [0] [1] [2]
  void changeAuthPage(int index) {
    changeAuthindex = index;
    update();
  }

  

  Future<Map<bool, String>> authenticate(String email, String pass) async {
    loginloading = true;
    update();
    Map<String?, String> d;
    _user = UserEntity(id: 0, userName: "", passwordHash: "");

    try {
      debugPrint('in email authenticate');

      d = await authrepo.emailAuthentication(email: email, pass: pass);

      debugPrint(d.toString());

      if (d.isNotEmpty) {
        if (d.entries.first.key != null) {
          _authentication = true;
          userid = d.entries.first.key;
        } else {
          _authentication = false;
        }

        debugPrint(_authentication.toString());

        if (userid != null) {
          print("In authentication check");
          Map<UserEntity?, String> v =
              await authrepo.getUserbyId(int.tryParse(userid!) ?? 0);
          _user = v.entries.first.key;

          update();
          if (_user != null) {
            print("In authentication check member or not ${_user!.roleName}");
            ismember = _user!.roleName!.trim().toLowerCase() == "member";
            update();
            Get.to(() => const HandlerPage());
          } else {
            print("user null");
          }
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
    return {_authentication: responseCode(1)};
  }

  void logout() async{
    loginloading = true;
    update();
      Future.delayed(const Duration(seconds: 2)).then((v) {
      _authentication = false;
      loginloading = false;
      _user = null;
      authentications();

      update();
   
    }); 
      //     await authrepo.logout().then((value) {
      //   print(value);
      // },).then((value) {
         
      // },);

  }

  void authentications() {
    if (_authentication == false || _user == null) {
      Get.offAllNamed("/home");
    }
  }

  void signup() {}

  void sendotp(String phone)async {
    otploading = true;
    update();
var d = await authrepo.getUserbyNumber(phone);

    if( d.entries.first.key==null){
        numberexists = false;
         otploading =false;
        int rand = Random().nextInt(9000) + 1000;
        otp = rand;
        update();
         debugPrint(otp.toString());
    //  authrepo.sendOTP(rand.toString(), "10",phone);



    }else{
    otploading =false;

      numberexists = true;
      otp = null;
      update();
    }
    otploading =false;
    update();
  }

  bool confirmotp(String confirmotp) {
    otploading = true;
    update();
    Timer(const Duration(seconds: 2), () {
      otploading = false;
      update();
    });
    return confirmotp == otp.toString();
  }


  void signupclose(){
      otploading = false;
      otp = null;
      numberexists = null;
      update();

  }
}
