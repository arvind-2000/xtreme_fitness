import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../widgets/card.dart';
import '../../../widgets/cardborder.dart';
import '../../../widgets/headingtext.dart';
import '../../managementdomain/entities.dart/paymententity.dart';
import '../../managementdomain/entities.dart/xtremer.dart';
import '../../managementmodels/calculationusecase.dart';
import '../controllers/managementcontroller.dart';
import 'scaffolds.dart';

class MemberServiceHistory extends StatelessWidget {
  const MemberServiceHistory({
    super.key,
    required this.xtremers,
  });

  final Xtremer xtremers;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagementController>(builder: (managectrl) {
      return ListView(
          shrinkWrap: true,
          // element.userId==managectrl.xtremer!.XtremerId && element.paymentStatus!.toLowerCase()=="success",
          children:managectrl.getallpayments.where((element) =>element.userId==xtremers.XtremerId && element.paymentStatus!.toLowerCase()=="success" ).map((e) => Cardonly(
                  margin: EdgeInsets.symmetric(vertical: 8),
                     color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Payment Details"),
                                    const SizedBox(height:20),
                   Row(
                     children: [
              
        
                          Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Row(
                             children: [
                               const Text("Transaction ID"),
                               const SizedBox(width: 10,),
                               IconButton(onPressed: (){
            
                                    Clipboard.setData(ClipboardData(text: "${e.transactionId}"));
                                    CustomSnackbar(context, "Text copied to Clipboard");
                               }, icon: const Icon(Icons.copy,size: 14,
                               
                               ),tooltip: "Copy transaction id",)
                             ],
                           ),
                                                                 Text("${e.transactionId}",style: TextStyle(
                                                                   fontSize: 14
                                                                 ),),
                         ],
                       ),
                     ],
                   ),
                  const SizedBox(height:5),
                  Text("Payment Method"),
                              Text("${e.paymentMethod}",style: const TextStyle(fontSize: 14),),
                  const SizedBox(height:10),
                
                  ],
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  CardBorder(
                                                    margin: EdgeInsets.zero,
                                                    color: Colors.green,
                                                    onpress: (){
                                                      createAndprintPdf(Paymententity(id: e.id, userId: e.userId!, amount: e.amount!, discountPercentage: e.discountPercentage!.toDouble(), receivedAmount: e.receivedAmount, paymentDate: e.paymentDate, transactionId: e.transactionId!, paymentStatus: e.paymentStatus!, paymentMethod: e.paymentMethod!, paymentType: e.paymentType!, subscriptionId: e.subscriptionId, serviceUsageId: e.serviceUsageId, termsAndConditions:true),
                                                      // name: managectrl.xtremer!.firstName!+managectrl.xtremer!.surname!
                                                      
                                                      );
                                                    },
                                                    child: const Text("Download PDF")),
                                                    const SizedBox(height: 16,),
                                                      Text("${e.paymentDate.day} / ${e.paymentDate.month} /${e.paymentDate.year}",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),)
                                                ],
                                              ),
              ],
            )),).toList()
        );
      }
    );
  }
}
