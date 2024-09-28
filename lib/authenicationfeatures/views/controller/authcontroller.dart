import 'dart:async';
import 'dart:math';
import 'dart:html' as html;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/admission.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/managementrepoimpl.dart';

import '../../../authentifeatures/domain/domainrepositories.dart';
import '../../../authentifeatures/domain/userentity.dart';
import '../../../authentifeatures/models/repositoriesimpl.dart';
import '../../../config/coreusecase.dart';
import '../../../config/encrypt.dart';
import '../pages/dialogs/logindialog.dart';

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
  bool ismember = true;

  int? otp;
  bool otploading = false;
  bool? forgotpass;


@override
  void onInit() {
 
    super.onInit();
    authentications();
  }

  ///change between login signup forgot password page [0] [1] [2]
  void changeAuthPage(int index) {
    // changeAuthindex = index;
    // update();
  }

  void setdataforsession(String userid, bool ismem) async{
    ismember = ismem;
    userid = userid;
     Map<UserEntity?, String> v = await authrepo.getUserbyId(int.tryParse(userid) ?? 0);
            _user = v.entries.first.key;
    _authentication = true;
    print('${ismem} ${userid}');
    update();
  }



  Future<Map<bool, String>> authenticate(String email, String pass) async {
    loginloading = true;
    loginerrortext = null;
    update();
    Map<String?, String> d;
    _user = UserEntity(id: 0, userName: "", passwordHash: "");
    final SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      //print('in email authenticate');

      d = await authrepo.emailAuthentication(email: email, pass: pass);


      if (d.isNotEmpty) {
        if (d.entries.first.key != null) {
        
          userid = d.entries.first.key;
           loginerrortext = d.entries.first.value;
          if (userid != null) {
            ////print("In authentication check");
            Map<UserEntity?, String> v =
                await authrepo.getUserbyId(int.tryParse(userid!) ?? 0);
            _user = v.entries.first.key;
            if (_user != null) {

              _authentication = true;
             
              ////print("In authentication check member or not ${_user!.roleName}");
              ismember = _user!.roleName!.trim().toLowerCase() == "member";
              print("in authentication :${ismember} ");
              print('userid');
              // final encrypteduser = encryptData(userid!);
              pref.setString('key1', userid!);
              pref.setBool('key2', ismember);
              loginloading = false;
              update();
              Get.toNamed('/dashboard');
            } else {
              loginerrortext = "Unauthorized login";
              ////print("user null");
              _authentication = false;
              ismember = true;
              loginloading = false;
            }
          }
        } else {
          _authentication = false;
          ismember = true;
          loginloading = false;
          update();
        }

        //print(_authentication.toString());

        loginloading = false;
        update();

        return {_authentication: d.entries.first.value};
      }
    } catch (e) {
      //print('in sign up catch');
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
    // html.window.document.cookie = 'name=; path=/; expires=Thu, 01 Jan 1970 00:00:00 GMT;';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await authrepo.logout().then(
      (value) {
        _authentication = false;
        loginloading = false;
        _user = null;
        ismember = true;
        prefs.remove('key1');
        prefs.remove('key2');
        signupclose();
        disposelogin();
        disposeforgotpass();
        authentications();
        update();
      },
    );
    loginloading = false;
    update();
  }

  void authentications() async {
    print("in authentications");
          final SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<Admission?,int> res = await ManagementrepoImpl().viewadmission();
    print("addmission status code : ${res.entries.first.value}  ${prefs.containsKey('key1')}");
    if (res.entries.first.value>=200 && res.entries.first.value<300) {
      print("in authentication sharedpreferences");

      if (prefs.containsKey('key1') && prefs.containsKey('key2')) {
        
        setdataforsession(
       prefs.getString('key1')!, prefs.getBool('key2')!);
        update();
        // Get.offAllNamed('/dashboard');
      } else {
        Get.offAllNamed('/home');

      }
    } else {
      if(res.entries.first.value==401){
        Get.offAllNamed('/home');
        // Get.dialog(const LoginDialog());
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
    //print(otp.toString());
    authrepo.sendOTP(rand.toString(), "10", phone);
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
      ////print("In password change");
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

    // update();
  }
}
