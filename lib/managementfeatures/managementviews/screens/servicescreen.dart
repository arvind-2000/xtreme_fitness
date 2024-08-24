import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addservicesfields/addservicefield.dart';

import '../../../widgets/cardswithshadow.dart';
import '../../../widgets/headingtext.dart';
import '../../../widgets/titletext.dart';
import '../controllers/managementcontroller.dart';
import '../widgets/dialogswidget.dart';


class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  bool _isserviceadd = false;
  void isaddservice(){
    setState(() {
      _isserviceadd = !_isserviceadd;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.sizeOf(context).width;
    return GetBuilder<ManagementController>(
      builder: (managementcontroller) {
        return Column(
               crossAxisAlignment: CrossAxisAlignment.start,
        
          children: [
          const Padding(
              padding: EdgeInsets.all(16.0),
              child: HeadingText("Service",size: 30,),
            ),
           _isserviceadd? AddServiceField(onpress: isaddservice,): GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: size<500?1:size<mobilescreen?2: 4,
            mainAxisSpacing: 10,
                   
            childAspectRatio:  size<500?1:3/3.5,
                   
            ),
            children:managementcontroller.getallservices.asMap().entries.map((e) => CardwithShadow(
                margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     HeadingText(e.value.name,size: 24,),
                            Row(
                      children: [
                        IconButton(onPressed: (){
           
                            // managementcontroller.deletservices(e.value);
                        }, icon: const Icon(Icons.edit,size: 12,)),
                        const SizedBox(width: 10,),
                        IconButton(onPressed: (){
           
              showDialog(context: context, builder: (context) => PageDialog(
                          no: () {
                            Navigator.pop(context);
                          },
                          yes: () async{
                          managementcontroller.deletservices(e.value);
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Service Deleted"),duration: Durations.extralong1,));
                          Navigator.pop(context);
                          },
           
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const TitleText("Delete Services"),
                                IconButton(onPressed: (){
                                  Navigator.pop(context);
                                }, icon: const Icon(Icons.close))
                              ],
                            ),
                            const SizedBox(height: 20,),
                            const Text("Service Name",style: TextStyle(fontSize: 14),),
                            const SizedBox(height: 5,),
                            Text(e.value.name,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                            const SizedBox(height: 16,),
                              const Text("Member Price",style: TextStyle(fontSize: 14),),
                            const SizedBox(height: 5,),
                            Text(e.value.memberPrice.toString(),style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                            const SizedBox(height: 16,),
                                  const Text("Non Member Price",style: TextStyle(fontSize: 14),),
                            const SizedBox(height: 5,),
                            Text("${e.value.nonMemberPrice}",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                            const SizedBox(height: 16,),
                                const Text("Duration",style: TextStyle(fontSize: 14),),
                            const SizedBox(height: 5,),
                            Text("${e.value.durationInMinutes} mins",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
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
                 const SizedBox(height: 20,),
           
                 Expanded(
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       const Text("Member Price"),
                       Text(e.value.memberPrice.toString(),style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                       const SizedBox(height: 10,),
                                       const Text("Non Member Price"),
                       Text("${e.value.nonMemberPrice}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                       const SizedBox(height: 10,),
                               
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
              )),).toList()..add(CardwithShadow(
                color:Colors.blue,
                onpress: (){
                
                  isaddservice();
                   
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Add Service"),));
                },
              margin: const EdgeInsets.all(16),
              child: const Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add,size: 14,),
                  SizedBox(width: 5,),
                  Text("Add Service",style: TextStyle(fontSize: 20),),
                ],
              ),)))
            ),
              
               const SizedBox(height: 40,)
          ],
        );
      }
    );
  }
}