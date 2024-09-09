import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/editrenewxtremers/renewalforms.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/cardborder.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';
import 'package:xtreme_fitness/widgets/normaltext.dart';

class DashBoardMemberScreen extends StatelessWidget {
  const DashBoardMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: SizedBox(
             width:MediaQuery.sizeOf(context).width<mobilescreen? MediaQuery.sizeOf(context).width:350,
            child: CardwithShadow(
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadingText("Current Plan",color: Colors.white60,),
                SizedBox(height: 30,),
                     Text("Plan",style: TextStyle(fontSize: 16,color: Colors.white60)),
                   Text("Personal",style: TextStyle(fontSize: 20)),
                 SizedBox(height: 10,),
                   Text("Trainer",style: TextStyle(fontSize: 16,color: Colors.white60)),
                   Text("Gokul",style: TextStyle(fontSize: 20)),
                   SizedBox(height: 20,),
                Text("Start",style: TextStyle(fontSize: 16,color: Colors.white60)),
                SizedBox(height: 6,),
                Text("04/03/2024",style: TextStyle(fontSize: 20),),
                SizedBox(height: 10,),
                 Text("End",style: TextStyle(fontSize: 16,color: Colors.white60)),
                 SizedBox(height: 6,),
                 Text("04/03/2024",style: TextStyle(fontSize: 20),),
                 SizedBox(height: 30,),
                  Text("Remaining",style: TextStyle(fontSize: 16,color: Colors.white60),),
                SizedBox(height: 6,),
                Text("6 Days",style: TextStyle(fontSize: 28),),
                SizedBox(height: 20,),
                SizedBox(
                  width: double.maxFinite,
                  child: CardwithShadow(
                    onpress: (){
          Get.dialog(Dialog(
            backgroundColor: Colors.grey[700]!.withOpacity(0.6),
            child: SizedBox(
              height: 700,
              width: 800,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: RenewalForms(phonenumber: "1234567890",callback: () => Navigator.pop(context),),
              )),
          ));
          
                    },
                    color: Theme.of(context).colorScheme.secondary,
                    child: const Center(child: Text("Renew Plan"))),
                )
              ],
            ),
            
            ),
          ),
        ),

         Padding(padding: EdgeInsets.all(32,),child: SizedBox(
          width:MediaQuery.sizeOf(context).width<mobilescreen? MediaQuery.sizeOf(context).width:350,
          child: Cardonly(
            margin: EdgeInsets.zero,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingText("BMI Service"),
              SizedBox(height: 20,),
              NormalText(text: "Free one time BMI"),
              SizedBox(height: 30,),
              SizedBox(
                  width: double.maxFinite,
                child: CardBorder(
                  color: Colors.amber,
                  margin: EdgeInsets.zero,
                  child: Center(child: Text("Use Service"))),
                  
              ),
              SizedBox(height: 10,)
            ],
          )),
        ),)
      ],
    );
  }
}