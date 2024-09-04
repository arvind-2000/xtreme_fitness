import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/dashboard.dart';
import 'package:xtreme_fitness/widgets/navbarmember.dart';
import 'widgets/navbar.dart';


class HandlerPage extends StatefulWidget {
  const HandlerPage({super.key});

  @override
  State<HandlerPage> createState() => _HandlerPageState();
}

class _HandlerPageState extends State<HandlerPage> {
  @override
  void initState() {

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Get.find<GetxAuthController>().authentications();
    },);

    Get.put(ManagementController());
    
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxAuthController>(
      builder: (authctrl) {
        return GetBuilder<GetxPageController>(
          builder: (pagectrl) {
            return  Scaffold(
              appBar: MediaQuery.sizeOf(context).width<mobilescreen?AppBar(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  // title: TitleText(navtitles[pagectrl.navpage]),
            centerTitle: true,
              ):null,
              drawer:MediaQuery.sizeOf(context).width<mobilescreen? Drawer(
                surfaceTintColor: Colors.transparent,
                backgroundColor: Theme.of(context).colorScheme.primary,

                child:authctrl.ismember? NavBarMember(pagectrl: pagectrl, authctrl: authctrl): NavBar(pagectrl:pagectrl, authctrl: authctrl,),
              ):null,
              body: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1900),
                // authctrl.getuser==null? Center(child: CircularProgressIndicator(color: Colors.white,),):
                child:SafeArea(child:DashBoardScreen())
                ),
            );
          }
        );
      }
    );
  }
}