import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/trainerentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/user.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/dashboard.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/nodatascreen.dart/nodatascreen.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/profilescreens/traineeprofilescreen.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/textformwidget.dart';

import '../../../../config/const.dart';
import '../../../../widgets/cardborder.dart';
import '../../../../widgets/headingtext.dart';
import '../../../../widgets/titletext.dart';
import '../../widgets/dialogswidget.dart';



class AddTrainerScreen extends StatefulWidget {
  const AddTrainerScreen({super.key});

  @override
  State<AddTrainerScreen> createState() => _AddTrainerScreenState();
}

class _AddTrainerScreenState extends State<AddTrainerScreen> {
    final GlobalKey<FormState>  _globalkey = GlobalKey<FormState>();
  final TextEditingController _usernamecontroller  = TextEditingController();
  final TextEditingController _fullnamecontroller  = TextEditingController();
  final TextEditingController _passwordcontroller  = TextEditingController();
  final TextEditingController _confirmpasswordcontroller  = TextEditingController();
  final TextEditingController _phonecontroller  = TextEditingController();
  bool istrainer = false;
  void addTrainer(){
    setState(() {
      istrainer = !istrainer;
    });
  }

  User? _user;  
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.sizeOf(context).width;
    return GetBuilder<GetxPageController>(
      builder: (pagectrl) {
        return GetBuilder<ManagementController>(
          builder: (managectrl) {
            return pagectrl.viewprofile && _user!=null? TraineeProfile(user: _user,):Row(
              children: [
              istrainer?Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                   
                    children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            HeadingText("Add Trainer",size: 30,),
                                             CardBorder(
                          onpress: addTrainer,
                          margin: const EdgeInsets.only(right: 32),
                          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                          child: const Row(
                          children: [
                            Icon(Icons.person,size: 14,),
                            SizedBox(height: 16,),
                            Text("View Trainer")
                          ],
                                            ))
                          ],
                                            ),
                        ),
                    Expanded(
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 500),
                          child: Form(
                             key:_globalkey,
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                           
                              TextFieldWidget(hint: "Full Name", controller: _fullnamecontroller),
                              const SizedBox(height: 10,),
                          
                              // TextFieldWidget(hint: "Password", controller: _passwordcontroller,obscure: true,),
                                      
                              // const SizedBox(height: 10,),
                              //  TextFieldWidget(hint: "Confirm Password", controller: _confirmpasswordcontroller,obscure: true,validator: (){
                              //   if(_confirmpasswordcontroller.text!=_passwordcontroller.text){
                              //     return "Not same as password";
                              //   }
                              //  },),
                                      
                                
                              const SizedBox(height: 20,),
                                      
                              CardwithShadow(
                                color: Colors.green[300],
                                onpress: (){
                                 if (_globalkey.currentState!.validate()) {
                              TrainerEntity addtrainer = TrainerEntity(id: Random().nextInt(100), name: _fullnamecontroller.text, designation: "Trainer", timing: 'morning',);
                            
                                      showDialog(context: context, builder: (context) => PageDialog(
                                    no: () {
                                      Navigator.pop(context);
                                    },
                                    yes: () async{
                                //        String v = await managementctrl.addplan(plan);
                                // widget.onpress();
                                   managectrl.addTrainer(addtrainer);
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Added new Trainer"),duration: Durations.extralong1,));
                                  _fullnamecontroller.clear();
                                  _confirmpasswordcontroller.clear();
                                  _passwordcontroller.clear();
                                  _usernamecontroller.clear();
                                  _phonecontroller.clear();
                                  
                                  Navigator.pop(context);
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const TitleText("Add Trainer"),
                                          IconButton(onPressed: (){
                                            Navigator.pop(context);
                                          }, icon: const Icon(Icons.close))
                                        ],
                                      ),
                                      const SizedBox(height: 20,),
                                      const Text("Trainer Name",style: TextStyle(fontSize: 14),),
                                      const SizedBox(height: 5,),
                                      Text(addtrainer.name,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                      const SizedBox(height: 16,),
                                        const Text("Designation",style: TextStyle(fontSize: 14),),
                                      const SizedBox(height: 5,),
                                      Text(addtrainer.designation.toString(),style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                      const SizedBox(height: 16,),
                                            const Text("Timing",style: TextStyle(fontSize: 14),),
                                      const SizedBox(height: 5,),
                                      Text(addtrainer.timing,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                               
                                            
                                      Row(
                                        children: [
                                          Expanded(child: CardwithShadow(
                                            
                                            color: Theme.of(context).colorScheme.error.withOpacity(0.6),
                                            margin: const EdgeInsets.all(16),
                                            child: const Text("Check Trainer details before Adding?\nPress OK to confirm",textAlign: TextAlign.center,)))
                                        ],
                                      )
                                    ],
                                                            )),);
                                 }
                                  
                                },
                                child: const Row(
                                      
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  NavTiles(icon: Icons.add,title: "Add Trainer",),
                                ],
                              ))
                                      
                            ],
                          )),
                        ),
                      ),
                    ),
                                const SizedBox(height: 40,)
                    ],
                  ),
                ):
        
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                        const HeadingText("Trainer List",size: 30,),
                                         CardBorder(
                                                    onpress: addTrainer,
                                                    margin: const EdgeInsets.only(right: 32),
                                                    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                                                    child: const Row(
                                                    children: [
                                                      Icon(Icons.add,size: 14,),
                                                      SizedBox(height: 16,),
                                                      Text("Add Trainer")
                                                    ],
                                                  ))
                                                    ],
                                                  ),
                              ),
                    SizedBox(height: 16,),
                    managectrl.getalltrainer.isEmpty?const NodataScreen(title: "No Trainers!!", desc: "Add trainers to get started."):GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: size<500?1:size<mobilescreen?2: size>mobilescreen && size<1200?3:4,
                                mainAxisSpacing: 10,
                            
                                childAspectRatio:  size<500?1:3/3.5,
                            
                                ),
                      itemCount: managectrl.getalltrainer.length,
                      itemBuilder: (c,i){
                      return CardwithShadow(
                        margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                        child: Column(
                          children: [
                            Expanded(
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 20,),
                                CircleAvatar(
                                  backgroundColor: Colors.grey[100],
                                  child: const Icon(Icons.person,size: 30,color: Colors.grey,),),
                                const SizedBox(height: 20,),
                                TitleText(managectrl.getalltrainer[i].name),
                                const SizedBox(height: 10,),
                                   const Text("Designation"),
                                Text(managectrl.getalltrainer[i].designation,style: const TextStyle(fontWeight: FontWeight.bold),),
                                 const SizedBox(height: 6,),
                                     const Text("Timing"),
                                Text(managectrl.getalltrainer[i].timing,style: const TextStyle(fontWeight: FontWeight.bold)),
                               
                              ],
                                                    ),
                            ),
                                    
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CardwithShadow(
                                      padding: EdgeInsets.all(8),
                                 
                                      child: Icon(Icons.edit,color: Colors.white,size: 12,)),
                                    const SizedBox(width: 6,),
                                    CardwithShadow(
                                            onpress: (){
                                              showDialog(context: context, builder: (context) => PageDialog(child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const TitleText("Delete"),
                                  IconButton(onPressed: (){
                                    Navigator.pop(context);
                                  }, icon: const Icon(Icons.close))
                                ],
                              ),
                              const SizedBox(height: 20,),
                                      
                              const Text("User Name"),
                              const SizedBox(height: 5,),
                              Text(managectrl.getalltrainer[i].name,style: const TextStyle(fontWeight: FontWeight.bold),),
                              Expanded(
                            
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(child: CardwithShadow(
                                      color: Theme.of(context).colorScheme.error.withOpacity(0.6),
                                      margin: const EdgeInsets.all(16),
                                      child: const Text("Are you sure you want to delete this user?\nPress Yes to confirm",textAlign: TextAlign.center,)))
                                  ],
                                ),
                              )
                            ],
                                                    ), no: (){
                                                  Navigator.pop(context);
                                              }, yes: (){
                                                managectrl.deleteTrainer(managectrl.getalltrainer[i]);
                                                Navigator.pop(context);
                                              }),);
                                            },
                                        padding: const EdgeInsets.all(8),
                                      color: Colors.red[300]!.withOpacity(0.3),
                                      child: const Icon(Icons.delete,color: Colors.white,size: 12,)),
                                ],),
                                const SizedBox(height: 16,),
                                 CardwithShadow(
                                  onpress: (){
                                    _user = managectrl.getalltrainer[i];
                                      pagectrl.changeviewprofile();
                    
                                  },
                                  color: Color.fromARGB(255, 175, 210, 238),
                                  child: Text("View"))
                              ],
                            )
                          ],
                        )).animate().slideX(begin: 1,end: 0);
                    })
                  ],
                ))
        
              ],
            );
          }
        );
      }
    );
  }
}