import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/calculationusecase.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/paymentstatuscard.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';

import '../../../../widgets/textformwidget.dart';
import '../../../../widgets/titletext.dart';
import '../../widgets/dialogswidget.dart';

class CreateMember extends StatefulWidget {
  const CreateMember({super.key, this.phone, this.renewal, this.buttontext, this.callback});
  final String? phone;
  final int? renewal;
  final String? buttontext;
  final VoidCallback? callback;
  @override
  State<CreateMember> createState() => _CreateMemberState();
}

class _CreateMemberState extends State<CreateMember> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  final GlobalKey<FormState> _formKeys = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool iscash = false;
  
    @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxPageController>(
      builder: (pagectrl) {
        return GetBuilder<AddMemberController>(builder: (addmemberctrl) {
          iscash = addmemberctrl.ispaymentcash;
          return  Cardonly(
              color: Colors.transparent,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child:addmemberctrl.paymentstatus!=0? PaymentStatusCard(callback: () {
                    addmemberctrl.changepaymentstatus(0);
                    
                    if(addmemberctrl.ismember ){
                            Get.toNamed('/home');
                    }else{
                      pagectrl.changeaddMemberPage(0);
                    }
                  },):Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //upload image
                     pagectrl.isrenewalforms?const SizedBox(): SizedBox(
                        height: 100,
                        width: 100,
                        child: CardwithShadow(
                            padding: EdgeInsets.zero,
                            onpress: () {
                              addmemberctrl.pickImage();
                            },
                            child: addmemberctrl.isImageloading
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.blue[300],
                                    ),
                                  )
                                : addmemberctrl.getprofile != null
                                    ? Image.memory(
                                        addmemberctrl.getprofile!,
                                        fit: BoxFit.contain,
                                      )
                                    : const Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Center(
                                          child: Icon(Icons.add_a_photo_outlined),
                                        ),
                                      )),
                      ),
                      const SizedBox(height: 16,),
                      pagectrl.isrenewalforms?const SizedBox(): Text(
                        addmemberctrl.isimagesize==null && addmemberctrl.imagesizeerrors==null
                            ? "Add\nPhoto must be less or equal to 500 x 500 px"
                            :addmemberctrl.imagesizeerrors??"Add photo\nPhoto must be less or equal to 500 x 500 px",
                        style: TextStyle(
                            color:addmemberctrl.isimagesize==null && addmemberctrl.imagesizeerrors==null?Theme.of(context).colorScheme.onSecondary
                                :addmemberctrl.isimagesize!=null && addmemberctrl.isimagesize!? Colors.green[300]
                                : Theme.of(context).colorScheme.error,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                     pagectrl.iseditforms?const SizedBox():Form(
                          key: _formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              pagectrl.isrenewalforms ||  pagectrl.iseditforms?const SizedBox():TextFieldWidget(
                                      enabletext:!addmemberctrl.isloading, 
                                
                                  hint: "User Name", controller: username,),
                             pagectrl.isrenewalforms?const SizedBox():  const SizedBox(
                                height: 16,
                              ),
                               pagectrl.isrenewalforms ||  pagectrl.iseditforms?const SizedBox():TextFieldWidget(
                                enabletext: !addmemberctrl.isloading,
                                hint: "Password",
                                controller: password,
                                obscure: true,
                              ),
                               pagectrl.isrenewalforms ||  pagectrl.iseditforms?const SizedBox():const SizedBox(
                                height: 16,
                              ),
                              addmemberctrl.usererrormessage!=null
                                  ? Cardonly(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .error
                                          .withOpacity(0.5),
                                      child:  Text(
                                          addmemberctrl.usererrormessage!))
                                  : const SizedBox(),
                              const Text(
                                "Bill Details",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                 widget.renewal==null?const SizedBox():  const Text("Admission Fees"),
                                  addmemberctrl.admissionfees != null
                                      ? Text(
                                          "Rs ${addmemberctrl.admissionfees!.price}")
                                      : const SizedBox()
                                ],
                              ),
                              addmemberctrl.selectedplan != null
                                  ? Text(addmemberctrl.selectedplan!.category)
                                  : const SizedBox(),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Price"),
                                  addmemberctrl.selectedplan != null
                                      ? Text(
                                          "Rs ${addmemberctrl.selectedplan!.price}")
                                      : const SizedBox(),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Discount"),
                                  addmemberctrl.selectedplan != null
                                      ? Text(
                                          "${addmemberctrl.selectedplan!.discountPercentage} %")
                                      : const SizedBox(),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Discounted price"),
                                  addmemberctrl.selectedplan != null
                                      ? Text(
                                          "Rs ${addmemberctrl.selectedplan!.price - (addmemberctrl.selectedplan!.price * (addmemberctrl.selectedplan!.discountPercentage / 100))}")
                                      : const SizedBox(),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Total",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  addmemberctrl.selectedplan != null 
                                      ? Text(
                                          "Rs ${total( widget.renewal==null?0: addmemberctrl.admissionfees!=null?addmemberctrl.admissionfees!.price:0, percentprice(addmemberctrl.selectedplan!.price, addmemberctrl.selectedplan!.discountPercentage))}",
                                          style: const TextStyle(fontSize: 20),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
        
                              Row(
                                children: [
                                  Checkbox(value: addmemberctrl.checkdeclaration, onChanged: (value) {
                                     addmemberctrl.changedeclaration(value!);
                                  },),
                                  const Text(
                                   
                                    "By accepting you agree to our terms and privacy policies."),
                                ],
                              ),
                          const SizedBox(height: 16,),
                              
                              Row(
                                children: [
                                  Checkbox(value: addmemberctrl.paymentdeclaration, onChanged: (value) {
                                     addmemberctrl.changepaymentdeclaration(value!);
                                  },),
                                  const InkWell(
                                    child: Text(
                                     
                                      "Agree Terms and Conditions",style: TextStyle(color: Colors.blue),),
                                  ),
                                ],
                              ),
                                                     const SizedBox(
                                height: 16,
                              ),
        
                            ],
                          )),

                          
                              CardwithShadow(
                                  onpress:addmemberctrl.isloading?null:widget.callback ?? (){
        
                                      //  showDialog(context: context, builder:(context) => Dialog(
                                      
                                      //   child: PaymentStatusCard(status: 1,),
                                      //  ));
                                      if(_formkey.currentState!.validate() && addmemberctrl.checkdeclaration&& addmemberctrl.paymentdeclaration){
        
                                        //   if (await addmemberctrl.createuser(
                                        // username.text, password.text)) {
                                          if(true){
                                      showDialog(
                                        context: context,
                                        builder: (context) =>
                                            PaymentDialog(formKeys: _formKeys,phone: widget.phone,username: username.text,pass: password.text,),
                                      );
                                    }
                                      }else{
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(!addmemberctrl.checkdeclaration?"Agree declaration to proceed":"Error")));
                                      }
                                  },
                                  color: Colors.blue[300],
                                  child: addmemberctrl.isloading?Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(
                                        color:Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),
                                      ),
                                    ],
                                  ): Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.money,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        widget.buttontext??"pay",
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ))
                    ],
                  ),
                ),
              ));
        });
      }
    );
  }
}

