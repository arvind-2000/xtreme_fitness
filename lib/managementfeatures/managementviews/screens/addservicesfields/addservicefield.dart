import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/planentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/servicesentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/dialogswidget.dart';
import 'package:xtreme_fitness/widgets/titletext.dart';

import '../../../../widgets/cardswithshadow.dart';
import '../../../../widgets/textformwidget.dart';

class AddServiceField extends StatefulWidget {
  AddServiceField({super.key, required this.onpress});
  final VoidCallback onpress;

  @override
  State<AddServiceField> createState() => _AddPlanFieldsState();
}

class _AddPlanFieldsState extends State<AddServiceField> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  
  final TextEditingController _servicenamecontroller = TextEditingController();

  final TextEditingController _xtremeramountcontroller = TextEditingController();
  final TextEditingController _nonxtremeramountcontroller = TextEditingController();

  String? _plancat;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagementController>(
      builder: (managementctrl) {
        return Center(
          child: ConstrainedBox(
            constraints:const BoxConstraints(maxWidth: 500),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                        
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TitleText("Add Service"),
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
                      TextFieldWidget(hint: "Xtremer Price", controller: _xtremeramountcontroller),
                      
                        const SizedBox(height: 10,),
                             TextFieldWidget(hint: "Non X price", controller: _nonxtremeramountcontroller),
                        const SizedBox(height: 10,),
                   ],
                 ),
               ),
               
                  SizedBox(height: 16,),
                      CardwithShadow(
                color: Theme.of(context).colorScheme.secondary,
                onpress: (){
                  if(_formkey.currentState!.validate()){
                   
                        ServiceEntity service = ServiceEntity(id: 0, name:_servicenamecontroller.text, memberPrice:double.tryParse(_xtremeramountcontroller.text)??0,nonMemberPrice:double.tryParse(_nonxtremeramountcontroller.text)??0,durationInMinutes: 30);
                          showDialog(context: context, builder: (context) => PageDialog(
                            no: () {
                              Navigator.pop(context);
                            },
                            yes: () async{
                               String v = await managementctrl.addservice(service);
                        widget.onpress();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Added new Service"),duration: Durations.extralong1,));
                          
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
                child: const Row(
          
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add,color: Colors.white,size: 12,),
                  SizedBox(width: 5,),
                  Text("Add a Service",style: TextStyle(color: Colors.white),)
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