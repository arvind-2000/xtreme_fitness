import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authentifeatures/models/usecasesimpl.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/admission.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/roles.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/editcontactinfo/contactcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/dialogswidget.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/scaffolds.dart';
import 'package:xtreme_fitness/widgets/cardborder.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';
import 'package:xtreme_fitness/widgets/textformwidget.dart';

import '../../../widgets/card.dart';
import '../../../widgets/titletext.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ContactController cntrl = Get.put(ContactController());
    return GetBuilder<ManagementController>(builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadingText('Settings'),    
              const SizedBox(height: 20,),
              const Roles(),
              const SizedBox(height: 10,),
              const Admissioncard(),
              const SizedBox(height:10),
              CardwithShadow(child: EditContacts(formKey: _formKey, cntrl: cntrl)),
          
            ],
          ),
        ),
      );
    });
  }
}

class Admissioncard extends StatefulWidget {
  const Admissioncard({
    super.key,
  });

  @override
  State<Admissioncard> createState() => _AdmissioncardState();
}

class _AdmissioncardState extends State<Admissioncard> {
  bool showadmi = false;
  final GlobalKey<FormState> _formkey = GlobalKey();
  final TextEditingController admissionprice = TextEditingController();
  AuthenticateUseCases useCases = AuthenticateUseCases();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    admissionprice.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagementController>(
      builder: (managectrl) {
        return CardwithShadow(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  showadmi?const  HeadingText("Edit Admission Fees",size: 20,) :const  HeadingText("Admission Fees",size: 20,),
                  IconButton(onPressed: (){
                      if(showadmi){
                          //addroles
                        setState(() {
                          showadmi = false;
                        });
                      }else{
                        setState((){
                          showadmi = true;
                          if(managectrl.getAdmission!=null){
                            admissionprice.text = managectrl.getAdmission!.price.toString();
                          }
                        });
                          
                      }

                  }, icon:showadmi?const Icon(Icons.close,size: 14,) : const Icon(Icons.edit,size: 14,),tooltip:showadmi?"Close": "Edit Admission",)
                ],
            
        
              ),
                 const SizedBox(height: 20,),
                 showadmi?ConstrainedBox(
                   constraints: const BoxConstraints(maxWidth: 500),
                   child: Form(key: _formkey,child: Column(children: [
                     TextFieldWidget(hint: "Admission Price", controller: admissionprice,validator: (){
                      try{
                          double.tryParse(admissionprice.text);
                      }on Exception{
                        return "Enter a valid number";
                      }
                     },),
                   
                        const SizedBox(height: 6,),
                        Row(
                          children: [
                            CardBorder(
                              margin: EdgeInsets.zero,
                              onpress: ()async{
                                    //addd roles
                                    if(_formkey.currentState!.validate()){
                                       String v = await managectrl.updateAdmission(Admission(id: managectrl.getAdmission!.id, name: managectrl.getAdmission!.name, price: double.tryParse( admissionprice.text)??0, discountPercentage:  managectrl.getAdmission!.discountPercentage));
                                      CustomSnackbar(context, v);
                                      admissionprice.clear();
                                      setState(() {
                                        showadmi = false;
                                      });
                                    }
                                               
                                  
                              },
                              child: const Center(child: Text("Edit Admission"))),
                          ],
                        )
                   
                   ],)).animate().fadeIn(),
                 ) : Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                      const Text("Admission Price"),
                      const SizedBox(height: 10,),
                      managectrl.getAdmission!=null?Text('Rs. ${managectrl.getAdmission!.price}'):const SizedBox()
                 ],).animate().fadeIn()
            ],
          ),
        );
      }
    );
  }
}

class Roles extends StatefulWidget {
  const Roles({
    super.key,
  });

  @override
  State<Roles> createState() => _RolesState();
}

class _RolesState extends State<Roles> {
  bool showroles = false;
  final GlobalKey<FormState> _formkey = GlobalKey();
  final TextEditingController rolenamecontroller = TextEditingController();
  AuthenticateUseCases useCases = AuthenticateUseCases();

