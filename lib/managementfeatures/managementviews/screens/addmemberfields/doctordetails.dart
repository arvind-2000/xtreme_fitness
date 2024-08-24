import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/textformwidget.dart';

import '../../../../widgets/cardborder.dart';
import '../../../../widgets/cardswithshadow.dart';
import '../../../../widgets/titletext.dart';
import '../../controllers/pagecontroller.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key, required this.pagectrl});
  final GetxPageController pagectrl;

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  final GlobalKey<FormState> _formkey = GlobalKey();

  final TextEditingController _doctorname = TextEditingController();
  final TextEditingController _surgeryname = TextEditingController();
  final TextEditingController _surgerynumber = TextEditingController();
  final TextEditingController _surgeryaddress = TextEditingController();

  // Define FocusNode instances
final FocusNode _doctornameFocusNode = FocusNode();
final FocusNode _surgerynameFocusNode = FocusNode();
final FocusNode _surgerynumberFocusNode = FocusNode();
final FocusNode _surgeryaddressFocusNode = FocusNode();

@override
  void initState() {
    super.initState();

  _doctornameFocusNode.requestFocus();
  }

@override
void dispose() {
  // Dispose TextEditingController instances
  _doctorname.dispose();
  _surgeryname.dispose();
  _surgerynumber.dispose();
  _surgeryaddress.dispose();

  // Dispose FocusNode instances
  _doctornameFocusNode.dispose();
  _surgerynameFocusNode.dispose();
  _surgerynumberFocusNode.dispose();
  _surgeryaddressFocusNode.dispose();

  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AddMemberController>(
      builder: (addmemberctrl) {
        return Cardonly(
          color: Colors.transparent,
          child: Column(
            children: [
              Center(
                child: ConstrainedBox(
                   constraints: const BoxConstraints(maxWidth: 600),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TitleText("Doctor's Details"),
                          CardBorder(child: Text("Skip"))
                        ],
                      ),
                      const SizedBox(height: 16,),
                      Form(
                        key: _formkey,
                        child: Column(
                        children: [
                          TextFieldWidget(hint: "Doctor Name", controller:_doctorname,focusnode: _doctornameFocusNode,nextfocusnode: _surgerynameFocusNode,),
                          const SizedBox(height: 16,),
                          TextFieldWidget(hint: "Surgery Name", controller:_surgeryname,focusnode: _surgerynameFocusNode,nextfocusnode: _surgerynumberFocusNode,),
                             const SizedBox(height: 16,),
                          TextFieldWidget(hint: "Surgery Number", controller:_surgerynumber,focusnode: _surgerynumberFocusNode,nextfocusnode: _surgeryaddressFocusNode, ),
                             const SizedBox(height: 16,),
                          TextFieldWidget(hint: "Surgery Address", controller: _surgeryaddress,focusnode: _surgeryaddressFocusNode,fieldsubmitted: (){
                                if(_formkey.currentState!.validate()){
                                    
                                addmemberctrl.addDoctor(_doctorname.text, _surgerynumber.text, _surgeryname.text, _surgeryaddress.text);
                                  widget.pagectrl.changeaddMemberPage(4);
                                }
                          },),
                             const SizedBox(height: 16,),
                             CardwithShadow(
                              onpress: (){
                                        if(_formkey.currentState!.validate()){
                                    
                                addmemberctrl.addDoctor(_doctorname.text, _surgerynumber.text, _surgeryname.text, _surgeryaddress.text);
                                  widget.pagectrl.changeaddMemberPage(4);
                                }
                                
                
                              },
                              color: Colors.green[300],
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.person),
                                  SizedBox(width: 16,),
                                  Text("Add Doctor"),
                                ],
                              ))
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ],
          ));
      }
    );
  }
}


