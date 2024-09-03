import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/widgets/gridviewwidget.dart';

import '../../config/const.dart';
import '../../widgets/cardborder.dart';
import '../../widgets/cardswithshadow.dart';
import '../../widgets/headingtext.dart';
import '../controllers/getxcontrol.dart';

class PricingPage extends StatelessWidget {
  const PricingPage({
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
               HeadingText("Pricing",size:size<=mobilescreen?30: 60,isbold: true,),
               const SizedBox(height: 50,),
              GridViewWidget(
                
           
                      size: size,
                      children: managementcontroller.getallplans.asMap().entries.map((e) => CardwithShadow(
                        margin: const EdgeInsets.all(16),
                        padding: EdgeInsets.symmetric(vertical: 16,horizontal:32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                           HeadingText(e.value.category,size: 16,),
                           SizedBox(height: 20,),
                     
                           Expanded(
                             child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                   children: [
                                     Text("Rs ${e.value.price - (e.value.price * (e.value.discountPercentage/100))}/ ",style: const TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                                     Text("${e.value.durationInMonths} months")
                                   ],
                                 ),
                                 const SizedBox(height: 30,),
                                  const Text("Price"),
                                                HeadingText("Rs ${e.value.price}"  ,size: 24,),
                                                    const SizedBox(height: 10,),
                                                 const Text("Discount"),
                                 Text("${e.value.discountPercentage}%",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                                 const SizedBox(height: 10,),
                                             const Text("Actual Price"),
                                                HeadingText("Rs ${e.value.price - (e.value.price * (e.value.discountPercentage/100))}"  ,size: 24,),
                               ],
                             ),
                           ),
                     
                              const CardBorder(
                                margin: EdgeInsets.zero,
                                color: Colors.grey,
                                child: Text("Choose Plan",style: TextStyle(color: Colors.white),))
                          ],
                        )),).toList()
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
