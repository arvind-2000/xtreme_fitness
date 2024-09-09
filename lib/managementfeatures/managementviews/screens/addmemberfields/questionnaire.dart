import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/landingpages/pages/responsivepages.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/radiobuttonwidget.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/cardborder.dart';
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
          margin: EdgeInsets.zero,
          color: Colors.transparent,
     

          
        
        
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TitleText("Questionnaire"),
                                Row(
                          children: [
                              Checkbox(
                                materialTapTargetSize: MaterialTapTargetSize.padded,
                                checkColor: Colors.blue,
                                activeColor: Colors.blue[300],
                                value: addmemberctrl.setallquestionaire, onChanged: (v){
                                  addmemberctrl.setQuestyionaireall(v!);
                                  
                              }),
                            const SizedBox(width: 5,),
                            const Text("Yes to All",style: TextStyle(fontSize: 14),),
                          ],
                        ),
                      ],
                    ),
                    CardBorder(
                         color: Colors.grey,
                         onpress: (){
                                  pagectrl.changeaddMemberPage(3);
                                },
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text(" Next"),
                            SizedBox(width: 5,),                         
                         Icon(Icons.arrow_forward,size:14)
                       ],
                     ))
                  ],
                ),ResponsivePages(
                  issize: false,
                  child1: Column(children: [const SizedBox(height: 30,),
                RadiobuttonWidget(question: "Have you, for any reason, been unable to exercise in the past?",groupValue: addmemberctrl.healthQuestions['exerciseQ']??false, onChanged: (v){addmemberctrl.updatequestion('exerciseQ', v!);} ,),
                const SizedBox(height: 10,),
                  RadiobuttonWidget(question: "Have your  physician ever advised you against exercising?",groupValue:addmemberctrl.healthQuestions['physicianQ']??false, onChanged: (v){addmemberctrl.updatequestion('physicianQ', v!);} ,),
                const SizedBox(height: 10,),
                  RadiobuttonWidget(question: "Have you, ever been suffered from any cardiac (heart) related illness?",groupValue:addmemberctrl.healthQuestions['cardiacQ']??false, onChanged: (v){addmemberctrl.updatequestion('cardiacQ', v!);} ,),
                const SizedBox(height: 10,),
                  RadiobuttonWidget(question: "Have you, ever been suffered from respiratory difficulties?",groupValue: addmemberctrl.healthQuestions['respiratoryQ']??false, onChanged: (v){addmemberctrl.updatequestion('respiratoryQ', v!);} ,),
                const SizedBox(height: 10,),
                  RadiobuttonWidget(question: "Have you, ever been suffered from fainting, migraines or loss of balance?",groupValue:addmemberctrl.healthQuestions['faintingQ']??false, onChanged: (v){addmemberctrl.updatequestion('faintingQ', v!);} ,),
                const SizedBox(height: 10,),
               RadiobuttonWidget(question: "Is there any history of heat disease in your family?",groupValue:addmemberctrl.healthQuestions['heartQ']??false, onChanged: (v){addmemberctrl.updatequestion('heartQ', v!);} ,),
                const SizedBox(height: 10,),
                 ],),
                
                child2:Column(children: [const SizedBox(height: 30,),
                    RadiobuttonWidget(question: "Have you, ever been suffered from any bone joints or muscle related disease?",groupValue: addmemberctrl.healthQuestions['boneQ']??false, onChanged: (v){addmemberctrl.updatequestion('boneQ', v!);} ,),
                const SizedBox(height: 10,),
                
                RadiobuttonWidget(question: "Have you, experienced chest pain while exercising?",groupValue: addmemberctrl.healthQuestions['chestQ']??false, onChanged: (v){addmemberctrl.updatequestion('chestQ', v!);} ,),
                const SizedBox(height: 10,),
                  RadiobuttonWidget(question: "Do you have high blood pressure?",groupValue:addmemberctrl.healthQuestions['bpQ']??false, onChanged: (v){addmemberctrl.updatequestion('bpQ', v!);} ,),
                const SizedBox(height: 10,),
                  RadiobuttonWidget(question: "Do you have elevated cholesterol levels?",groupValue:addmemberctrl.healthQuestions['cholesterolQ']??false, onChanged: (v){addmemberctrl.updatequestion('cholesterolQ', v!);} ,),
                const SizedBox(height: 10,),
                  RadiobuttonWidget(question: "Are you currently taking prescribed medications?",groupValue: addmemberctrl.healthQuestions['medicationQ']??false, onChanged: (v){addmemberctrl.updatequestion('medicationQ', v!);} ,),

                const SizedBox(height: 10,),],),
                ),
                
       
              ],
            ),
          ));
      }
    );
  }
}
