import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/dialogs/logindialog.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/managementrepoimpl.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

import '../../../authentifeatures/domain/domainrepositories.dart';
import '../../../authentifeatures/domain/userentity.dart';
import '../../../authentifeatures/models/repositoriesimpl.dart';
import '../../../config/coreusecase.dart';
import '../../../managementfeatures/managementdomain/entities.dart/roles.dart';
import '../../../widgets/card.dart';

class GetxAuthController extends GetxController {
  ///login 0 signup 1 forgotpass 2
  int changeAuthindex = 0;
  String? cookies;
  String? signuperror;
  String? forgotpasserrormessage;
  int? signups;
  bool _authentication = false;
  bool get getauthentication => _authentication;
  bool loginloading = false;
  String? loginerrortext;
  UserEntity? _user;
  UserEntity? get getuser => _user;
  String? userid;
  int _timertext = 120; // Timer starts at 120 seconds (2 minutes)
  int get timertext => _timertext;
  Timer? _timer;
  bool _isButtonActive = false;
  bool get isButtonActive => _isButtonActive;

  bool _isauthloading = false;
  bool get isauthloading => _isauthloading;

  bool? numberexists;
  int? foruserId;
  AuthenticationRepository authrepo = AuthenticationRepositoryImpl();
  bool ismember = true;
  String _confirmotp = '';
  String get confirmotptext => _confirmotp;
  int? otp;
  bool otploading = false;
  bool? forgotpass;
  // bool isauthloading.obx = true;
  ///change between login signup forgot password page [0] [1] [2]
  void changeAuthPage(int index) {
    // changeAuthindex = index;
    // update();
  }

  void getonfirmotp(String conotp) {
    _confirmotp = conotp;
    update();
  }

