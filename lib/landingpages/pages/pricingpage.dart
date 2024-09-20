import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/widgets/gridviewwidget.dart';

import '../../config/const.dart';
import '../../widgets/card.dart';
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
        return  Container(
      
          color: const Color.fromARGB(255, 15, 15, 15),
          child: Row(
            children: [
              SizedBox(width:size<=mobilescreen?16: 100,),
              Expanded(
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
              
                 Container(
                   height: 300,
                   width: MediaQuery.sizeOf(context).width,
                   child: Center(child: HeadingText("Pricing",size:size<=mobilescreen?30: 60,isbold: true,))),
             
                GridViewWidget(
                  
                             
                        size: size,
                        children: managementcontroller.getallplans.where((element) => element.isActive!,).toList().asMap().entries.map((e) => SizedBox(
                                           width: 400,
                       child: CardwithShadow(
                        margin: const EdgeInsets.symmetric(vertical: 32,horizontal: 16),
                        padding: const EdgeInsets.symmetric(vertical: 32,horizontal:32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           HeadingText(e.value.category,size: 20,color: Colors.white60,),
                           const SizedBox(height: 20,),
                                            
                           Expanded(
                             child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                           
                               children: [
                                 
                                 Row(
                                 
                                   children: [
                                     Text("Rs ${e.value.price - (e.value.price * (e.value.discountPercentage/100))}",style: const TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                                     Text("/${e.value.durationInMonths} ${e.value.durationInMonths<=1?"month":"months"}")
                                   ],
                                 ),
                                 const SizedBox(height: 10,),
                                  e.value.discountPercentage<=0? const SizedBox():const Text("Discount",style: TextStyle(color: Colors.white60,),),
                                 e.value.discountPercentage<=0? const SizedBox():Text("${e.value.discountPercentage}%",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                 const SizedBox(height: 30,),
                                  const Text("Features",style: TextStyle(color: Colors.white60,),),
                                            const SizedBox(height: 16,),
                                                Row(
                                                  children: [
                                                    e.value.category.toLowerCase()=="personal"?const Icon(Icons.check,color: Colors.green,size:14,):const Icon(Icons.close,color: Colors.red,size:14,),
                                                    const SizedBox(width: 16,),
                                                     e.value.category.toLowerCase()=="personal"?Text("Trainer Included"  ,style: TextStyle(fontSize: 14,color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7)),):Text("No Trainers"  ,style: TextStyle(fontSize: 14,color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7)),),
                                                  ],
                                                ),   const SizedBox(height: 10,),
                                                     Row(
                                                  children: [
                                                    const Icon(Icons.check,color: Colors.green,size:14),
                                                    const SizedBox(width: 16,),
                                                   Text("Service Discount"  ,style: TextStyle(fontSize: 14,color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7)),),
                                                  ],
                                                ),
                                         const SizedBox(height: 10,),
                                                        Row(
                                                  children: [
                                                    const Icon(Icons.check,color: Colors.green,size:14,),
                                                    const SizedBox(width: 16,),
                                                   Text("One time BMI Free"  ,style: TextStyle(fontSize: 14,color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7)),),
                                                  ],
                                                ),
                                                    const SizedBox(height: 10,),
                                            
                                       
                               ],
                             ),
                           ),
                                            
                              SizedBox(
                                width: double.maxFinite,
                                child: Cardonly(
                                  margin: EdgeInsets.zero,
                                  color: Theme.of(context).colorScheme.secondary,
                                  child: Center(child: Text("Choose Plan",style: TextStyle(),))),
                              )
                          ],
                        )),
                                             ).animate().shimmer(duration: Duration(seconds: 1),curve: Curves.easeIn,color: Colors.grey)).toList()
                        ),
                ],),
              ),
              SizedBox(width:size<=mobilescreen?16: 100,),
            ],
          ),
        );
      }
    );
  }
}
