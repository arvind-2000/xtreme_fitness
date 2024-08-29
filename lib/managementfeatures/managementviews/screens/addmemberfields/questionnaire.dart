import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/radiobuttonwidget.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/cardborder.dart';

import '../../../../widgets/cardswithshadow.dart';
import '../../../../widgets/titletext.dart';
import '../../controllers/pagecontroller.dart';

  // 'exerciseQ': false,
  // 'physicianQ': false,
  // 'cardiacQ': false,
  // 'respiratoryQ': false,
  // 'faintingQ': false,
  // 'boneQ': false,
  // 'heartQ': false,
  // 'chestQ': false,
  // 'bpQ': false,
  // 'cholesterolQ': false,
  // 'medicationQ': false,

class Questionnare extends StatelessWidget {
  const Questionnare({super.key, required this.pagectrl});
  final GetxPageController pagectrl;
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AddMemberController>(
      builder: (addmemberctrl) {
        return Cardonly(
          color: Colors.transparent,
     

          
        
        
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TitleText("Questionnaire"),
                      Row(
                        children: [
                          CardBorder(
                            onpress: (){
                              addmemberctrl.setQuestyionaireall(true);
                            },
                          
                            child: Row(
                              children: [
                                  Checkbox(
                                    checkColor: Colors.blue,
                                    activeColor: Colors.blue[300],
                                    value: addmemberctrl.setallquestionaire, onChanged: (v){
                                      addmemberctrl.setQuestyionaireall(v!);
                                      
                                  }),
                                const SizedBox(width: 5,),
                                const Text("Yes to All",style: TextStyle(fontSize: 14),),
                              ],
                            )),
                 
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 30,),
                  RadiobuttonWidget(question: "Have you, for any reason, been unable to exercise in the past?",groupValue: addmemberctrl.healthQuestions['exerciseQ']??false, onChanged: (v){addmemberctrl.updatequestion('exerciseQ', v!);} ,),
                  const SizedBox(height: 10,),
                    RadiobuttonWidget(question: "Have your  physician ever advised you against exercising?",groupValue:addmemberctrl.healthQuestions['physicianQ']??false, onChanged: (v){addmemberctrl.updatequestion('physicianQ', v!);} ,),
                  const SizedBox(height: 10,),
                    RadiobuttonWidget(question: "Have you, ever been suffered form and?",groupValue:addmemberctrl.healthQuestions['cardiacQ']??false, onChanged: (v){addmemberctrl.updatequestion('cardiacQ', v!);} ,),
                  const SizedBox(height: 10,),
                    RadiobuttonWidget(question: "Have you, for any reason, been unable to exercise in the past?",groupValue: addmemberctrl.healthQuestions['respiratoryQ']??false, onChanged: (v){addmemberctrl.updatequestion('respiratoryQ', v!);} ,),
                  const SizedBox(height: 10,),
                    RadiobuttonWidget(question: "Have you, for any reason, been unable to exercise in the past?",groupValue:addmemberctrl.healthQuestions['faintingQ']??false, onChanged: (v){addmemberctrl.updatequestion('faintingQ', v!);} ,),
                  const SizedBox(height: 10,),
                    RadiobuttonWidget(question: "Have you, for any reason, been unable to exercise in the past?",groupValue: addmemberctrl.healthQuestions['exerciseQ']??false, onChanged: (v){addmemberctrl.updatequestion('exerciseQ', v!);} ,),
                  const SizedBox(height: 10,),
                    RadiobuttonWidget(question: "Have you, for any reason, been unable to exercise in the past?",groupValue:addmemberctrl.healthQuestions['exerciseQ']??false, onChanged: (v){addmemberctrl.updatequestion('exerciseQ', v!);} ,),
                  const SizedBox(height: 10,),
                   SizedBox(
                    width: double.maxFinite,
                     child: Cardonly(
                          onpress: (){
                                   pagectrl.changeaddMemberPage(3);
                                 },
                      child: Text("Go to Next")),
                   )   
                ],
              ),
            ),
          ));
      }
    );
  }
}
