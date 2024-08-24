import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../authenicationfeatures/views/controller/authcontroller.dart';
import '../../widgets/card.dart';
import '../../widgets/cardborder.dart';
import '../../widgets/cardswithshadow.dart';
import '../controllers/getxcontrol.dart';

class LandingNavBar extends StatelessWidget {
  const LandingNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return GetBuilder<GetxLandingcontroller>(
      builder: (landingctrl) {
        return GetBuilder<GetxAuthController>(
          builder: (authctrl) {
            return Container(height: 80,
            color: Color.fromARGB(255, 6, 6, 6),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                  
                    children: [
                        const SizedBox(width: 100,),
                     Expanded(
                       child: Row(
                          children: [
                            InkWell(
                              onTap: (){
                                landingctrl.changelandingpage(0);
                                   Get.toNamed("/home");
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical:16.0),
                                child: Image.asset("assets/logo2.png"),
                              ),
                            ),
                            const SizedBox(width: 50,),
                            Cardonly(
                              color: landingctrl.page == 1?Theme.of(context).colorScheme.secondary:Colors.transparent,
                              onpress: (){
                                  landingctrl.changelandingpage(1);
                                Get.toNamed("/pricing");
                              },
                              child: Text("Pricing",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSecondary),)),
                            const SizedBox(width: 30,),
                            Cardonly(
                                       color: landingctrl.page == 2?Theme.of(context).colorScheme.secondary:Colors.transparent,
                              onpress: (){
                                  landingctrl.changelandingpage(2);
                                Get.toNamed("/services");
                              },
                              child: Text("Services",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,  color: Theme.of(context).colorScheme.onSecondary),)),
                            const SizedBox(width: 30,),
                             Text("Gallery",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSecondary),),
                          ],
                        ),
                     ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CardBorder(
                              onpress: (){
                                authctrl.changeAuthPage(0);
                                Get.toNamed("/login");
                              },
                              color: Colors.red[800],
                              child:  Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text("Log In",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.red[800],),),
                            ), 
                            ),
                            const SizedBox(width: 10,),
                            CardwithShadow(
                            
                              onpress: (){
                                authctrl.changeAuthPage(1);
                                Get.toNamed("/signup");
                              },
                              color: Colors.red[800],
                             padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 8),
                              child:  const Text("Sign Up",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),), 
                            ),
                                               
                                            
                            
                          ],
                        ),
                      ),
                             const SizedBox(width: 100,),
                    ],
                  ),
                ),
              // Divider(
              //   height: 1,
              //   color: Colors.grey[300],
              // )
              ],
            ),);
          }
        );
      }
    );
  }
}