  @override
  void dispose() {
    rolenamecontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagementController>(
      builder: (managectrl) {
        return CardwithShadow(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  showroles?const  HeadingText("Add Roles",size: 20,) :const  HeadingText("Roles",size: 20,),
                  IconButton(onPressed: (){
                      if(showroles){
                          //addroles
                        setState(() {
                          showroles = false;
                        });
                      }else{
                        setState((){
                          showroles = true;
                        });
                          
                      }

                  }, icon:showroles?const Icon(Icons.close,size: 14,) : const Icon(Icons.add,size: 14,),tooltip:showroles?"Close": "Add roles",)
                ],
            
        
              ),
                 const SizedBox(height: 20,),
                 showroles?ConstrainedBox(
                   constraints: const BoxConstraints(maxWidth: 500),
                   child: Form(key: _formkey,child: Column(children: [
                     TextFieldWidget(hint: "RoleName", controller: rolenamecontroller,validator: (){
                       return useCases.nameAuth(rolenamecontroller.text, "Role Name");
                     },),
                   
                        const SizedBox(height: 6,),
                        Row(
                          children: [
                            CardBorder(
                              margin: EdgeInsets.zero,
                              onpress: ()async{
                                    //addd roles
                                    if(_formkey.currentState!.validate()){
                                       String v = await managectrl.addroles(Role(id: 0, roleName: rolenamecontroller.text));
                                      CustomSnackbar(context, v);
                                      rolenamecontroller.clear();
                                      setState(() {
                                        showroles = false;
                                      });
                                    }
                                               
                                  
                              },
                              child: const Center(child: Text("Add Role"))),
                          ],
                        )]).animate().fadeIn(),
                  ))
                : GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      maxCrossAxisExtent: 160,childAspectRatio: 1/0.4), itemBuilder: (context, index) => CardwithShadow(
                                      
                        onpress: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text( managectrl.getallRoles[index].roleName,style: const TextStyle(fontSize: 12),),
                              managectrl.getallRoles[index].roleName.toLowerCase()=="superadmin" ||  managectrl.getallRoles[index].roleName.toLowerCase()=="member" ||managectrl.getallRoles[index].roleName.toLowerCase()=="servicemember" ?const SizedBox() :    Cardonly(
                                
                              
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                padding: EdgeInsets.all(4),
                              
                                onpress: (){
                                  Get.dialog(PageDialog(child: Row(
                                    children: [
                                      Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const HeadingText("Delete Role"),
                                            const SizedBox(height: 20,),
                                            const Text("Role Name"),
                                            const SizedBox(height: 10,),
                                            Text(managectrl.getallRoles[index].roleName)
                                      
                                          ],
                                      
                                      ),
                                    ],
                                  ), no:(){
                                      Get.back();
                                  }, yes: ()async{
                                   String v = await  managectrl.deleteRole(managectrl.getallRoles[index]);
                                    CustomSnackbar(context, v);
                                    Get.back();
                                  }));
                              
                              }, child: const Center(child: Icon(Icons.delete,size: 12,)))
                          ],
                        )),itemCount: managectrl.getallRoles.length,).animate().fadeIn()
            ],
          ),
        );
      }
    );
  }
}

class EditContacts extends StatefulWidget {
  const EditContacts({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.cntrl,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final ContactController cntrl;

  @override
  State<EditContacts> createState() => _EditContactsState();
}

class _EditContactsState extends State<EditContacts> {
  bool isEdit = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             isEdit?const HeadingText('Edit Contact Info',size: 20,): const HeadingText('Contact Info',size: 20,),
             IconButton(onPressed: (){
                      if(isEdit){
                          //addroles
                        setState(() {
                          isEdit = false;
                        });
                      }else{
                        setState((){
                          isEdit = true;
                        });
                          
                      }

                  }, icon:isEdit?const Icon(Icons.close,size: 14,) : const Icon(Icons.edit,size: 14,),tooltip:isEdit?"Close": "Edit Contact Info",)
                
           ],
         ),
          const SizedBox(
            height: 20,
          ),
       isEdit?Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  TextFieldWidget(
                    enabletext: isEdit,
                    hint: "Address",
                    controller: widget.cntrl.addresscon,
                    counter: 100,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    enabletext: isEdit,
                    hint: "Pin Code",
                    controller: widget.cntrl.pincodecon,
                    counter: 50,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                      enabletext: isEdit,
                      hint: "Phone Number",
                      controller: widget.cntrl.phonecon,
                      counter: 50),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                      enabletext: isEdit,
                      hint: "Email",
                      controller: widget.cntrl.mailcon,
                      counter: 50),
                ],
              ),
            ),
          ).animate().fadeIn():Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
               const SizedBox(
                    height: 16,
                  ),
                  const TitleText("Address",size:16),
                   const SizedBox(height:5),
                  Text(widget.cntrl.contact?.address??"",style:const TextStyle(fontSize: 14)),
                  const SizedBox(
                    height: 10,
                  ),
                          const TitleText("PinCode",size:16),
                   const SizedBox(height:5),
                  Text(widget.cntrl.contact?.pinCode??"",style:const TextStyle(fontSize: 14)),
                  const SizedBox(
                    height: 10,
                  ),
                         const TitleText("Phone Number",size:16),
                   const SizedBox(height:5),
                  Text(widget.cntrl.contact?.phoneNumber??"",style:const TextStyle(fontSize: 14)),
                  const SizedBox(
                    height: 10,
                  ),
                         const TitleText("Email",size:16),
                   const SizedBox(height:5),
                  Text(widget.cntrl.contact?.email??"",style:const TextStyle(fontSize: 14)),
                  const SizedBox(
                    height: 10,
                  ),
                
            ]
          ).animate().fadeIn(),
          const SizedBox(height: 20),
          isEdit?Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardwithShadow(
                isShadow: true,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Save',
                  ),
                ),
                onpress: () {
                  widget.cntrl.showDialogforupdate(context);
                  widget.cntrl.updatecontactinfo();
                  setState(() {
                    isEdit = false;
                  });
                },
              )
            ],
          ):const SizedBox()
        ],
      ),
    );
  }
}
