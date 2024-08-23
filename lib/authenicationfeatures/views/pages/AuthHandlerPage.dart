import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/forgotpasswordscreen.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/loginscreen.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/signup.dart';

import '../../../widgets/cardswithshadow.dart';

class AuthHandlerPage extends StatelessWidget {
  const AuthHandlerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxAuthController>(
      builder: (authctrl) {
        return Scaffold(
          body: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1500),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: authctrl.changeAuthindex==0? const LoginScreen():authctrl.changeAuthindex==1?const SignUpPage():const ForgotPassWordScreen(),
              )),
          ),
        );
      }
    );
  }
}