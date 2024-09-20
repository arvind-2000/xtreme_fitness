import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/user.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/memberhistory.dart';
import 'package:xtreme_fitness/widgets/canvasimage.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';
import 'package:xtreme_fitness/widgets/imagewidgets.dart';

import '../../../../config/apis.dart';
import '../../../../widgets/cardborder.dart';
import '../../../managementdomain/entities.dart/membership.dart';
import '../../../managementdomain/entities.dart/xtremer.dart';
import '../../widgets/scaffolds.dart';

class MemberProfilescreen extends StatefulWidget {
  const MemberProfilescreen({super.key, this.user, this.pagectrl,});
  final Xtremer? user;
  final GetxPageController? pagectrl;

  @override
  State<MemberProfilescreen> createState() => _MemberProfilescreenState();
}

class _MemberProfilescreenState extends State<MemberProfilescreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    if(widget.user!=null){
    Get.find<ManagementController>().getMembershipbyid(widget.user!.XtremerId!);
    }
    } ,);

       
  }

  @override
  Widget build(BuildContext context) {
    
    double size = MediaQuery.sizeOf(context).width;
        
        return GetBuilder<ManagementController>(
          builder: (managectrl) {
            
         
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
                        widget.pagectrl!.changeviewprofile();
              
                    }, icon:const Icon(Icons.close))
                  ],
                ),
                const SizedBox(height: 20,),
                  //body for desktop
                  widget.user==null?const Center(child: Text("No User"),) : Expanded(
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
                                          child: MemoryImageWidget(id: widget.user!.id)),
                                      ),
            
                                      IconButton(onPressed: (){}, icon: const Icon(Icons.edit,size: 16,))
                                    ],
                                  ),
              const SizedBox(height: 30,),
                                  //name details
            
                                  const Text("Name"),
                                  const SizedBox(height: 10,),
                                  //  Text("${user!.firstName??""} ${user!.surname??""}",style: const TextStyle(fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 20,),
                                  const Text("Phone"),
                                     const SizedBox(height: 10,),
                                  Text(widget.user!.mobileNumber??"",style: const TextStyle(fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 20,),
                                  const Text("Designation"),
                                     const SizedBox(height: 10,),
                                  const Text("Member",style: TextStyle(fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 20,),
                                  const Text("Address"),
                                     const SizedBox(height: 10,),
                                  Text(widget.user!.address??"",style: const TextStyle(fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 20,),
                                  const Text("Email"),
                                     const SizedBox(height: 10,),
                                  Text(widget.user!.email??"",style: const TextStyle(fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 16,),
                                    // CardwithShadow(
                                    //   color: Colors.blue[300],
                                    //   child: const Center(child: Text("Change Password"),))
                                ],
                              ))),            
                            Expanded(child: CardwithShadow(
                            color: Colors.transparent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
            
                                      Row(
                                        children: [
                                          Expanded(
                                            child: CardwithShadow(
                                                   margin: const EdgeInsets.only(right: 16),
                                              child: Column(
                                              children: [
                                                const Text("Plan"),
                                            
                                                const SizedBox(height: 16,),
                                                Text(widget.user!.category!=null?"${widget.user!.category}":""),
                                                const SizedBox(height: 16,),
                                          
                                              ],
                                            )),
                                          ),
                            //                        managectrl.currentmember==null?SizedBox():Expanded(
                            //                 child: CardwithShadow(
                            //                   margin: const EdgeInsets.only(right: 16),
                            //                   child: Column(
                            //                   children: [
                            //                     const Text("BMI Used"),
                                            
                            //                     const SizedBox(height: 16,),
                            //                     // Text(managectrl.currentmember!=null?managectrl.currentmember!.bmiUsed!?"Used":"false":"Not Used"),
                            //                     SizedBox(height: 16,),
                            //                                SizedBox(
                            //     width: double.maxFinite,
                             
                            //   child:   managectrl.currentmember!.bmiUsed!?SizedBox():CardBorder(
                            //     onpress: ()async{
                            //       Membership membership = managectrl.currentmember!;
                            //       membership.bmiUsed = false;
                            //       String s  = await  managectrl.managementRepo.editMembership(membership);
                  
                            //       CustomSnackbar(context, "Bmi Used");
                            //           managectrl.getMembershipbyid(widget.user!.XtremerId!);
                            //     },
                            //     color: Colors.amber,
                            //     margin: EdgeInsets.zero,
                            //     child: Center(child: Text("Use Service"))),
                                
                            // ),
                                              
                            //                   ],
                            //                 )),
                            //               ),        
                      
                                          
                                        ],
                                      ),
                                      SizedBox(height: 16,),
                                      MemberServiceHistory(xtremer: widget.user, userid: widget.user!.XtremerId)
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