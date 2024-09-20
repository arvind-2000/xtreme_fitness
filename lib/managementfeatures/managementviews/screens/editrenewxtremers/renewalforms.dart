import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/paymententity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/planentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addmemberfields/createmember.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addmemberfields/doctordetails.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/paymentstatuscard.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/cardborder.dart';
import 'package:xtreme_fitness/widgets/cardborderhover.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';

import '../../../../widgets/headingtext.dart';
import '../../../../widgets/titletext.dart';
import '../../../managementmodels/calculationusecase.dart';
import '../../widgets/dialogswidget.dart';
import '../addmemberfields/addplan.dart';
import '../addmemberfields/personaldetails.dart';
import '../addmemberfields/questionnaire.dart';



class RenewalForms extends StatefulWidget {
  RenewalForms({super.key, this.phonenumber, this.plan, this.callback});
  final String? phonenumber;
  final Plan? plan;
  final VoidCallback? callback;
  @override
  State<RenewalForms> createState() => _RenewalFormsState();
}

class _RenewalFormsState extends State<RenewalForms> {
  final GlobalKey<FormState>  _globalkey = GlobalKey<FormState>();

    @override
  void initState() {

    super.initState();
    Get.put(AddMemberController());
  }
@override
  void dispose() {
    Get.find<AddMemberController>().onClose();
    Get.find<GetxPageController>().disposes();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddMemberController>(
      builder: (addmemberctrl) {
        return GetBuilder<GetxPageController>(
          builder: (pagectrl) {
            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 1000,maxHeight: 800),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                            Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HeadingText("Plan Renewal"),
                              IconButton(onPressed: (){
                                addmemberctrl.onClose();
                                pagectrl.disposes();
                                pagectrl.changerenewal(false);
                                if(widget.callback!=null){
                                     widget.callback!();
                                }
                            
                              }, icon: Icon(Icons.close),tooltip: "Close",)
                            ],
                          ),
                          const SizedBox(height: 40,),
                     addmemberctrl.paymentstatus!=0?PaymentStatusCard(callback: (){
                      addmemberctrl.changepaymentstatus(0);
                     }) : PlanSelectionField(pagectrl: pagectrl,buttontext: 'Renew Plan' ,callback: () {
                              
                              if(addmemberctrl.selectedplan!=null){
                                if(addmemberctrl.selectedplan!.category.toLowerCase()=="personal"){
                                      if(addmemberctrl.gettrainer!=null){

                                            Get.dialog(PaymentDialogs(callback:(){ addmemberctrl.renewalsubmission();  } ));


                                         
                                      }else{
                                         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No trainer selected")));
                                      }
                                }else{
                                            
                                           Get.dialog(PaymentDialogs(callback:(){ addmemberctrl.renewalsubmission();} ));

                  
                                }
                                 
                              }else{
                
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No Plans Selected")));
                              }
                                                
                      },),
                      SizedBox(height: 100,)
                    ],
                  ),
                ),
              ),
            );
          }
        );
      }
    );
  }
}

class PaymentDialogs extends StatelessWidget {
  const PaymentDialogs({
    super.key,
  required this.callback,
 
  });
  final VoidCallback callback;


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
              yes: callback,
              child: Form(

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
                                "Rs ${total(0, percentprice(addmemberctrl.selectedplan!.price, addmemberctrl.selectedplan!.discountPercentage))}",
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
                    
             const Text(
                        "Choose Payment Method"),
                   SizedBox(
                      height:  16,
                    ),
                 Row(
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
                    ),
                    Text('By Clicking ok you agree to our terms and conditions.')
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




