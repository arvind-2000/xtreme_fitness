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
              SizedBox(height: 20,),
              Roles(),
              SizedBox(height: 10,),
              Admissioncard(),
              SizedBox(height:10),
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

                  }, icon:showadmi?const Icon(Icons.close) : const Icon(Icons.edit),tooltip:showadmi?"Close": "Edit Admission",)
                ],
            
        
              ),
                 SizedBox(height: 20,),
                 showadmi?ConstrainedBox(
                   constraints: BoxConstraints(maxWidth: 500),
                   child: Form(key: _formkey,child: Column(children: [
                     TextFieldWidget(hint: "Admission Price", controller: admissionprice,validator: (){
                      try{
                          double.tryParse(admissionprice.text);
                      }on Exception{
                        return "Enter a valid number";
                      }
                     },),
                   
                        SizedBox(height: 6,),
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
                              child: Center(child: Text("Edit Admission"))),
                          ],
                        )
                   
                   ],)).animate().fadeIn(),
                 ) : Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                      Text("Admission Price"),
                      SizedBox(height: 10,),
                      managectrl.getAdmission!=null?Text('Rs. ${managectrl.getAdmission!.price}'):SizedBox()
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

                  }, icon:showroles?Icon(Icons.close) : Icon(Icons.add),tooltip:showroles?"Close": "Add roles",)
                ],
            
        
              ),
                 SizedBox(height: 20,),
                 showroles?ConstrainedBox(
                   constraints: BoxConstraints(maxWidth: 500),
                   child: Form(key: _formkey,child: Column(children: [
                     TextFieldWidget(hint: "RoleName", controller: rolenamecontroller,validator: (){
                       return useCases.nameAuth(rolenamecontroller.text, "Role Name");
                     },),
                   
                        SizedBox(height: 6,),
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
                              child: Center(child: Text("Add Role"))),
                          ],
                        )
                   
                   ],)).animate().fadeIn(),
                 ) : GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 160,childAspectRatio: 1/0.4), itemBuilder: (context, index) => Stack(
                      children: [
                 CardBorder(child: Center(child: Text( managectrl.getallRoles[index].roleName,style: TextStyle(fontSize: 12),))),
                       managectrl.getallRoles[index].roleName.toLowerCase()=="superadmin" ||  managectrl.getallRoles[index].roleName.toLowerCase()=="member" ||managectrl.getallRoles[index].roleName.toLowerCase()=="servicemember" ?SizedBox() :    Positioned(
                          right: 0,
                          top: 0,
                          child: IconButton(onPressed: (){
                              Get.dialog(PageDialog(child: Row(
                                children: [
                                  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        HeadingText("Delete Role"),
                                        SizedBox(height: 20,),
                                        Text("Role Name"),
                                        SizedBox(height: 10,),
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

                          }, icon: const Icon(Icons.close)))
                      ],
                    ),itemCount: managectrl.getallRoles.length,).animate().fadeIn()
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

                  }, icon:isEdit?Icon(Icons.close) : Icon(Icons.edit),tooltip:isEdit?"Close": "edit",)
                
           ],
         ),
          const SizedBox(
            height: 20,
          ),
         Center(
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
          ),
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
          ):SizedBox()
        ],
      ),
    );
  }
}
