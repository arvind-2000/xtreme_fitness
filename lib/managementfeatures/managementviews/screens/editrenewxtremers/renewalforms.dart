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
  RenewalForms({super.key, this.phonenumber, this.plan});
  final String? phonenumber;
  final Plan? plan;
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
            return SizedBox(
            
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 800),
                child: CardBorderHover(
                  
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            HeadingText("Plan Renewal"),
                            IconButton(onPressed: (){
                              pagectrl.changerenewal(false);
                            }, icon: Icon(Icons.close),tooltip: "Close",)
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Expanded(
                        child: PlanSelectionField(pagectrl: pagectrl, callback: () {
                                
                                if(addmemberctrl.selectedplan!=null){
                                    addmemberctrl.renewalsubmission();  
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No Plans Selected")));
                                }
                                                  
                        },),
                      ),
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




