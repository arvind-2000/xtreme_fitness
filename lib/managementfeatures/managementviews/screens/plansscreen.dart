import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addplanfields/addplanscreen.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/nodatascreen.dart/nodatascreen.dart';
import 'package:xtreme_fitness/widgets/cardborder.dart';

import '../../../widgets/cardswithshadow.dart';
import '../../../widgets/headingtext.dart';
import '../../../widgets/titletext.dart';
import '../widgets/dialogswidget.dart';


class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
 bool _isplanadd = false;

  void isaddplan(){
    setState(() {
      _isplanadd = !_isplanadd;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.sizeOf(context).width;
    return GetBuilder<ManagementController>(
      builder: (managementcontroller) {
        return  Column(
               crossAxisAlignment: CrossAxisAlignment.start,
        
          children: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const HeadingText("Plans",size: 30,),
                 _isplanadd? const SizedBox():CardBorder(
                    onpress: isaddplan,
                    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                    child: const Row(
                    children: [
                      Icon(Icons.add),
                      
                      Text("Add Plan")
                    ],
                  ))
                ],
              ),
            ),
           _isplanadd? AddPlanFields(onpress: isaddplan,): managementcontroller.getallplans.isEmpty?NodataScreen(title: "No Plans", desc: "No plans to show",onpress: isaddplan,): GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            
            crossAxisCount: size<500?1:size<mobilescreen?2: size>mobilescreen && size<1200?3:4,
            mainAxisSpacing: 10,
                   
            childAspectRatio:  size<500?1: 3/4,
                   
            ),
            shrinkWrap: true,
            children: managementcontroller.getallplans.asMap().entries.map((e) => CardwithShadow(
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     HeadingText(e.value.category,size: 24,),
                     Row(
                      children: [
                        IconButton(onPressed: (){
                            managementcontroller.deletplans(e.value);
                        }, icon: const Icon(Icons.edit,size: 12,)),
                        const SizedBox(width: 10,),
                        IconButton(onPressed: (){
           
              showDialog(context: context, builder: (context) => PageDialog(
                          no: () {
                            Navigator.pop(context);
                          },
                          yes: () async{
                          managementcontroller.deletplans(e.value);
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Plan Deleted"),duration: Durations.extralong1,));
                          Navigator.pop(context);
                          },
           
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const TitleText("Delete Plans"),
                                IconButton(onPressed: (){
                                  Navigator.pop(context);
                                }, icon: const Icon(Icons.close))
                              ],
                            ),
                            const SizedBox(height: 20,),
                            const Text("Plan Name",style: TextStyle(fontSize: 14),),
                            const SizedBox(height: 5,),
                            Text(e.value.name,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                            const SizedBox(height: 16,),
                              const Text("Plan Amount",style: TextStyle(fontSize: 14),),
                            const SizedBox(height: 5,),
                            Text(e.value.price.toString(),style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                            const SizedBox(height: 16,),
                                  const Text("Plan Duration",style: TextStyle(fontSize: 14),),
                            const SizedBox(height: 5,),
                            Text("${e.value.durationInMonths} months",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                            const SizedBox(height: 16,),
                                const Text("Plan Discount",style: TextStyle(fontSize: 14),),
                            const SizedBox(height: 5,),
                            Text("${e.value.discountPercentage}%",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                            const SizedBox(height: 16,),
                                const Text("Plan Category",style: TextStyle(fontSize: 14),),
                            const SizedBox(height: 5,),
                            Text(e.value.category,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                            const SizedBox(height: 16,),
                            Row(
                              children: [
                                Expanded(child: CardwithShadow(
                                  color: Theme.of(context).colorScheme.error.withOpacity(0.6),
                                  margin: const EdgeInsets.all(16),
                                  child: const Text("Press Yes to confirm",textAlign: TextAlign.center,)))
                              ],
                            )
                          ],
                                                  )),);
           
                  
                        }, icon: const Icon(Icons.delete,size: 12,)),
                      ],
                     )
                   ],
                 ),
                 SizedBox(height: 20,),
           
                 Expanded(
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       const Text("Price"),
                       Text(e.value.price.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                       const SizedBox(height: 10,),
                                       const Text("Discount"),
                       Text("${e.value.discountPercentage}%",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                       const SizedBox(height: 10,),
                                   const Text("Actual Price"),
                                      HeadingText("${e.value.price - (e.value.price * (e.value.discountPercentage/100))}"  ,size: 24,),
                     ],
                   ),
                 ),
           
                    CardwithShadow(
                      color: Colors.green[300],
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Icon(Icons.add,color: Colors.white,),
                      SizedBox(width: 10,),
           
                      Text("CheckOut",style: TextStyle(color: Colors.white),)
                    ],))
                ],
              )),).toList()
            ),
              
               const SizedBox(height: 40,)
          ],
        );
      }
    );
  }
}