import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/forgotpasswordscreen.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/loginscreen.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/signup.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

import '../../../widgets/cardswithshadow.dart';

class AuthHandlerPage extends StatefulWidget {
  const AuthHandlerPage({super.key, this.index});
  final int? index;

  @override
  State<AuthHandlerPage> createState() => _AuthHandlerPageState();
}

class _AuthHandlerPageState extends State<AuthHandlerPage> {

@override
  void initState() {
    
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
          backgroundColor: const Color.fromARGB(255, 17, 17, 17),
          body: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: SizedBox(
                height:700,
                child: CardwithShadow(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.zero,
                  isShadow: true,
                  color: Colors.black87,                
                  child: Row(
                    children: [
                    MediaQuery.sizeOf(context).width<=mobilescreen?SizedBox():  Expanded(child: Container(
                        margin: EdgeInsets.zero,
                        decoration: BoxDecoration(

    color: const Color.fromARGB(255, 17, 17, 17),
    gradient: LinearGradient(
      tileMode: TileMode.mirror,
       stops: const [0.4, 0.6,1],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
   
      colors: [
       const Color.fromARGB(255, 29, 28, 28),
       Theme.of(context).colorScheme.secondary.withOpacity(0.09),
        const Color.fromARGB(255, 17, 17, 17).withOpacity(0.3),
    ])
                        ),
                    
                    
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 100,
                              width: 100,
                              child: Image.asset("assets/logo1.png"),
                              ),
                              SizedBox(height: 20,),
                              HeadingText("X T R E M E\nF I T N E S S",size: 30,)
                            ],
                        ),
                        

                      )),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: authctrl.changeAuthindex==0? const LoginScreen():authctrl.changeAuthindex==1?const SignUpPage():const ForgotPassWordScreen(),
                        ),
                      ),
                    ],
                  ),
                ).animate().slideY(begin: 1,end: 0,duration: Durations.extralong1).fadeIn(),
              )),
          ),
        );
      }
    );
  }
}