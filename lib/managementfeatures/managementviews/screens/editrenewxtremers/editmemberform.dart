import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/planentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addmemberfields/createmember.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addmemberfields/doctordetails.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/scaffolds.dart';


import '../../../../widgets/cardborderhover.dart';
import '../../../../widgets/headingtext.dart';

import '../addmemberfields/personaldetails.dart';
import '../addmemberfields/questionnaire.dart';



class EditmemberForm extends StatefulWidget {
  EditmemberForm({super.key, this.phonenumber, this.plan});
  final String? phonenumber;
  final Plan? plan;
  @override
  State<EditmemberForm> createState() => _EditmemberFormState();
}

class _EditmemberFormState extends State<EditmemberForm> {

    @override
  void initState() {

    super.initState();
    Get.put(AddMemberController());
  }
@override
  void dispose() {
   

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     return GetBuilder<AddMemberController>(
      builder: (addmemberctrl) {
        return GetBuilder<GetxPageController>(
          builder: (pagectrl) {
            return Center(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 800,),
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const HeadingText("Edit Profile"),
                            IconButton(onPressed: (){
                              addmemberctrl.onClose();
                              // pagectrl.disposes();
                              pagectrl.changeeditform(false);
                            }, icon: Icon(Icons.close),tooltip: "Close",)
                          ],
                        ),
                        const SizedBox(height: 40,),
                       SizedBox(
                        //  height: 1000,
                         child: Column(
                           children: [
                             pagectrl.addmemberpages==0?PersonaldetailsField(pagectrl: pagectrl, callback: () {
                                        pagectrl.changeaddMemberPage(2);
                                                      
                             },buttonText: "Edit Member",):pagectrl.addmemberpages==2?Questionnare(pagectrl: pagectrl):pagectrl.addmemberpages==3?DoctorDetails(pagectrl: pagectrl):CreateMember(iseditform: true,buttontext: "Edit Xtremer",callback: ()async{
                                 Map<String,bool> x = await  addmemberctrl.updateXtremer();
                                  if(x.entries.first.value){
                                    pagectrl.changeeditform(false);
                                  }
                                CustomSnackbar(context, x.entries.first.key);
                             },),
                           ],
                         ),
                       ),
                      ],
                    ),
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




