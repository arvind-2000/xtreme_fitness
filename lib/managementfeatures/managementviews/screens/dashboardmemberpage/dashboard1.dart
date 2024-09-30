import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/membership.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/paymententity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/xtremer.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/calculationusecase.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/dashboardmemberpage/dashboardmembermobile.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/editrenewxtremers/renewalforms.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/scaffolds.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/cardborder.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';
import 'package:xtreme_fitness/widgets/normaltext.dart';

import '../../widgets/memberhistory.dart';

class DashBoardMemberScreen extends StatefulWidget {
  const DashBoardMemberScreen({super.key});

  @override
  State<DashBoardMemberScreen> createState() => _DashBoardMemberScreenState();
}

class _DashBoardMemberScreenState extends State<DashBoardMemberScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Get.put(ManagementController());
          Get.put(GetxPageController());
    },);
  

  }



  @override
  Widget build(BuildContext context) {
    return  GetBuilder<ManagementController>(
     
      builder: (managectrl) {

        return GetBuilder<GetxPageController>(
          builder: (pagectrl) {
            return pagectrl.isrenewalforms?RenewalForms():managectrl.managementloading? Expanded(child: Center(child: CircularProgressIndicator(color: Theme.of(context).colorScheme.secondary,),)):SingleChildScrollView(
              child:MediaQuery.sizeOf(context).width<mobilescreen?DashBoardMemberScreenmobile() : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                           width:MediaQuery.sizeOf(context).width<mobilescreen? MediaQuery.sizeOf(context).width:350,
                          child: CardwithShadow(
                            margin: EdgeInsets.zero,
                            padding: EdgeInsets.all(32),
                            child:managectrl.xtremer==null? Center(child: CircularProgressIndicator(color: Colors.blue,),): Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeadingText("Current Plan",color: Colors.white60,),
                              SizedBox(height: 30,),

                               Text("Name",style: TextStyle(fontSize: 16,color: Colors.white60)),
                               
                                 Text(managectrl.xtremer!.firstName.toString(),style: TextStyle(fontSize: 20)),
                                   SizedBox(height: 20,),
                                   Text("Plan",style: TextStyle(fontSize: 16,color: Colors.white60)),
                                 Text(managectrl.xtremer!.category.toString(),style: TextStyle(fontSize: 20)),
                              //  SizedBox(height: 10,),
                              //    Text("Trainer",style: TextStyle(fontSize: 16,color: Colors.white60)),
                              //    Text(managectrl.xtremer!.category.toString(),style: TextStyle(fontSize: 20)),
                                 SizedBox(height: 20,),
                              Text("Start",style: TextStyle(fontSize: 16,color: Colors.white60)),
                              SizedBox(height: 6,),
                            Text( managectrl.currentmember!=null?managectrl.currentmember!.startDate.toString():"",style: TextStyle(fontSize: 20),),
                              SizedBox(height: 10,),
                               Text("End",style: TextStyle(fontSize: 16,color: Colors.white60)),
                               SizedBox(height: 6,),
                               Text( managectrl.currentmember!=null?managectrl.currentmember!.startDate.toString():"",style: TextStyle(fontSize: 20),),
                               SizedBox(height: 30,),
                                Text("Remaining",style: TextStyle(fontSize: 16,color: Colors.white60),),
                              SizedBox(height: 6,),
                              Text("6 Days",style: TextStyle(fontSize: 28),),
                              SizedBox(height: 20,),
                              SizedBox(
                                width: double.maxFinite,
                                child: CardwithShadow(
                                  onpress: (){
                                      pagectrl.changerenewal(true);
                                              
                                  },
                                  color: Theme.of(context).colorScheme.secondary,
                                  child: const Center(child: Text("Renew Plan"))),
                              )
                            ],
                          ),
                          
                          ),
                        ),
                      ),
                  
                      managectrl.currentmember!=null? 
                      Padding(padding: EdgeInsets.all(16,),child: SizedBox(
                        width:MediaQuery.sizeOf(context).width<mobilescreen? MediaQuery.sizeOf(context).width:350,
                        child: CardwithShadow(
                        margin: EdgeInsets.zero,
                            padding: EdgeInsets.all(32),
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadingText("BMI Service"),
                            SizedBox(height: 20,),
                            NormalText(text: managectrl.currentmember!.bmiUsed!?"BMI Service already used":"Free one time BMI"),
                            SizedBox(height: 30,),
                            SizedBox(
                                width: double.maxFinite,
                             
                              child:   managectrl.currentmember!.bmiUsed!?SizedBox():CardBorder(
                                onpress: ()async{
                                  Membership membership = managectrl.currentmember!;
                                  membership.bmiUsed = false;
                                  String s  = await  managectrl.managementRepo.editMembership(membership);
                  
                                  CustomSnackbar(context, s);
                                      managectrl.getMembershipbyid(managectrl.xtremer!.XtremerId!);
                                },
                                color: Colors.amber,
                                margin: EdgeInsets.zero,
                                child: Center(child: Text("Use Service"))),
                                
                            ),
                            SizedBox(height: 10,)
                          ],
                        )),
                      ),)
                      :SizedBox()
                    ],
                  ),

                 managectrl.xtremer==null?SizedBox() :   Expanded(child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: MemberServiceHistory(xtremers: managectrl.xtremer!),
                  ))
                ],
              ),
            );
          }
        );
      }
    );
  }
}

