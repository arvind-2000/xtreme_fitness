

import 'package:flutter/material.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/dialogswidget.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

import '../config/const.dart';
import '../managementfeatures/managementviews/controllers/pagecontroller.dart';
import '../managementfeatures/managementviews/screens/dashboard.dart';
import 'card.dart';

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
    return Container(
      // color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 70,
          
            child: SizedBox(
              height: 60,
      
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset("assets/logo1.png"),
              )),
       
          ),
          Container(
            height: 0.5,
            width:double.maxFinite,
                 color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5), 
      
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                      SizedBox(height: 16,),
                  Cardonly(
                      onpress: () {
                            if (MediaQuery.sizeOf(context).width < mobilescreen) {
                          drawers(context);
                        }
                        pagectrl.changeNavPage(0);
                      },
                      color: pagectrl.navpage == 0 ? Theme.of(context).colorScheme.secondary.withOpacity(0.3) : Colors.transparent,
                      margin:
                          const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                      child: const NavTiles(
                        icon: Icons.dashboard,
                        title: 'Dashboard',
                      )),
                      SizedBox(height: 16,),
                         Container(
            height: 0.5,
            width:double.maxFinite,
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5), 
          ),
                  // Cardonly(
                  //     onpress: () {
                  //           if (MediaQuery.sizeOf(context).width < mobilescreen) {
                  //         drawers(context);
                  //       }
                  //       pagectrl.changeNavPage(1);
                  //     },
                  //     color: pagectrl.navpage == 1 ? Theme.of(context).colorScheme.secondary.withOpacity(0.3) : Colors.transparent,
                  //     margin:
                  //         const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  //     child: const NavTiles(
                  //       icon: Icons.analytics,
                  //       title: 'Analytics',
                  //     )),
                  

                       Cardonly(
                      color: pagectrl.navpage == 3 ? Theme.of(context).colorScheme.secondary.withOpacity(0.3) : Colors.transparent,
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
      
                        Cardonly(
                      color: pagectrl.navpage == 5 ? Theme.of(context).colorScheme.secondary.withOpacity(0.3) : Colors.transparent,
                      onpress: () {
                        if (MediaQuery.sizeOf(context).width < mobilescreen) {
                          drawers(context);
                        }
              
                        pagectrl.changeNavPage(5);
                      },
                      margin:
                          const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      child: const NavTiles(
                        icon: Icons.design_services,
                        title: 'Plans',
                      )),
                                Container(
            height: 0.5,
            width:double.maxFinite,
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.3), 
          ),
                
                  Cardonly(
                      color: pagectrl.navpage == 10 ? Theme.of(context).colorScheme.secondary.withOpacity(0.3) : Colors.transparent,
                      onpress: () {
                            if (MediaQuery.sizeOf(context).width < mobilescreen) {
                          drawers(context);
                        }
                        pagectrl.changeNavPage(10);
                      },
                      margin:
                          const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      child: const NavTiles(
                        icon: Icons.person_add,
                        title: 'Add Trainer',
                      )),
            
                   Cardonly(
                      color: pagectrl.navpage == 4 ? Theme.of(context).colorScheme.secondary.withOpacity(0.3) : Colors.transparent,
                      onpress: () {
                            if (MediaQuery.sizeOf(context).width < mobilescreen) {
                          drawers(context);
                        }
                        pagectrl.changeNavPage(4);
                      },
                      margin:
                          const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      child: const NavTiles(
                        icon: Icons.person_add,
                        title: 'Add Staff',
                      )),
                 
                                      Container(
            height: 0.5,
            width:double.maxFinite,
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5), 
          ),
                  
             
                    Cardonly(
                      color: pagectrl.navpage == 2 ? Theme.of(context).colorScheme.secondary.withOpacity(0.3) : Colors.transparent,
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
                          Cardonly(
                      color: pagectrl.navpage == 6 ? Theme.of(context).colorScheme.secondary.withOpacity(0.3) : Colors.transparent,
                      onpress: () {
                        if (MediaQuery.sizeOf(context).width < mobilescreen) {
                          drawers(context);
                        }
              
                        pagectrl.changeNavPage(6);
                      },
                      margin:
                          const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      child: const NavTiles(
                      
                        icon: Icons.person_2,
                        title: 'Xtremers',
                      )),
              
                          Cardonly(
                      color: pagectrl.navpage == 7 ? Theme.of(context).colorScheme.secondary.withOpacity(0.3) : Colors.transparent,
                      onpress: () {
                        if (MediaQuery.sizeOf(context).width < mobilescreen) {
                          drawers(context);
                        }
              
                        pagectrl.changeNavPage(7);
                      },
                      margin:
                          const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      child: const NavTiles(
                        icon: Icons.settings,
                        title: 'Settings',
                      )),
                  
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
           Cardonly(
                    color: Colors.transparent,
                    onpress: () {
                          if (MediaQuery.sizeOf(context).width < mobilescreen) {
                        drawers(context);
                      }
                        showDialog(context: context, builder:(c)=>authctrl.loginloading?const SizedBox(
                          height: 300,
                          width: 400,
                          child: Cardonly(child: Center(child: CircularProgressIndicator(color: Colors.white,),))):PageDialog(
                          heights: 300,
                        no: () {
                           
                           
                            Navigator.pop(context);
                          
                     
                        },
                        yes: () {
                                 authctrl.logout();
                        },
                   
                          
                       child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.logout),
                              SizedBox(width: 5,),
                              HeadingText("Log Out",
                              size: 20,),
                            ],
                          ),
                          SizedBox(height: 30,),
                  
                          Center(child: Text("Are you sure you want to logout?\nPress yes to confirm",style: TextStyle(fontSize: 16,),textAlign: TextAlign.center,))
                        ],
                       )));
                    },
                    margin:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: const NavTiles(
                      icon: Icons.logout,
                      title: 'Log Out',
                    )),
         const SizedBox(height:30,)
        ],
      ),
    );
  }
}