import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/forgotpasswordscreen.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/loginscreen.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/signup.dart';

class AuthHandlerPage extends StatefulWidget {
  const AuthHandlerPage({super.key, this.index});
  final int? index;

  @override
  State<AuthHandlerPage> createState() => _AuthHandlerPageState();
}

class _AuthHandlerPageState extends State<AuthHandlerPage> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            if(widget.index!=null){
            Get.find<GetxAuthController>().changeAuthPage(widget.index??0);
          }
    },);
  }
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxAuthController>(
      
      builder: (authctrl) {
    
        return Scaffold(
          body: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1500),
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