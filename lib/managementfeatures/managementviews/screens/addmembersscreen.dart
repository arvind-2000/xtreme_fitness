import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/planentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addmemberfields/createmember.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/cardborder.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';



import '../../../authenicationfeatures/views/pages/dialogs/logindialog.dart';
import '../../../widgets/headingtext.dart';

import '../widgets/paymentstatuscard.dart';
import 'addmemberfields/addplan.dart';
import 'addmemberfields/doctordetails.dart';
import 'addmemberfields/personaldetails.dart';
import 'addmemberfields/questionnaire.dart';


class AddMemberScreen extends StatefulWidget {
  AddMemberScreen({super.key, this.phonenumber, this.plan});
  final String? phonenumber;
  final Plan? plan;
  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  final GlobalKey<FormState>  _globalkey = GlobalKey<FormState>();

    @override
  void initState() {

    super.initState();
    Get.put(AddMemberController());
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Get.find<AddMemberController>().changepaymentstatus(0);
    },);

  }
@override
  void dispose() {
    Get.find<AddMemberController>().onClose();
    Get.find<GetxPageController>().changeaddmemberclose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddMemberController>(
      builder: (addmemberctrl) {
        return GetBuilder<GetxPageController>(
          builder: (pagectrl) {
            return SingleChildScrollView(
              child: addmemberctrl.isloading ||
                        addmemberctrl.paymentstatus != 0
                    ? PaymentStatusCard(
                        callback: () {
                          addmemberctrl.changepaymentstatus(0);

                          if (addmemberctrl.ismember) {
                            Get.offAllNamed('/home');
                            Get.dialog(const LoginDialog());
                          } else {
                            pagectrl.changeaddMemberPage(0);
                          }
                        },
                      )
                    : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
               
                children: [
                      Padding(
                    padding: EdgeInsets.all(16.0),
                    child: HeadingText(widget.phonenumber!=null?"Xtreme Registration":"Add Membership",size: 30,),
                  ),
              
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 800),
                      child:  Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        
                            Column(children: [
                              CardwithShadow(
                              
                                onpress: (){
                                  pagectrl.changeaddMemberPage(0);
                                },
                                color: pagectrl.addmemberpages>=0?Theme.of(context).colorScheme.secondary:null,
                                child:  Center(child: Text("1",style: TextStyle(color:pagectrl.addmemberpages>0?Colors.white:null ),))),
                              // MediaQuery.sizeOf(context).width<mobilescreen?const SizedBox():const  Text("Personal Details")
                            ],),
                               AnimatedOpacity(
        
                                 duration:Durations.extralong1,
                                 opacity: pagectrl.addmemberpages>0?1:0,
                                 child: Container(
                                     width: 50,
                                                           height: 1,
                                                           color: Theme.of(context).colorScheme.secondary,
                                                         ),
                               ),
                                     Column(children: [
                              CardwithShadow(
                                     onpress: (){
                                  pagectrl.changeaddMemberPage(1);
                                },
                                   color: pagectrl.addmemberpages==1?Theme.of(context).colorScheme.secondary.withOpacity(0.5):pagectrl.addmemberpages>1?Theme.of(context).colorScheme.secondary:null,
                                child: Center(child: Text("2",style: TextStyle(color:pagectrl.addmemberpages>1?Colors.white:null ),))),
                                  //  MediaQuery.sizeOf(context).width<mobilescreen?const SizedBox(): const Text("Plan")
                            ],),
                    AnimatedOpacity(
        
                                 duration:Durations.extralong1,
                                 opacity: pagectrl.addmemberpages>1?1:0,
                                 child: Container(
                                     width: 50,
                                                           height: 1,
                                                           color: Theme.of(context).colorScheme.secondary,
                                                         ),
                               ),        
                             Column(children: [
                              CardwithShadow(
                                     onpress: (){
                                  pagectrl.changeaddMemberPage(2);
                                },
                                   color: pagectrl.addmemberpages==2?Theme.of(context).colorScheme.secondary.withOpacity(0.5):pagectrl.addmemberpages>2?Theme.of(context).colorScheme.secondary:null,
                                child: Center(child: Text("3",style: TextStyle(color:pagectrl.addmemberpages>2?Colors.white:null ),))),
                                    // MediaQuery.sizeOf(context).width<mobilescreen?const SizedBox(): const Text("Questionnare (PARQ)")
                            ],),
                          AnimatedOpacity(
        
                                 duration:Durations.extralong1,
                                 opacity: pagectrl.addmemberpages>2?1:0,
                                 child: Container(
                                     width: 50,
                                                           height: 1,
                                                           color: Theme.of(context).colorScheme.secondary,
                                                         ),
                               ),   
                             Column(children: [
                              CardwithShadow(
                                     onpress: (){
                                  pagectrl.changeaddMemberPage(3);
                                },
                                   color: pagectrl.addmemberpages==3?Theme.of(context).colorScheme.secondary.withOpacity(0.5):pagectrl.addmemberpages>3?Theme.of(context).colorScheme.secondary:null,
                                child: Center(child: Text("4",style: TextStyle(color:pagectrl.addmemberpages>3?Colors.white:null ),))),
                                    // MediaQuery.sizeOf(context).width<mobilescreen?const SizedBox(): const Text("Doctor Details")
                            ],),
                      AnimatedOpacity(
        
                                 duration:Durations.extralong1,
                                 opacity: pagectrl.addmemberpages>3?1:0,
                                 child: Container(
                                     width: 50,
                                                           height: 1,
                                                           color: Theme.of(context).colorScheme.secondary,
                                                         ),),
                               
              
                                      Column(children: [
                              CardwithShadow(
                                onpress: (){
                                  pagectrl.changeaddMemberPage(4);
                                },
                                color: pagectrl.addmemberpages==4?Theme.of(context).colorScheme.secondary.withOpacity(0.5):pagectrl.addmemberpages>4?Theme.of(context).colorScheme.secondary:null,
                                child:  Center(child: Text("5",style: TextStyle(color:pagectrl.addmemberpages>4?Colors.white:null ),))),
                                  //  MediaQuery.sizeOf(context).width<mobilescreen?const SizedBox():  const Text("Create Membership")
                            ],),
                        ],),
                      ),
                    ),
                  ),
                CardBorder(
                    color: Colors.transparent,
                    margin: const EdgeInsets.all(16),
                    child: Form(
                          key:_globalkey,
                      child: pagectrl.addmemberpages==0?PersonaldetailsField( pagectrl: pagectrl,phonenumber: widget.phonenumber,callback: (){
                        pagectrl.changeaddMemberPage(1);
                      },):pagectrl.addmemberpages==1?PlanSelectionField(pagectrl: pagectrl,callback: (){     
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
                        }},):pagectrl.addmemberpages==2?Questionnare(pagectrl: pagectrl):pagectrl.addmemberpages==3?DoctorDetails(pagectrl: pagectrl):CreateMember()
                )),
                            const SizedBox(height: 40,)
                ],
              ),
            );
          }
        );
      }
    );
  }
}




