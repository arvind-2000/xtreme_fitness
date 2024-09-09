import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/planentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addmemberfields/createmember.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addmemberfields/doctordetails.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/cardborder.dart';
import 'package:xtreme_fitness/widgets/cardborderhover.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';

import '../../../../widgets/headingtext.dart';
import '../addmemberfields/addplan.dart';
import '../addmemberfields/personaldetails.dart';
import '../addmemberfields/questionnaire.dart';



class RenewalForms extends StatefulWidget {
  RenewalForms({super.key, this.phonenumber, this.plan, this.callback});
  final String? phonenumber;
  final Plan? plan;
  final VoidCallback? callback;
  @override
  State<RenewalForms> createState() => _RenewalFormsState();
}

class _RenewalFormsState extends State<RenewalForms> {
  final GlobalKey<FormState>  _globalkey = GlobalKey<FormState>();

    @override
  void initState() {

    super.initState();
    Get.put(AddMemberController());
  }
@override
  void dispose() {
    Get.find<AddMemberController>().onClose();
    Get.find<GetxPageController>().disposes();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddMemberController>(
      builder: (addmemberctrl) {
        return GetBuilder<GetxPageController>(
          builder: (pagectrl) {
            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 1000,maxHeight: 800),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                            Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HeadingText("Plan Renewal"),
                              IconButton(onPressed: (){
                                addmemberctrl.onClose();
                                pagectrl.disposes();
                                pagectrl.changerenewal(false);
                                widget.callback!();
                              }, icon: Icon(Icons.close),tooltip: "Close",)
                            ],
                          ),
                          const SizedBox(height: 40,),
                      PlanSelectionField(pagectrl: pagectrl, callback: () {
                              
                              if(addmemberctrl.selectedplan!=null){
                                if(addmemberctrl.selectedplan!.category.toLowerCase()=="personal"){
                                      if(addmemberctrl.gettrainer!=null){
                                          addmemberctrl.renewalsubmission();  
                                      }else{
                                         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No trainer selected")));
                                      }
                                }else{
                                  addmemberctrl.renewalsubmission();  
                                }
                                 
                              }else{
                
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No Plans Selected")));
                              }
                                                
                      },),
                      SizedBox(height: 100,)
                    ],
                  ),
                ),
              ),
            );
          }
        );
      }
    );
  }
}




