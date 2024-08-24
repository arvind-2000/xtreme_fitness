import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authentifeatures/domain/domainusecases.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/config/manageconfig.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/planentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/dialogswidget.dart';
import 'package:xtreme_fitness/widgets/titletext.dart';

import '../../../../widgets/cardswithshadow.dart';
import '../../../../widgets/textformwidget.dart';

class AddPlanFields extends StatefulWidget {
  AddPlanFields({super.key, required this.onpress});
  final VoidCallback onpress;

  @override
  State<AddPlanFields> createState() => _AddPlanFieldsState();
}

class _AddPlanFieldsState extends State<AddPlanFields> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  
  final TextEditingController _plannamecontroller = TextEditingController();

  final TextEditingController _planamountcontroller = TextEditingController();

  final TextEditingController _plandiscountcontroller = TextEditingController();
  String? _plancat;
  int _durationinmonths = 1;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagementController>(
      builder: (managementctrl) {
        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                        
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TitleText("Add Plans"),
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
                     TextFieldWidget(hint: "Plan Name", controller: _plannamecontroller),
                           const SizedBox(height: 10,),
                      TextFieldWidget(hint: "Amount", controller: _planamountcontroller,),
                      
                        const SizedBox(height: 10,),
                             TextFieldWidget(hint: "Discount", controller: _plandiscountcontroller,validator: (){},),
                        const SizedBox(height: 10,),
                   ],
                 ),
               ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        
                          const Text("Choose Category"),
                          
                          const SizedBox(height: 6,),
                          DropdownMenu(
                          menuStyle: MenuStyle(backgroundColor: WidgetStateColor.resolveWith((states) => Colors.white,)),
                            onSelected: (index){
                              setState(() {
                               _plancat = plancategory[(index??0)%plancategory.length];
                              });
                            },  
                            dropdownMenuEntries: plancategory.asMap().entries.map((e)=>DropdownMenuEntry(value: e.key, label: e.value,style: ButtonStyle(
                              backgroundColor: WidgetStateColor.resolveWith((states) => Colors.white,)
                            ))).toList()),
                        ],
                      ),
                      const SizedBox(width: 16,),
                                Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        
                          const Text("Choose Duration"),
                          
                          const SizedBox(height: 6,),
                          DropdownMenu(
                          menuStyle: MenuStyle(backgroundColor: WidgetStateColor.resolveWith((states) => Theme.of(context).colorScheme.primary,)),
                            onSelected: (index){
                              setState(() {
                                // _plancat = plancategory[(index??0)%plancategory.length];
                                _durationinmonths = index??1;
                              });
                            },  
                            dropdownMenuEntries: duration.map((e)=>DropdownMenuEntry(value: e, label: "$e months",style: ButtonStyle(
                              backgroundColor: WidgetStateColor.resolveWith((states) => Theme.of(context).colorScheme.primary,)
                            ))).toList()),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16,),
                      CardwithShadow(
                color: Theme.of(context).colorScheme.secondary,
                onpress: (){
                  if(_formkey.currentState!.validate()){
                      if(_plancat!=null){
                        Plan plan = Plan(id: Random().nextInt(100), name: _plannamecontroller.text, durationInMonths: _durationinmonths, price: double.tryParse(_planamountcontroller.text)??0, category: _plancat!, discountPercentage:double.tryParse(_plandiscountcontroller.text)??0);
                          showDialog(context: context, builder: (context) => PageDialog(
                            no: () {
                              Navigator.pop(context);
                            },
                            yes: () async{
                               String v = await managementctrl.addplan(plan);
                        widget.onpress();
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Added new plan"),duration: Durations.extralong1,));
                          
                          Navigator.pop(context);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const TitleText("Plans"),
                                  IconButton(onPressed: (){
                                    Navigator.pop(context);
                                  }, icon: const Icon(Icons.close))
                                ],
                              ),
                              const SizedBox(height: 20,),
                              const Text("Plan Name",style: TextStyle(fontSize: 14),),
                              const SizedBox(height: 5,),
                              Text(plan.name,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                              const SizedBox(height: 16,),
                                const Text("Plan Amount",style: TextStyle(fontSize: 14),),
                              const SizedBox(height: 5,),
                              Text(plan.price.toString(),style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                              const SizedBox(height: 16,),
                                    const Text("Plan Duration",style: TextStyle(fontSize: 14),),
                              const SizedBox(height: 5,),
                              Text("${plan.durationInMonths} months",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                              const SizedBox(height: 16,),
                                  const Text("Plan Discount",style: TextStyle(fontSize: 14),),
                              const SizedBox(height: 5,),
                              Text("${plan.discountPercentage}%",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                              const SizedBox(height: 16,),
                                  const Text("Plan Category",style: TextStyle(fontSize: 14),),
                              const SizedBox(height: 5,),
                              Text(plan.category,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                              const SizedBox(height: 16,),
                              Row(
                                children: [
                                  Expanded(child: CardwithShadow(
                                    color: Theme.of(context).colorScheme.error.withOpacity(0.6),
                                    margin: const EdgeInsets.all(16),
                                    child: const Text("Check Plans before Adding?\nPress OK to confirm",textAlign: TextAlign.center,)))
                                ],
                              )
                            ],
                                                    )),);
                      
                      }
                  }
                },
                child: const Row(
          
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add,color: Colors.white,size: 12,),
                  SizedBox(width: 5,),
                  Text("Add a Plan",style: TextStyle(color: Colors.white),)
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