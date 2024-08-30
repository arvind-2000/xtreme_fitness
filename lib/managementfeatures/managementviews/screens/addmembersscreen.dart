import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addmemberfields/createmember.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/cardborder.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';



import '../../../widgets/headingtext.dart';

import 'addmemberfields/addplan.dart';
import 'addmemberfields/doctordetails.dart';
import 'addmemberfields/personaldetails.dart';
import 'addmemberfields/questionnaire.dart';


class AddMemberScreen extends StatefulWidget {
  AddMemberScreen({super.key});

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  final GlobalKey<FormState>  _globalkey = GlobalKey<FormState>();

    @override
  void initState() {

    super.initState();
    Get.put(AddMemberController());
  }
@override
  void dispose() {
    Get.find<AddMemberController>().onClose();
    Get.find<GetxPageController>().changeaddMemberPage(0);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxPageController>(
      builder: (pagectrl) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           
            children: [
                  const Padding(
                padding: EdgeInsets.all(16.0),
                child: HeadingText("Add Member",size: 30,),
              ),
          
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child:  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                    
                        Column(children: [
                          CardwithShadow(
                            onpress: (){
                              pagectrl.changeaddMemberPage(0);
                            },
                            color: pagectrl.addmemberpages==0?Theme.of(context).colorScheme.secondary:null,
                            child:  Center(child: Text("1",style: TextStyle(color:pagectrl.addmemberpages==0?Colors.white:null ),))),
                          MediaQuery.sizeOf(context).width<mobilescreen?const SizedBox():const  Text("Personal Details")
                        ],),
                                 Column(children: [
                          CardwithShadow(
                                 onpress: (){
                              pagectrl.changeaddMemberPage(1);
                            },
                               color: pagectrl.addmemberpages==1?Theme.of(context).colorScheme.secondary:null,
                            child: Center(child: Text("2",style: TextStyle(color:pagectrl.addmemberpages==1?Colors.white:null ),))),
                               MediaQuery.sizeOf(context).width<mobilescreen?const SizedBox(): const Text("Plan")
                        ],),
                    
                         Column(children: [
                          CardwithShadow(
                                 onpress: (){
                              pagectrl.changeaddMemberPage(2);
                            },
                               color: pagectrl.addmemberpages==2?Theme.of(context).colorScheme.secondary:null,
                            child: Center(child: Text("3",style: TextStyle(color:pagectrl.addmemberpages==2?Colors.white:null ),))),
                                MediaQuery.sizeOf(context).width<mobilescreen?const SizedBox(): const Text("Questionnare (PARQ)")
                        ],),
                         Column(children: [
                          CardwithShadow(
                                 onpress: (){
                              pagectrl.changeaddMemberPage(3);
                            },
                               color: pagectrl.addmemberpages==3?Theme.of(context).colorScheme.secondary:null,
                            child: Center(child: Text("4",style: TextStyle(color:pagectrl.addmemberpages==3?Colors.white:null ),))),
                                MediaQuery.sizeOf(context).width<mobilescreen?const SizedBox(): const Text("Doctor Details")
                        ],),
          
          
                                  Column(children: [
                          CardwithShadow(
                            onpress: (){
                              pagectrl.changeaddMemberPage(4);
                            },
                            color: pagectrl.addmemberpages==4?Theme.of(context).colorScheme.secondary:null,
                            child:  Center(child: Text("5",style: TextStyle(color:pagectrl.addmemberpages==4?Colors.white:null ),))),
                               MediaQuery.sizeOf(context).width<mobilescreen?const SizedBox():  const Text("Create Membership")
                        ],),
                    ],),
                  ),
                ),
              ),
            CardBorder(
                color: Colors.transparent,
                // margin: const EdgeInsets.all(16),
                margin: EdgeInsets.zero,
                child: Form(
                      key:_globalkey,
                  child: pagectrl.addmemberpages==0?PersonaldetailsField( pagectrl: pagectrl,):pagectrl.addmemberpages==1?PlanSelectionField(pagectrl: pagectrl,):pagectrl.addmemberpages==2?Questionnare(pagectrl: pagectrl):pagectrl.addmemberpages==3?DoctorDetails(pagectrl: pagectrl):const CreateMember())),
                        const SizedBox(height: 40,)
            ],
          ),
        );
      }
    );
  }
}



