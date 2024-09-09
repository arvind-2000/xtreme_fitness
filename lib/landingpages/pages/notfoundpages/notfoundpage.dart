import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/landingpages/pages/footerpage.dart';
import 'package:xtreme_fitness/landingpages/pages/landingnavbarpage.dart';
import 'package:xtreme_fitness/widgets/cardborder.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

import '../../../widgets/card.dart';

class NotfoundPage extends StatelessWidget {
  const NotfoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      height: 800,
      width: double.maxFinite,
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 100,
          child: Image.asset('assets/logo1.png'),
          ),
          const HeadingText("Page Not found",size: 60,isbold: true,),
          const SizedBox(height:20),
          const Text("The page you are looking for does not exist.",style: TextStyle(fontSize: 24),),
          SizedBox(height: 20,),
          CardBorder(
            onpress: () {
              Get.toNamed('/home');
            },
            child: const Text("Go to Home")),
          
        
      
        ],
      ),
    );
    
  }
}