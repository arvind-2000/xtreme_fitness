import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authentifeatures/provider/authprovider.dart';
import 'package:xtreme_fitness/authentifeatures/provider/screenprovider.dart';
import 'package:xtreme_fitness/config/const.dart';


import '../widgets/LoginPageToggle.dart';
import '../widgets/cards.dart';
import 'introscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routename = "/homescreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
    GlobalKey globalkey = GlobalKey();
class _HomeScreenState extends State<HomeScreen> {

    @override
  void initState() {
  
    super.initState();
       Get.put(AuthProvider(buildContext: context));
      Get.put(Screenprovider());

  }

  @override
  Widget build(BuildContext context) {
    // final pageprov = Provider.of<Screenprovider>(context);
    // final authprov = Provider.of<AuthProvider>(context);
    
    return  Scaffold(
      backgroundColor:Theme.of(context).colorScheme.background,
      body:SafeArea(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 600),
        padding: const EdgeInsets.all(16.0),
  
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints.expand(width: 1000,height: 620),
            child:MediaQuery.sizeOf(context).width > 600? CardsRound(
              color: Theme.of(context).colorScheme.primary,
              child: Row(
                children: [
                  MediaQuery.sizeOf(context).width < mobilescreen
                      ? const SizedBox()
                      : const Expanded(
                          flex: 3,
                          child: IntroScreen(),
                        ),
            
                   Expanded(
                    flex: 3,
                      child:Container(
        //                              decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //            begin: Alignment.bottomLeft,
        //     end: Alignment.topRight,
        //     colors: [
        //     brownishred2,
        //     brownishred
        //   ])
        // ),
                             child:   LogInToggle(cont: context,),
                      )

                   
                  ),
                ],
              ),
            ):LogInToggle(cont: context,),
          ),
        ),
      )),
    );
  }
}



