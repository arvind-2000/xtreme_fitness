import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/dashboard.dart';

import 'widgets/navbar.dart';
import 'widgets/titletext.dart';

class HandlerPage extends StatefulWidget {
  const HandlerPage({super.key});

  @override
  State<HandlerPage> createState() => _HandlerPageState();
}

class _HandlerPageState extends State<HandlerPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxAuthController>(
      builder: (authctrl) {
        return GetBuilder<GetxPageController>(
          builder: (pagectrl) {
            return  Scaffold(
              appBar: MediaQuery.sizeOf(context).width<mobilescreen?AppBar(
                
                  title: TitleText(navtitles[pagectrl.navpage]),
            centerTitle: true,
              ):null,
              drawer:MediaQuery.sizeOf(context).width<mobilescreen? Drawer(
                
                backgroundColor: Theme.of(context).colorScheme.surface,
                surfaceTintColor: Theme.of(context).colorScheme.surface,
                child: NavBar(pagectrl:pagectrl, authctrl: authctrl,),
              ):null,
              body: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1400),
                  child:const SafeArea(child: DashBoardScreen())),
              ),
            );
          }
        );
      }
    );
  }
}