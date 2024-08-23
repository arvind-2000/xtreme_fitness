import 'package:flutter/material.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';

import '../config/const.dart';
import '../managementfeatures/managementviews/controllers/pagecontroller.dart';
import '../managementfeatures/managementviews/screens/dashboard.dart';
import 'cardswithshadow.dart';
import 'titletext.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.pagectrl, required this.authctrl,
  });
  final GetxPageController pagectrl;
  final GetxAuthController authctrl;

  void drawers(BuildContext context) {
    if (Scaffold.of(context).isDrawerOpen) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
 
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                CardwithShadow(
                    onpress: () {
                          if (MediaQuery.sizeOf(context).width < mobilescreen) {
                        drawers(context);
                      }
                      pagectrl.changeNavPage(0);
                    },
                    color: pagectrl.navpage == 0 ? null : Colors.transparent,
                    margin:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: const NavTiles(
                      icon: Icons.dashboard,
                      title: 'Dashboard',
                    )),
                CardwithShadow(
                    onpress: () {
                          if (MediaQuery.sizeOf(context).width < mobilescreen) {
                        drawers(context);
                      }
                      pagectrl.changeNavPage(1);
                    },
                    color: pagectrl.navpage == 1 ? null : Colors.transparent,
                    margin:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: const NavTiles(
                      icon: Icons.analytics,
                      title: 'Analytics',
                    )),
                     CardwithShadow(
                    color: pagectrl.navpage == 2 ? null : Colors.transparent,
                    onpress: () {
                          if (MediaQuery.sizeOf(context).width < mobilescreen) {
                        drawers(context);
                      }
                      pagectrl.changeNavPage(2);
                    },
                    margin:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: const NavTiles(
                      icon: Icons.person_add,
                      title: 'Add Staff',
                    )),
            
                CardwithShadow(
                    color: pagectrl.navpage == 2 ? null : Colors.transparent,
                    onpress: () {
                          if (MediaQuery.sizeOf(context).width < mobilescreen) {
                        drawers(context);
                      }
                      pagectrl.changeNavPage(2);
                    },
                    margin:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: const NavTiles(
                      icon: Icons.person_add,
                      title: 'Add Member',
                    )),
            
          CardwithShadow(
                    color: pagectrl.navpage == 3 ? null : Colors.transparent,
                    onpress: () {
                      if (MediaQuery.sizeOf(context).width < mobilescreen) {
                        drawers(context);
                      }
            
                      pagectrl.changeNavPage(3);
                    },
                    margin:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: const NavTiles(
                      icon: Icons.design_services,
                      title: 'Services',
                    )),  

                      CardwithShadow(
                    color: pagectrl.navpage == 3 ? null : Colors.transparent,
                    onpress: () {
                      if (MediaQuery.sizeOf(context).width < mobilescreen) {
                        drawers(context);
                      }
            
                      pagectrl.changeNavPage(3);
                    },
                    margin:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: const NavTiles(
                      icon: Icons.design_services,
                      title: 'Plans',
                    )),      
                const Divider(),
            
           
            
                        CardwithShadow(
                    color: pagectrl.navpage == 3 ? null : Colors.transparent,
                    onpress: () {
                      if (MediaQuery.sizeOf(context).width < mobilescreen) {
                        drawers(context);
                      }
            
                      pagectrl.changeNavPage(3);
                    },
                    margin:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: const NavTiles(
                      icon: Icons.design_services,
                      title: 'Renewal',
                    )),
            
                        CardwithShadow(
                    color: pagectrl.navpage == 3 ? null : Colors.transparent,
                    onpress: () {
                      if (MediaQuery.sizeOf(context).width < mobilescreen) {
                        drawers(context);
                      }
            
                      pagectrl.changeNavPage(3);
                    },
                    margin:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: const NavTiles(
                      icon: Icons.design_services,
                      title: 'Edit Member',
                    )),
                
              ],
            ),
          ),
        ),
        const SizedBox(height: 10,),
         CardwithShadow(
                  color: Colors.transparent,
                  onpress: () {
                        if (MediaQuery.sizeOf(context).width < mobilescreen) {
                      drawers(context);
                    }
                      showDialog(context: context, builder:(c)=>AlertDialog(backgroundColor: Theme.of(context).colorScheme.primary,
                      
                        title: const TitleText("Log Out",size: 16,),
                      content: authctrl.loginloading?const CircularProgressIndicator(): const Text('Are you sure you want to logout ?'),
                      actions: [
                        CardwithShadow(
                                padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 16),
                          color: Colors.green,
                          onpress: (){
                          Navigator.pop(context);
                          },
                          child: Text("No")),
                          SizedBox(width: 20,),
                           CardwithShadow(
                             padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 16),
                          color: Theme.of(context).colorScheme.error,
                          onpress: (){
                          //do logouts
                          authctrl.logout();
                          },
                          child: const Text("Yes")),
                      ],));
                  },
                  margin:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: const NavTiles(
                    icon: Icons.logout,
                    title: 'Log Out',
                  )),
       const SizedBox(height:30,)
      ],
    );
  }
}