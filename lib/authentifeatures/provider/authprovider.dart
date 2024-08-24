import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:xtreme_fitness/authentifeatures/models/repositoriesimpl.dart';
import 'package:xtreme_fitness/authentifeatures/models/usermodel.dart';
import 'package:xtreme_fitness/authentifeatures/pages/homescreen.dart';
import 'package:xtreme_fitness/handlerpage.dart';

import '../../config/coreusecase.dart';
import '../domain/domainrepositories.dart';
import '../domain/userentity.dart';

class AuthProvider  extends GetxController {
  UserEntity? _user;
  bool _isAuth = false;

  bool isLogging = false;
  bool get getAuth=>_isAuth;
  AuthenticationRepository authrepo = AuthenticationRepositoryImpl();
   final  BuildContext buildContext;
  AuthProvider({required this.buildContext});


  Future<Map<bool, String>> authenticateLogin(String email, String pass) async {
    isLogging = true;
    update();
    Map<String?, String> d;
    _user = UserEntity(id: 0, email: "", pass: "");

    try {
      log('in email authenticate');
      d = await authrepo.emailAuthentication(email: email,pass: pass);
      log(d.toString());
      if (d.isNotEmpty) {
        _isAuth = d.entries.first.key!.isNotEmpty;
        print(d.entries.first.key);
        log(_isAuth.toString());
        isLogging = false;
        _user = User(id: 0, email: email, pass: pass);
        if(_isAuth){
            Get.to(()=>const HandlerPage());
        }
     
     update();
        
        return {_isAuth: d.entries.first.value};
        
      }

      
    } catch (e) {
      log('in sign up catch');
      _isAuth = false;
      isLogging = false;
      update();
      return {_isAuth: responseCode(0)};
    }
    isLogging = false;
    _isAuth = false;
    update();
    return {_isAuth:responseCode(1)};

 

  }


  Future<bool> userReg(
      String email, String name, String pass, String phone) async {
    Map<String, int> d;
    _user = UserEntity(id: 0, email: "", pass: "");

    try {
      d = await authrepo.userRegistration(
          email: email, pass: pass, phone: phone, name: name);
      if (d.isNotEmpty) {
        // _user = d.entries.first.key;
       update();
        return d.entries.first.value==1000;
      }
    } catch (e) {
      return false;
    }

    return false;
  }

    void logout(){

        _isAuth = false;
        
        isLogging = false;
          Get.to(()=>const HomeScreen());
        _user = null;
       update();

    }

}
