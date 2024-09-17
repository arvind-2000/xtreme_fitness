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
  String? signuperror;
  String? forgotpasserrormessage;
  int? signups;
  bool _authentication = false;
  bool loginloading = false;
  String? loginerrortext;
  UserEntity? _user;
  UserEntity? get getuser => _user;
  String? userid;
  bool? numberexists;
  int? foruserId;
  AuthenticationRepository authrepo = AuthenticationRepositoryImpl();
  bool ismember = false;

  int? otp;
  bool otploading = false;
  bool? forgotpass;

  ///change between login signup forgot password page [0] [1] [2]
  void changeAuthPage(int index) {
    // changeAuthindex = index;
    // update();
  }

  
     

  Future<Map<bool, String>> authenticate(String email, String pass) async {
    loginloading = true;
    loginerrortext = null;
    update();
    Map<String?, String> d;
    _user = UserEntity(id: 0, userName: "", passwordHash: "");

    try {
      debugPrint('in email authenticate');

      d = await authrepo.emailAuthentication(email: email, pass: pass);

      debugPrint(d.toString());
      loginerrortext = d.entries.first.value;
      if (d.isNotEmpty) {
        if (d.entries.first.key != null) {
          _authentication = true;
          userid = d.entries.first.key;
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
        } else {
          _authentication = false;
          loginloading = false;
          update();
        }

        debugPrint(_authentication.toString());

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

  void logout() async {
    loginloading = true;
    update();
         authentications();
    await authrepo.logout().then(
      (value) {
        print(value);
      },
    ).then(
      (value) {},
    );
    Future.delayed(const Duration(seconds: 2)).then((v) {
      _authentication = false;
      loginloading = false;
      _user = null;
      authentications();
      // Get.offAllNamed('/home');
      update();
    });
  }

  void authentications() {
    if (_authentication == false || _user == null) {
      Get.offAllNamed("/home");
    }
  }

  void signup(String phone) async {
    signuperror = null;
    otploading = true;
    update();
    var d = await authrepo.getUserbyNumber(phone);

    if (d.entries.first.key == null) {
      numberexists = false;
      otploading = false;
      sendotp(phone);
    } else {
      if (d.entries.first.key! > 0) {
        signuperror =
            "A user with the number already exists.\nTry another number";
      } else {
        if (d.entries.first.key == -1) {
          signuperror =
              "There is an issue at our end.\nWe will get back to you as soon as possible.";
        } else {
          signuperror =
              "There  may be an issue with the connection or with the browser.\nTry again.";
        }
      }
      otploading = false;

      numberexists = true;
      otp = null;
      update();
    }
    otploading = false;
    update();
  }

  void passwordrenew(String phone) async {
    signuperror = null;
    otploading = true;
    update();
    var d = await authrepo.getUserbyNumber(phone);
    // if( d.entries.first.key!>0){
    if (d.entries.first.key != null && d.entries.first.key! > 0) {
      foruserId = d.entries.first.key;
      numberexists = true;
      otploading = false;

      sendotp(phone);
      update();
    } else {
      if (d.entries.first.key == null) {
        signuperror = "No user with the number exists.\nTry another number";
      } else {
        if (d.entries.first.key == -1) {
          signuperror =
              "There is an issue at our end.\nWe will get back to you as soon as possible.";
        } else {
          signuperror =
              "There  may be an issue with the connection or with the browser.\nTry again.";
        }
      }
      otploading = false;

      numberexists = true;
      otp = null;
      update();
    }
    otploading = false;
    update();
  }

  void sendotp(String phone) async {
    int rand = Random().nextInt(9000) + 1000;
    otp = rand;
    update();
    debugPrint(otp.toString());
     authrepo.sendOTP(rand.toString(), "10",phone);
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

  void signupclose() {
    otploading = false;
    otp = null;
    numberexists = null;
    signuperror = null;
    update();
  }


  void changepassword(String newpass) async {
    otploading = true;
    update();
    Future.delayed(const Duration(seconds: 2)).then(
      (value) {
        otploading = false;
        otp = null;

        update();
        // Get.offAllNamed("/login");
      },
    );
    // change pass
    //add api call here
    if (foruserId != null) {
      print("In password change");
      // Map<UserEntity?,String> d = await authrepo.getUserbyId(foruserId!);
      // if(d.entries.first.key!=null){

      Map<int?, String?> message =
          await authrepo.changePass(foruserId!, newpass);
      if (message.entries.first.key == 200) {
        forgotpass = true;
        update();
      } else {
        forgotpass = false;
        update();
      }
      forgotpasserrormessage = message.entries.first.value;
      update();
      // }
    }
  }

  void disposeforgotpass() {
    forgotpass = null;
    numberexists = null;
    otp = null;
    otploading = false;
    forgotpasserrormessage = null;
    update();
  }

  void disposelogin() {
    loginerrortext = null;
    loginloading = false;
    update();
  }
}