class PaymentDialog extends StatelessWidget {
  const PaymentDialog({
    super.key,
    required GlobalKey<FormState> formKeys, this.phone, this.username, this.pass,
 
  }) : _formKeys = formKeys;

  final GlobalKey<FormState> _formKeys;
  final String? username;
  final String? pass; 
  final String? phone;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxPageController>(
      builder: (pagectrl) {
        return GetBuilder<AddMemberController>(
          builder: (addmemberctrl) {
            return StatefulBuilder(builder: (context, s) {
                                                      return PageDialog(
              no: () {
                Navigator.pop(context);
              },
              yes: () async{
                bool v = await addmemberctrl.createuser(username, pass,null);
                if(v){
                  addmemberctrl.addXtremer();
                }
                Navigator.pop(context);
              },
              child: Form(
                key: _formKeys,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                      children: [
                        const TitleText(
                            "Payment Method"),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(
                                  context);
                            },
                            icon: const Icon(
                                Icons.close))
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      "Bill Details",
                      style: TextStyle(
                          fontWeight:
                              FontWeight.bold,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  pagectrl.isrenewalforms?const SizedBox():Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                      children: [
                        const Text(
                            "Admission Fees"),
                        addmemberctrl
                                    .admissionfees !=
                                null
                            ? Text(
                                "Rs ${addmemberctrl.admissionfees!.price}")
                            : const SizedBox()
                      ],
                    ),
                    addmemberctrl.selectedplan !=
                            null
                        ? Text(addmemberctrl
                            .selectedplan!.category)
                        : const SizedBox(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                      children: [
                        const Text("Price"),
                        addmemberctrl
                                    .selectedplan !=
                                null
                            ? Text(
                                "Rs ${addmemberctrl.selectedplan!.price}")
                            : const SizedBox(),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                      children: [
                        const Text("Discount"),
                        addmemberctrl
                                    .selectedplan !=
                                null
                            ? Text(
                                "${addmemberctrl.selectedplan!.discountPercentage} %")
                            : const SizedBox(),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                      children: [
                        const Text(
                            "Discounted price"),
                        addmemberctrl
                                    .selectedplan !=
                                null
                            ? Text(
                                "Rs ${addmemberctrl.selectedplan!.price - (addmemberctrl.selectedplan!.price * (addmemberctrl.selectedplan!.discountPercentage / 100))}")
                            : const SizedBox(),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(
                              fontSize: 20),
                        ),
                        addmemberctrl
                                    .selectedplan !=
                                null
                            ? Text(
                                "Rs ${total(addmemberctrl.admissionfees!=null?addmemberctrl.admissionfees!.price:0, percentprice(addmemberctrl.selectedplan!.price, addmemberctrl.selectedplan!.discountPercentage))}",
                                style:
                                    const TextStyle(
                                        fontSize:
                                            20),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    
                    // Row(
                    //   children: [
                    //     Expanded(child: CardwithShadow(
                    //       color: Theme.of(context).colorScheme.error.withOpacity(0.6),
                    //       margin: const EdgeInsets.all(16),
                    //       child: const Text("Check Plans before Adding?\nPress OK to confirm",textAlign: TextAlign.center,)))
                    //   ],
                    // )
                    
                 addmemberctrl.ismember?const SizedBox(): const Text(
                        "Choose Payment Method"),
                   SizedBox(
                      height: phone!=null?0: 16,
                    ),
                  addmemberctrl.ismember?const SizedBox():Row(
                      children: [
                        Radio(
                            activeColor:
                                Colors.blue,
                            value: true,
                           groupValue: addmemberctrl.ispaymentcash,
                            onChanged: (v) {
                              s(() {
                                addmemberctrl
                                    .setpaymentmethod(
                                        v!);
                            
                              });
                            }),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text("Cash"),
                        const SizedBox(
                          width: 16,
                        ),
                        Radio(
                            activeColor:
                                Colors.blue,
                            value: false,
                            groupValue: addmemberctrl.ispaymentcash,
                            onChanged: (v) {
                              s(() {
                                addmemberctrl
                                    .setpaymentmethod(
                                        v!);
                             
                              });
                            }),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text("Online"),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    )
                  ],
                ),
              ));
                                                    });
          }
        );
      }
    );
  }
}
