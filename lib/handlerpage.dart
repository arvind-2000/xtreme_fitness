import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_html/html.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'dart:html' as html;
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/dashboard.dart';

import 'config/const.dart';
import 'widgets/navbar.dart';
import 'widgets/navbarmember.dart';


class HandlerPage extends StatefulWidget {
  const HandlerPage({super.key});

  @override
  State<HandlerPage> createState() => _HandlerPageState();
}

class _HandlerPageState extends State<HandlerPage> {
  

  @override
  void initState() {
    super.initState();
    print("cookiees:: ${html.document.cookie}");
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Get.find<GetxAuthController>().authentications();
        Get.put(AddMemberController());
        Get.put(GetxPageController());
        
    Get.put(ManagementController());
      },
    );

    Get.put(ManagementController()).checkmember();
     
  }


  @override
  void dispose() {
    Get.find<AddMemberController>().onClose();
    Get.find<GetxAuthController>().disposelogin();
    
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxAuthController>(builder: (authctrl) {
      return GetBuilder<GetxPageController>(builder: (pagectrl) {
        return Scaffold(
          appBar: MediaQuery.sizeOf(context).width < mobilescreen
              ? AppBar(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  // title: TitleText(pagectrl.navpage==0?"Overview":pagectrl.navpage==3?"Services":pagectrl.navpage==5?"Plans":pagectrl.navpage==10?"Trainer":pagectrl.navpage==4?"Staff":pagectrl.navpage==2?"Add Member":pagectrl.navpage==6?"Xtremers":pagectrl.navpage==7?"Payments":""),
                  centerTitle: true,
                )
              : null,
          drawer: MediaQuery.sizeOf(context).width < mobilescreen
              ? Drawer(
                  surfaceTintColor: Colors.transparent,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: authctrl.ismember
                      ? NavBarMember(pagectrl: pagectrl, authctrl: authctrl)
                      : NavBar(
                          pagectrl: pagectrl,
                          authctrl: authctrl,
                        ),
                )
              : null,
          body: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1900),
              // authctrl.getuser==null? Center(child: CircularProgressIndicator(color: Colors.white,),):
              // child: SafeArea(child: PaymentStatusCard(callback: (){}))),
              child: const SafeArea(child: DashBoardScreen())),
        );
      });
    });
  }
}
