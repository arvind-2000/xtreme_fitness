import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/planentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/servicesentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/calculationusecase.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/dialogswidget.dart';
import 'package:xtreme_fitness/widgets/titletext.dart';

import '../../../../widgets/cardswithshadow.dart';
import '../../../../widgets/textformwidget.dart';

class AddServiceField extends StatefulWidget {
  AddServiceField({super.key, required this.onpress, this.edit= false, this.service});
  final VoidCallback onpress;
  final bool edit;
  final ServiceEntity? service;
  @override
  State<AddServiceField> createState() => _AddPlanFieldsState();
}

class _AddPlanFieldsState extends State<AddServiceField> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  
  final TextEditingController _servicenamecontroller = TextEditingController();

  final TextEditingController _xtremeramountcontroller = TextEditingController();
  final TextEditingController _nonxtremeramountcontroller = TextEditingController();

  String? _plancat;

  bool isactives = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.service!=null){
        _servicenamecontroller.text = widget.service!.name;
        _xtremeramountcontroller.text = widget.service!.memberPrice.toString();
        _nonxtremeramountcontroller.text = widget.service!.nonMemberPrice.toString();
        isactives = widget.service!.isactive;
    }
  }

  void changeisActive(bool v){
    setState(() {
      isactives = v;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagementController>(
      builder: (managementctrl) {
        return Center(
          child: ConstrainedBox(
            constraints:const BoxConstraints(maxWidth: 500),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                        
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleText(widget.edit?"Edit Service": "Add Service"),
                      IconButton(onPressed: widget.onpress, icon: const Icon(Icons.close))
                    ],
                  ),
                  const SizedBox(height: 20,),
                //upload image
                  // const SizedBox(height: 100,width: 100,child: CardwithShadow(child: Center(child: Icon(Icons.add_a_photo_outlined),)),),
                  // Text("Photo must be 500 x 500 px",style: TextStyle(color: Theme.of(context).colorScheme.onSurface,fontSize: 14),),
                  // const SizedBox(height: 10,),
               Form(
                key: _formkey,
                 child: Column(
                   children: [
                     TextFieldWidget(hint: "Service Name", controller: _servicenamecontroller),
                           const SizedBox(height: 10,),
                      TextFieldWidget(hint: "Xtremer Price", controller: _xtremeramountcontroller,validator: (){
                        return numberauth(_xtremeramountcontroller.text);
                      },),
                      
                        const SizedBox(height: 10,),
                             TextFieldWidget(hint: "Non X price", controller: _nonxtremeramountcontroller,validator: (){
                               return numberauth(_nonxtremeramountcontroller.text);
                             },),
                        const SizedBox(height: 10,),
                   ],
                 ),
               ),
             widget.edit?isactives?Text("Service Active"):Text("Service Disabled"):SizedBox(),
              widget.edit?Switch(
               activeColor: Colors.blue,
               hoverColor: Colors.blue.withOpacity(0.5),
               activeTrackColor: Colors.white,
              inactiveTrackColor: Colors.grey[300], 
              value: isactives, onChanged:changeisActive,):const SizedBox(), 
                  SizedBox(height: 16,),
                      CardwithShadow(
                color: Theme.of(context).colorScheme.secondary,
                onpress: (){
                  if(_formkey.currentState!.validate()){
                   
                        ServiceEntity service = ServiceEntity(id:widget.edit? widget.service!.id: 0, name:_servicenamecontroller.text, memberPrice:double.tryParse(_xtremeramountcontroller.text)??0,nonMemberPrice:double.tryParse(_nonxtremeramountcontroller.text)??0,durationInMinutes: 30, isactive: isactives);
                          showDialog(context: context, builder: (context) => PageDialog(
                            no: () {
                              Navigator.pop(context);
                            },
                            yes: () async{
                              String d = "";
                              if(widget.edit){
                                print("in service edit");
                                 String v =  await managementctrl.editservice(service);
                                    d= v;
                              }else{
                                  String v = await managementctrl.addservice(service);
                              d= v;
                                }

                           
                        widget.onpress();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(d),duration: Durations.extralong1,));
                          
                          Navigator.pop(context);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TitleText("Services"),
                                  IconButton(onPressed: (){
                                    Navigator.pop(context);
                                  }, icon: Icon(Icons.close))
                                ],
                              ),
                              SizedBox(height: 20,),
                              Text("Service Name",style: const TextStyle(fontSize: 14),),
                              SizedBox(height: 5,),
                              Text(service.name,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                              SizedBox(height: 16,),
                                Text("Xtremer Price",style: const TextStyle(fontSize: 14),),
                              SizedBox(height: 5,),
                              Text(service.memberPrice.toString(),style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                              SizedBox(height: 16,),
                                  Text("Non Xtremer price",style: const TextStyle(fontSize: 14),),
                              SizedBox(height: 5,),
                              Text("${service.nonMemberPrice}",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                              SizedBox(height: 16,),
                              Row(
                                children: [
                                  Expanded(child: CardwithShadow(
                                    color: Theme.of(context).colorScheme.error.withOpacity(0.6),
                                    margin: const EdgeInsets.all(16),
                                    child: const Text("Check Services before Adding?\nPress OK to confirm",textAlign: TextAlign.center,)))
                                ],
                              )
                            ],
                                                    )),);
                    
                      
                  }
                },
                child:  Row(
          
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add,color: Colors.white,size: 12,),
                  SizedBox(width: 5,),
                  Text(widget.edit?"Edit Service":"Add a Service",style: TextStyle(color: Colors.white),)
                ],
              ))
              
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}