  void startTimer() {
    _isButtonActive = false;
    _timertext = 120; // Reset timer to 2 minutes
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timertext == 0) {
        _isButtonActive = true; // Activate the "Resend" button
        update();
        _timer!.cancel();
      } else {
        _timertext--;
        update();
      }
    });
  }

  String getFormattedTime(int seconds) {
    if (seconds >= 60) {
      // Display mm:ss format when more than 60 seconds remain
      int minutes = seconds ~/ 60;
      int remainingSeconds = seconds % 60;
      return '${minutes.toString().padLeft(2, '0')} min:${remainingSeconds.toString().padLeft(2, '0')} sec';
    } else {
      // Display only seconds when less than 60 seconds remain
      return '$seconds sec';
    }
  }

  void setdataforsession(String userid) async {
    // ismember = null;
    // update();
    userid = userid;
    Map<UserEntity?, String> v =
        await authrepo.getUserbyId(int.tryParse(userid) ?? 0);
    _user = v.entries.first.key;
    ismember = _user!.roleName!.trim().toLowerCase() == "member";
    _authentication = true;
    _isauthloading = false;

    //print('${ismem} ${userid}');
    update();
  }

  void homepage() {
    ismember = true;
    _user = null;
  }

  Future<Map<bool, String>> authenticate(String email, String pass) async {
    loginloading = true;
    loginerrortext = null;
    update();
    Map<String?, String> d;
    _user = UserEntity(id: 0, userName: "", passwordHash: "");
    final SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      ////print('in email authenticate');

      d = await authrepo.emailAuthentication(email: email, pass: pass);

      // debugPrint(d.toString());
      loginerrortext = d.entries.first.value;
      if (d.isNotEmpty) {
        if (d.entries.first.key != null) {
          _authentication = true;
          userid = d.entries.first.key;

          if (userid != null) {
            pref.setString('key1', userid!);
            // pref.setBool('key2', ismember!);

            loginerrortext = d.entries.first.value;
            loginloading = false;
            update();
            Get.offAllNamed('/dashboard');
          }
        } else {
          _authentication = false;
          ismember = true;
          loginloading = false;
          update();
        }

        ////print(_authentication.toString());

        loginloading = false;
        update();

        return {_authentication: d.entries.first.value};
      }
    } catch (e) {
      ////print('in sign up catch');
      _authentication = false;
      ismember = true;
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
    loginerrortext = null;
    update();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await authrepo.logout();
    } on Exception catch (e) {
      // TODO
    }
    authentications();

    prefs.remove('key1');
    prefs.remove('key2');
  }

  void authentications() async {
    _isauthloading = true;
    update();
    ismember = true;
    //print("in authentications");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<List<Role>, int> request = await ManagementrepoImpl().getRoles();
    //print("${request.status}");
    //print("addmission status code : ${res.entries.first.value}  ${prefs.containsKey('key1')}");
    if (request.entries.first.value >= 200 &&
        request.entries.first.value < 300) {
      _authentication = true;
      // print("in authentication sharedpreferences res");
      _isauthloading = false;
      update();

      if (prefs.containsKey('key1')) {
        setdataforsession(prefs.getString('key1')!);

        Get.offAllNamed('/dashboard');
      } else {
        ismember = false;

        Get.offAllNamed('/home');
      }
    } else {
      _authentication = false;
      loginloading = false;
      _user = null;
      // ismember = true;
      signupclose();
      disposelogin();
      disposeforgotpass();
      if (request.entries.first.value == 401 ||
          request.entries.first.value == 0) {
        if (prefs.containsKey('key1')) {
          Get.dialog(
              barrierDismissible: false,
              Dialog(
                child: SizedBox(
                  height: 300,
                  width: 400,
                  child: Center(
                    child: CardwithShadow(
                      margin: EdgeInsets.zero,
                      color: Colors.grey[900],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const HeadingText("Session Expired"),
                          const SizedBox(
                            height: 20,
                          ),
                          const Expanded(
                              child: Center(
                                  child: Text(
                            "The session has expired or you may not be logged in.",
                            textAlign: TextAlign.center,
                          ))),
                          const SizedBox(
                            height: 30,
                          ),
                          CardwithShadow(
                              onpress: () {
                                prefs.remove('key1');
                                prefs.remove('key2');
                                Get.offAllNamed('/home');
                                Get.dialog(const LoginDialog(
                                  signupdialog: false,
                                ));
                              },
                              child: const Text("Log In Again")),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        } else {
          print('coming hommmmm');

          Get.offAllNamed('/home');
          _isauthloading = false;
          update();
        }
      } else {
        _isauthloading = false;
        update();
        if (!prefs.containsKey('key1')) {
          Get.offAllNamed('/home');
        }
      }
    }
  }

  void authenticationsforsession() async {
    //print("in authentications");

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<List<Role>, int> request = await ManagementrepoImpl().getRoles();
    //print("${request.status}");
    //print("addmission status code : ${res.entries.first.value}  ${prefs.containsKey('key1')}");
    if (request.entries.first.value >= 200 &&
        request.entries.first.value < 300) {
      _authentication = true;
      // print("in authentication sharedpreferences res");

      // if (prefs.containsKey('key1') && prefs.containsKey('key2')) {

      //   setdataforsession(
      //  prefs.getString('key1')!, prefs.getBool('key2')!);
      // } else {
      //   Get.offAllNamed('/home');

      // }
    } else {
      if (request.entries.first.value == 401 ||
          request.entries.first.value == 0) {
        _authentication = false;
        loginloading = false;
        _user = null;
        // ismember = true;
        signupclose();
        disposelogin();
        disposeforgotpass();
        if (prefs.containsKey('key1')) {
          Get.dialog(
              barrierDismissible: false,
              Dialog(
                child: SizedBox(
                  height: 300,
                  width: 400,
                  child: Center(
                    child: Cardonly(
                      color: Colors.grey[900],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const HeadingText("Session Expired"),
                          const SizedBox(
                            height: 20,
                          ),
                          const Expanded(
                              child: Center(
                                  child: Text(
                            "The session has expired or you may not be logged in.",
                            textAlign: TextAlign.center,
                          ))),
                          const SizedBox(
                            height: 30,
                          ),
                          CardwithShadow(
                              onpress: () {
                                prefs.remove('key1');
                                prefs.remove('key2');
                                Get.offAllNamed('/home');
                                Get.dialog(const LoginDialog(
                                  signupdialog: false,
                                ));
                              },
                              child: const Text("Log In Again")),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        }
        // else {
        //   Get.offAllNamed('/home');
        // }
      } else {
        if (!prefs.containsKey('key1')) {
          Get.offAllNamed('/home');
        }
      }
    }
  }

  Future<void> authenticationsforReload() async {
    _isauthloading = true;
    update();

    //print("in authentications");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<List<Role>, int> request = await ManagementrepoImpl().getRoles();
    //print("${request.status}");
    //print("addmission status code : ${res.entries.first.value}  ${prefs.containsKey('key1')}");
    if (request.entries.first.value >= 200 &&
        request.entries.first.value < 300) {
      _authentication = true;
      // print("in authentication sharedpreferences res");

      if (prefs.containsKey('key1')) {
        setdataforsession(prefs.getString('key1')!);
      } else {
        Get.offAllNamed('/home');
        _isauthloading = false;
        update();
      }
    } else {
      if (request.entries.first.value == 401 ||
          request.entries.first.value == 0) {
        _authentication = false;
        loginloading = false;
        _isauthloading = false;
        update();

        _user = null;
        // ismember = true;
        signupclose();
        disposelogin();
        disposeforgotpass();
        if (prefs.containsKey('key1')) {
          Get.dialog(
              barrierDismissible: false,
              Dialog(
                child: SizedBox(
                  height: 300,
                  width: 400,
                  child: Center(
                    child: Cardonly(
                      color: Colors.grey[900],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const HeadingText("Session Expired"),
                          const SizedBox(
                            height: 20,
                          ),
                          const Expanded(
                              child: Center(
                                  child: Text(
                            "The session has expired or you may not be logged in.",
                            textAlign: TextAlign.center,
                          ))),
                          const SizedBox(
                            height: 30,
                          ),
                          CardwithShadow(
                              onpress: () {
                                prefs.remove('key1');
                                prefs.remove('key2');
                                Get.offAllNamed('/home');
                                Get.dialog(const LoginDialog(
                                  signupdialog: false,
                                ));
                              },
                              child: const Text("Log In Again")),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        }
        // else {
        //   Get.offAllNamed('/home');
        // }
      } else {
        _isauthloading = false;
        update();

        if (!prefs.containsKey('key1')) {
          Get.offAllNamed('/home');
        }
      }
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
    print(otp.toString());
    authrepo.sendOTP(rand.toString(), "10", phone);
  }

  bool confirmotp() {
    otploading = true;
    update();
    Timer(const Duration(seconds: 2), () {
      otploading = false;
      update();
    });
    return _confirmotp == otp.toString();
  }

  void signupclose() {
    otploading = false;
    otp = null;
    numberexists = null;
    signuperror = null;
    _timer?.cancel();
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
      //////print("In password change");
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
    _timer?.cancel();
    signuperror = null;
  }

  void disposelogin() {
    loginerrortext = null;
    loginloading = false;

    // update();
  }
}
