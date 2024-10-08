import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/nodatascreen.dart/nodatascreen.dart';

import '../../../../config/const.dart';
import '../../../../widgets/cardborder.dart';
import '../../../../widgets/cardswithshadow.dart';
import '../../../../widgets/headingtext.dart';
import '../../../../widgets/titletext.dart';
import '../../controllers/pagecontroller.dart';

class PlanSelectionField extends StatelessWidget {
  const PlanSelectionField({super.key, required this.pagectrl});
  final GetxPageController pagectrl;
   @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.sizeOf(context).width;
    return GetBuilder<ManagementController>(
      builder: (managectrl) {
        return GetBuilder<AddMemberController>(
          builder: (addmemberctrl) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                      
              children: [
              
                managectrl.getallplans.isEmpty? const NodataScreen(title: "No Plans", desc: "No plans to show.",onpress: null,): GridView(
                 shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: size<500?1:size<mobilescreen?2: size>mobilescreen && size<1200?3:4,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio:  size<500?1:size<700?4/7.2:3/5,
                
                    ),
                    children: managectrl.getallplans.asMap().entries.map((e) => CardwithShadow(
                      // margin: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         HeadingText(e.value.category,size: 24,),
                         const SizedBox(height: 20,),
                        
                         Expanded(
                           child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               const Text("Price"),
                               Text(e.value.price.toString(),style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                               const SizedBox(height: 10,),
                                               const Text("Discount"),
                               Text("${e.value.discountPercentage}%",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                               const SizedBox(height: 10,),
                                           const Text("Actual Price"),
                                              HeadingText("${e.value.price - (e.value.price * (e.value.discountPercentage/100))}"  ,size: 24,),
                             ],
                           ),
                         ),
                        
                            CardBorder(
                              onpress: (){
                                addmemberctrl.addplan(e.value);
                              },
                              color: Colors.green[300],
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              Icon(addmemberctrl.selectedplan!=null&&addmemberctrl.selectedplan!.id==e.value.id?Icons.check:Icons.add,color: Colors.white,),
                              const SizedBox(width: 10,),
                        
                            addmemberctrl.selectedplan!=null&&addmemberctrl.selectedplan!.id==e.value.id?const Text("Plan Added",style: TextStyle(color: Colors.white)):Text("Add Plan",style: TextStyle(color: Colors.white),)
                            ],))
                        ],
                      )),).toList()
                    ),
                   
                addmemberctrl.selectedplan!=null&& addmemberctrl.selectedplan!.category==plancategory[0]&& managectrl.getalltrainer.isNotEmpty?   Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          
                            const Text("Choose Trainer"),
                            
                            const SizedBox(height: 6,),
                            DropdownMenu(
                              
                            menuStyle: MenuStyle(backgroundColor: WidgetStateColor.resolveWith((states) => Theme.of(context).colorScheme.primary,)),
                              onSelected: (index){
                                  addmemberctrl.addTrainer(index!);
                              },  
                              dropdownMenuEntries:managectrl.getalltrainer.map((e)=>DropdownMenuEntry(value: e, label: e.name,style: ButtonStyle(
                                backgroundColor: WidgetStateColor.resolveWith((states) => Theme.of(context).colorScheme.primary,)
                              ))).toList()),
                          ],
                        ),
                ):const SizedBox(),
                  const SizedBox(height: 10,),

                  addmemberctrl.gettrainer!=null?CardwithShadow(
                        margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              
                                TitleText(addmemberctrl.gettrainer!.name),
                                const SizedBox(height: 10,),
                                const Text("phone"),
                                Text(addmemberctrl.gettrainer!.phone,style: const TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(height: 6,),
                                   const Text("Designation"),
                                Text(addmemberctrl.gettrainer!.roleid.rolename,style: const TextStyle(fontWeight: FontWeight.bold),),
                              ],
                                                    ),
                            ),

                            // const Column(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   crossAxisAlignment: CrossAxisAlignment.end,
                            //   children: [
                            //     Row(children: [
                            //         CardwithShadow(
                            //           padding: EdgeInsets.all(8),
                                 
                            //           child: Icon(Icons.close,color: Colors.white,size: 12,)),
                                    
                             
                            //     ],),
                            //     SizedBox(height: 16,),
                            //     CardwithShadow(
                            //       color: Color.fromARGB(255, 175, 210, 238),
                            //       child: Text("View Profile"))
                            //   ],
                            // )
                          ],
                        )).animate().slideX(begin: 1,end: 0):const SizedBox(),
                  const SizedBox(height: 10,),

            
             managectrl.getallplans.isEmpty?const SizedBox():   CardwithShadow(
                  color: Theme.of(context).colorScheme.secondary,
                  onpress: (){
                    if(addmemberctrl.selectedplan!=null){


                           if(addmemberctrl.selectedplan!.category!=plancategory[0]){
                              pagectrl.changeaddMemberPage(2);
                           }else{
                            if(addmemberctrl.gettrainer!=null){
                              pagectrl.changeaddMemberPage(2);
                            }else{
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Choose a Trainer for personal plan before proceeding")));
                            }
                           }
                    }else{

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Choose a plan before proceeding")));
                    }
              
               
                  },
                  child: Row(
            
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Icon(Icons.add,color: Colors.white,),
                      SizedBox(width: 10,),
                      Text("Add plan",style: TextStyle(color: Colors.white),)
                  ],
                ))
            
              ],
            );
          }
        );
      }
    );
  }
}