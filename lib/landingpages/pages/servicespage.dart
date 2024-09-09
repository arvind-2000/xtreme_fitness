
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../config/const.dart';
import '../../widgets/cardborder.dart';
import '../../widgets/cardswithshadow.dart';
import '../../widgets/gridviewwidget.dart';
import '../../widgets/headingtext.dart';
import '../controllers/getxcontrol.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width;
    return  GetBuilder<GetxLandingcontroller>(
      builder: (managementcontroller) {
        return  Row(
          children: [
            SizedBox(width:size<=mobilescreen?16: 100,),
            Expanded(
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
             
             Container(
               
               height: 300,
               
               child: Center(child: HeadingText("Services",size: size<=mobilescreen?30:60,isbold: true,))),
       
              Center(
                child: GridViewWidget(size: size,children:  managementcontroller.getallservices.asMap().entries.map((e) => CardwithShadow(
                  padding: EdgeInsets.all(32),
                margin: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   HeadingText("${e.key<9?"0":""}${e.key+1}",size: 40,),
                   const SizedBox(height: 30,), 
                   HeadingText(e.value.name,size: 24,),
                   const SizedBox(height: 20,),
                           
                   Expanded(
                     child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         const Text("Member Price"),
                         Text("Rs.${e.value.memberPrice}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                         const SizedBox(height: 10,),
                    const Text("Non Member Price"),
                         Text("Rs.${e.value.nonMemberPrice}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                         const SizedBox(height: 10,),
                       ],
                     ),
                   ),
                           
                      const CardBorder(
                        margin: EdgeInsets.zero,
                        color: Colors.grey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Icon(Icons.add,color: Colors.white,),
                        SizedBox(width: 10,),
                           
                        Text("Choose Service",style: TextStyle(color: Colors.white),)
                      ],))
                  ],
                )).animate().shimmer(duration: Duration(seconds: 1),curve: Curves.easeIn,color: Colors.grey),).toList(),),
              ),
              ],),
            ),
   SizedBox(width:size<=mobilescreen?16: 100,),
          ],
        );
      }
    );
  }
}
