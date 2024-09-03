import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/config/manageconfig.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/user.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/dashboard.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/profilescreens/traineeprofilescreen.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/textformwidget.dart';

import '../../../config/const.dart';
import '../../../widgets/cardborder.dart';
import '../../../widgets/headingtext.dart';
import '../../../widgets/titletext.dart';
import '../widgets/dialogswidget.dart';

class AddStaffScreen extends StatefulWidget {
  const AddStaffScreen({super.key});

  @override
  State<AddStaffScreen> createState() => _AddStaffScreenState();
}

class _AddStaffScreenState extends State<AddStaffScreen> {
  bool isStaffadd = false;
    final GlobalKey<FormState>  _globalkey = GlobalKey<FormState>();
  final TextEditingController _usernamecontroller  = TextEditingController();
  final TextEditingController _fullnamecontroller  = TextEditingController();
  final TextEditingController _passwordcontroller  = TextEditingController();
  final TextEditingController _confirmpasswordcontroller  = TextEditingController();
  final TextEditingController _phonecontroller  = TextEditingController();
  int roleindex = roles.keys.first;
  addstaff(){
    setState(() {
      isStaffadd = !isStaffadd;
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
            return pagectrl.viewprofile && _user!=null?TraineeProfile(user: _user): Row(
          
              children: [
                isStaffadd? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                 
                      children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 const HeadingText("Add Staff",size: 30,),
                                           CardBorder(
                             onpress: addstaff,
                             
                             padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                             child: const Row(
                             children: [
                               Icon(Icons.person,size: 14,),
                               SizedBox(height: 16,),
                               Text("View Staff")
                             ],
                                               ))
                               ],
                             ),
                                     Center(
                                       child: ConstrainedBox(
                                         constraints: const BoxConstraints(maxWidth: 500),
                                         child: Form(
                                            key:_globalkey,
                                           child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                          
                                           children: [
                                            const SizedBox(height: 16,),
                                             TextFieldWidget(hint: "Phone", controller: _phonecontroller),
                                             const SizedBox(height: 10,),
                                             TextFieldWidget(hint: "Full Name", controller: _fullnamecontroller),
                                             const SizedBox(height: 10,),
                                             TextFieldWidget(hint: "Username", controller: _usernamecontroller),
                                             const SizedBox(height: 10,),
                                             TextFieldWidget(hint: "Password", controller: _passwordcontroller,obscure: true,),
                                                                                        
                                             const SizedBox(height: 10,),
                                              TextFieldWidget(hint: "Confirm Password", controller: _confirmpasswordcontroller,obscure: true,validator: (){
                                               if(_confirmpasswordcontroller.text!=_passwordcontroller.text){
                                                 return "Not same as password";
                                               }
                                              },),
                                                                                        
                                                                        const SizedBox(height: 10,),
                                              DropdownButton(
                                               underline: const SizedBox(),
                                               hint: const Text("Choose",style: TextStyle(fontSize: 16),),
                                               value: roleindex,
                                               items:roles.entries.map((e) => DropdownMenuItem(
                                                 value: e.key,
                                                 child: Text(e.value,style: const TextStyle(fontSize: 16)))).toList(),  onChanged: (value) { setState(() {
                                                                         roleindex = value!;
                                                 }); },),
                                             const SizedBox(height: 20,),
                                                                                        
                                             CardwithShadow(
                                               color: Colors.green[300],
                                               onpress: (){
                                                if (_globalkey.currentState!.validate()) {
                                           Staff addstaff = Staff(uid: Random().nextInt(100).toString(), name: _fullnamecontroller.text, phone: _phonecontroller.text, username: _usernamecontroller.text, roleid: Role(roleid:roleindex.toString(), rolename:roles[roleindex]!), isactive: true);
                                         
                                                                                        showDialog(context: context, builder: (context) => PageDialog(
                                                                         no: () {
                                                                           Navigator.pop(context);
                                                                         },
                                                                         yes: () async{
                                               //        String v = await managementctrl.addplan(plan);
                                               // widget.onpress();
                                                                        managectrl.addStaffs(addstaff);
                                               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Added new Staff"),duration: Durations.extralong1,));
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
                                                                               const TitleText("Add Staff"),
                                                                               IconButton(onPressed: (){
                                                                                 Navigator.pop(context);
                                                                               }, icon: Icon(Icons.close))
                                                                             ],
                                                                           ),
                                                                           const SizedBox(height: 20,),
                                                                           const Text("Staff Name",style: TextStyle(fontSize: 14),),
                                                                           const SizedBox(height: 5,),
                                                                           Text(addstaff.name,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                                                           const SizedBox(height: 16,),
                                                                             const Text("Phone",style: TextStyle(fontSize: 14),),
                                                                           const SizedBox(height: 5,),
                                                                           Text(addstaff.phone.toString(),style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                                                           const SizedBox(height: 16,),
                                                                                 const Text("Username",style: TextStyle(fontSize: 14),),
                                                                           const SizedBox(height: 5,),
                                                                           Text(addstaff.username,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                                                           const SizedBox(height: 16,),
                                                                               const Text("Designation",style: TextStyle(fontSize: 14),),
                                                                           const SizedBox(height: 5,),
                                                                           Text(addstaff.roleid.rolename,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                                                           const SizedBox(height: 16,),
                                                                                          
                                                                           Row(
                                                                             children: [
                                                                               Expanded(child: CardwithShadow(
                                                                                 color: Theme.of(context).colorScheme.error.withOpacity(0.6),
                                                                                 margin: const EdgeInsets.all(16),
                                                                                 child: const Text("Check Staff details before Adding?\nPress OK to confirm",textAlign: TextAlign.center,)))
                                                                             ],
                                                                           )
                                                                         ],
                                          )),);
                                                }
                                                 
                                               },
                                               child: const Row(
                                                                                        
                                               mainAxisAlignment: MainAxisAlignment.center,
                                               children: [
                                                 NavTiles(icon: Icons.add,title: "Add Staff",),
                                               ],
                                             ))
                                                                                        
                                           ],
                                         )),
                                       ),
                                     ),
                                  const SizedBox(height: 40,)
                      ],
                    ),
                  ),
                ):
        
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           TitleText("Staff (${managectrl.getallstaff.length})"),
                                           CardBorder(
                        onpress: addstaff,
                        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                        child: const Row(
                        children: [
                          Icon(Icons.add,size: 14,),
                          SizedBox(height: 16,),
                          Text("Add Staff")
                        ],
                      ))
                        ],
                      ),
                      const SizedBox(height: 16,),
                      GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: size<500?1:size<mobilescreen?2: size>mobilescreen && size<1200?3:4,
                                  mainAxisSpacing: 10,
                              
                                  childAspectRatio:  size<500?1:3/3.5,
                              
                                  ),
                        itemCount: managectrl.getallstaff.length,
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
                                  CircleAvatar(backgroundColor: Colors.grey[100],child: const Icon(Icons.person,size: 30,color: Colors.grey,),),
                                  const SizedBox(height: 20,),
                                  TitleText(managectrl.getallstaff[i].name),
                                  const SizedBox(height: 10,),
                                  const Text("phone"),
                                  Text(managectrl.getallstaff[i].phone,style: const TextStyle(fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 6,),
                                     const Text("Designation"),
                                  Text(managectrl.getallstaff[i].roleid.rolename,style: const TextStyle(fontWeight: FontWeight.bold),),
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
                          Text(managectrl.getallstaff[i].name,style: const TextStyle(fontWeight: FontWeight.bold),),
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
                                          pagectrl.changeviewprofile();
                                          _user = managectrl.getallstaff[i];
                                    },
                                    color: const Color.fromARGB(255, 175, 210, 238),
                                    child: const Text("View"))
                                ],
                              )
                            ],
                          )).animate().slideX(begin: 1,end: 0);
                      })
                    ],
                  ),
                ))
        
              ],
            );
          }
        );
      }
    );
  }
}