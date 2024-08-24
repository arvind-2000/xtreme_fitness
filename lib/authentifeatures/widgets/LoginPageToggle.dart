//Toggling between log in signUp and Forgot Password page
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../pages/forgotpasswordscreen.dart';
import '../pages/loginscreen.dart';
import '../pages/signup.dart';
import '../provider/screenprovider.dart';

class LogInToggle extends StatelessWidget {
  const LogInToggle({super.key,
  required this.cont
  });
  final BuildContext cont;
  @override
  Widget build(BuildContext context) {
  

    return GetBuilder<Screenprovider>(
      builder: (pagectrl) {
        return SizedBox(
          child: pagectrl.pageselect==0? LoginScreen(context: cont ,):pagectrl.pageselect==2?const ForgotPassWordScreen(): SignUpPage(cont: cont,),
        );
      }
    );
  }
}