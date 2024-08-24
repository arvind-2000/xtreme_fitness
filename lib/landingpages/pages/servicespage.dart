import 'package:flutter/material.dart';
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
               const SizedBox(height: 50,),
             HeadingText("Services",size: size<=mobilescreen?30:60,isbold: true,),
               const SizedBox(height: 50,),
              GridViewWidget(size: size,children:  managementcontroller.getallservices.asMap().entries.map((e) => CardwithShadow(
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 HeadingText(e.value.name,size: 24,),
                 SizedBox(height: 20,),
           
                 Expanded(
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       const Text("member Price"),
                       Text(e.value.memberPrice.toString(),style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                       const SizedBox(height: 10,),
                  const Text("Non member Price"),
                       Text(e.value.nonMemberPrice.toString(),style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                       const SizedBox(height: 10,),
                     ],
                   ),
                 ),
           
                    CardBorder(
                      color: Colors.grey,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Icon(Icons.add,color: Colors.white,),
                      SizedBox(width: 10,),
           
                      Text("Choose Service",style: TextStyle(color: Colors.white),)
                    ],))
                ],
              )),).toList(),),
              ],),
            ),
   SizedBox(width:size<=mobilescreen?16: 100,),
          ],
        );
      }
    );
  }
}

