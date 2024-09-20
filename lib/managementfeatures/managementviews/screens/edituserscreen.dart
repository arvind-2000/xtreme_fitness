import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/userpaymentmodel.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/nodatascreen.dart/nodatascreen.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/profilescreens/memberprofilescreen.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/titletext.dart';

import '../../../config/const.dart';
import '../../../widgets/cardborder.dart';
import '../../../widgets/headingtext.dart';
import '../../../widgets/textformwidget.dart';
import '../../managementdomain/entities.dart/paymententity.dart';
import '../../managementdomain/entities.dart/xtremer.dart';
import '../../managementmodels/calculationusecase.dart';
import '../widgets/scaffolds.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({super.key});

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ManagementController>().getxtremer();
  }
  final TextEditingController _searchcontroller = TextEditingController();
  @override
  void dispose() {
    _searchcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxPageController>(
      builder: (pagectrl) {
        return GetBuilder<ManagementController>(
          builder: (managectrl) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             
              children: [
           Padding(
                                padding: const EdgeInsets.all(16.0),
                                child:Column(

                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // const Text("All Members",style: TextStyle(fontSize: 20,),),

                                    HeadingText("All Payments"),
                                    
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height:60,
                                          width:MediaQuery.sizeOf(context).width<mobilescreen?double.maxFinite: 400,
                                          child: TextFieldWidget(
                                              showhint:false,
                                              hint: "Search by transaction id",
                                              controller: _searchcontroller,
                                              validator: () {
                                                                          
                                                                          
                                              },
                                              onchanged: (text) {
                                                      managectrl.searchpayments(text);
                                              },
                                              fieldsubmitted: (){
                                                managectrl.searchpayments(_searchcontroller.text);
                                                _searchcontroller.clear();
                                              },
                                            
                                              icon: const Icon(Icons.search)),
                                        ),
                                            
                                            const SizedBox(height: 10,),
                                                                        Text(managectrl.searchmessage!),
                                      ],
                                    ),
                                   
                                    const SizedBox(
                                      width: 10,
                                    ),
                                
                                    // const Expanded(
                                    //     child: Row(
                                    //   children: [],
                                    // )),
                                    // Cardonly(
                                    //   onpress: (){},
                                    //   color: Theme.of(context).colorScheme.secondary,child: Text("Search",style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),),)
                                  ],
                                ),
                              ),
                       
              Expanded(child:managectrl.getsearchpayments.isEmpty?const NodataScreen(title: "Payments", desc: "No payment Records") :ListView.builder(
                itemCount: managectrl.getsearchpayments.length,
                itemBuilder: (c,i)=> ListCard(payment: managectrl.getsearchpayments[i] ,userss: (){  Get.dialog(Dialog(
                    child: SizedBox(
                      width: 500,
                      height: 600,
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             SizedBox(height: 16,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                HeadingText("Payment Details"),
                                IconButton(onPressed: (){
                                  Navigator.pop(context);
                                }, icon: Icon(Icons.close,size:16,))
                              ],
                            ),
                             SizedBox(height: 16,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                          Row(
                                    children: [
                                      Text("Transaction Id",style: TextStyle(fontSize: 14),),
                                      SizedBox(width: 10,),
                                      IconButton(onPressed: (){
                                       Clipboard.setData(ClipboardData(text: "${managectrl.getsearchpayments[i].transactionId}"));
                                          CustomSnackbar(context, "Text copied to Clipboard");
                                      }, icon: Icon(Icons.copy,size: 14,color: Colors.grey[300],))
                                    ],
                                  ),
                                   SizedBox(height: 16,),
                                  Text("Payment Method",style: TextStyle(fontSize: 14),),
                                  Text(
                                      "${managectrl.getsearchpayments[i].paymentMethod}"),
                                       SizedBox(height: 16,),
                         
                                  Text(
                                      "${managectrl.getsearchpayments[i].transactionId}"),
                                       SizedBox(height: 16,),
                                  Text("Amount",style: TextStyle(fontSize: 14),),
                                  Text(
                                      "${managectrl.getsearchpayments[i].receivedAmount}",style: TextStyle(fontSize: 16),),
                                       SizedBox(height: 16,),
                                  Text("Date",style: TextStyle(fontSize: 14),),
                                  Text(
                                      "${managectrl.getsearchpayments[i].paymentDate.day}/${managectrl.getsearchpayments[i].paymentDate.month}/${managectrl.getsearchpayments[i].paymentDate.year}",style: TextStyle(fontSize: 16),),
                                  SizedBox(height: 16,),
                             
                                ],
                              ),
                            ),

                            SizedBox(width: double.maxFinite,child: CardBorder(
                                margin: EdgeInsets.zero,
                              color: Colors.blue,
                              onpress: (){
                                createAndPrintPdf(Paymententity(id: managectrl.getsearchpayments[i].id, userId: managectrl.getsearchpayments[i].userId!, amount: managectrl.getsearchpayments[i].amount!, discountPercentage: managectrl.getsearchpayments[i].discountPercentage!.toDouble(), receivedAmount: managectrl.getsearchpayments[i].receivedAmount, paymentDate: managectrl.getsearchpayments[i].paymentDate, transactionId:managectrl.getsearchpayments[i].transactionId!, paymentStatus: managectrl.getsearchpayments[i].paymentStatus!, paymentMethod:managectrl.getsearchpayments[i].paymentMethod!, paymentType: managectrl.getsearchpayments[i].paymentType!, subscriptionId: managectrl.getsearchpayments[i].subscriptionId, serviceUsageId: managectrl.getsearchpayments[i].serviceUsageId, termsAndConditions: true));
                              },
                              child: Center(child: Text("Print Receipt",style: TextStyle(fontSize: 16),))),)
                          ],
                        ),
                      ),
                    ),
                  ));}),).animate().slideX(begin: 1,end: 0)),
                         const SizedBox(height: 40,)
              ],
            );
          }
        );
      }
    );
  }
}

class ListCard extends StatelessWidget {
  const ListCard({
    super.key,required this.payment, required this.userss,
  });

  final Alluserpaymentmodel payment;
  final VoidCallback userss;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxPageController>(
      builder: (pagectrl) {
        return CardwithShadow(
                    margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          
                            TitleText("Id:${payment.transactionId}",size: 16,),
                            SizedBox(height: 10,),
                            Text("Payment Type"),
                            Text(payment.paymentType != null?payment.paymentType!:"",style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 6,),
                           
                          ],
                                                ),
                        ),
        
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                      
                            CardwithShadow(
                              padding: EdgeInsets.symmetric(vertical: 8,horizontal: 32),
                              onpress: userss,
                                color: Colors.blue,
                              child: Text("View")),
                              SizedBox(height: 16,),
                               Text('${payment.paymentDate.day}/${payment.paymentDate.month}/${payment.paymentDate.year}',style: TextStyle(fontSize: 14)),

                          ],
                        )
                      ],
                    ));
      }
    );
  }
}