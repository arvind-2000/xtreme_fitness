import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/user.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/widgets/canvasimage.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

import '../../../../config/apis.dart';
import '../../../managementdomain/entities.dart/xtremer.dart';

class MemberProfilescreen extends StatelessWidget {
  const MemberProfilescreen({super.key, this.user});
  final Xtremer? user;
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.sizeOf(context).width;
    return GetBuilder<GetxPageController>(
      builder: (pagectrl) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              //title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const HeadingText("Profile",size: 30,),
                IconButton(onPressed: (){
                    pagectrl.changeviewprofile();
          
                }, icon:const Icon(Icons.close))
              ],
            ),
            const SizedBox(height: 20,),
              //body for desktop
              user==null?const Center(child: Text("No User"),) : Expanded(
                child: Row(
                  children: [
                      SizedBox(
                        width: 300,
                        child: CardwithShadow(
                          margin: const EdgeInsets.only(right: 16),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey[200],
                                    child:SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: ImageWidget(url: "http://10.10.1.76/ProfilePhotos/ab14f71b-fd31-4104-ab2d-281ceb117ac8_prof43.png",)),
                                  ),

                                  IconButton(onPressed: (){}, icon: const Icon(Icons.edit,size: 16,))
                                ],
                              ),
          const SizedBox(height: 30,),
                              //name details

                              const Text("Name"),
                              const SizedBox(height: 10,),
                              Text(user!.firstName!,style: const TextStyle(fontWeight: FontWeight.bold),),
                              const SizedBox(height: 20,),
                              const Text("Phone"),
                                 const SizedBox(height: 10,),
                              Text(user!.mobileNumber!,style: const TextStyle(fontWeight: FontWeight.bold),),
                              const SizedBox(height: 20,),
                              const Text("Designation"),
                                 const SizedBox(height: 10,),
                              Text("Member",style: const TextStyle(fontWeight: FontWeight.bold),),
                              const SizedBox(height: 20,),
                              const Text("Address"),
                                 const SizedBox(height: 10,),
                              Text(user!.address!,style: TextStyle(fontWeight: FontWeight.bold),),
                              const SizedBox(height: 20,),
                              const Text("Email"),
                                 const SizedBox(height: 10,),
                              Text(user!.email!,style: TextStyle(fontWeight: FontWeight.bold),),
                              const SizedBox(height: 16,),
                                CardwithShadow(
                                  color: Colors.blue[300],
                                  child: const Center(child: Text("Change Password"),))
                            ],
                          ))),            
                       const Expanded(child: CardwithShadow(
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                                  Row(
                                    children: [
                                      Expanded(
                                        child: CardwithShadow(
                                               margin: EdgeInsets.only(right: 16),
                                          child: Column(
                                          children: [
                                            Text("Plan"),
                                        
                                            SizedBox(height: 16,),
                                            Text("Personal"),
                                            SizedBox(height: 16,),
                                            //amount
                                            Text("Rs 1200")
                                          ],
                                        )),
                                      ),
                                                Expanded(
                                        child: CardwithShadow(
                                          margin: EdgeInsets.only(right: 16),
                                          child: Column(
                                          children: [
                                            Text("Plan"),
                                        
                                            SizedBox(height: 16,),
                                            Text("Personal"),
                                            SizedBox(height: 16,),
                                            //amount
                                            Text("Rs 1200")
                                          ],
                                        )),
                                      ),          Expanded(
                                        child: CardwithShadow(
                                               margin: EdgeInsets.only(right: 16),
                                          child: Column(
                                          children: [
                                            Text("Plan"),
                                        
                                            SizedBox(height: 16,),
                                            Text("Personal"),
                                            SizedBox(height: 16,),
                                            //amount
                                            Text("Rs 1200")
                                          ],
                                        )),
                                      ),
                                      
                                    ],
                                  )
                          ],
                        ))),   
                               
                  ],
                ),
              ),
              const SizedBox(height: 40,)
            ],
          ),
        );
      }
    );
  }
}