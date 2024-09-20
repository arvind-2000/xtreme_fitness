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
    required this.xtremer,
    required this.userid,
  });

  final Xtremer? xtremer;
  final int? userid;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagementController>(
      builder: (managectrl) {
        return Expanded(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                HeadingText("Service History"),
                SizedBox(height: 16,),
                xtremer==null || userid==null?Center(child:  Text("No Service Used")) :
                ListView(
                  shrinkWrap: true,
                  children:managectrl.getallpayments.where((element) => element.userId==xtremer!.XtremerId && element.paymentStatus!.toLowerCase()=="success",).map((e) => Cardonly(
                             color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Payment Details"),
                          Text("${e.paymentType}",style: const TextStyle(fontSize: 16),),
                          SizedBox(height:10),
                           Row(
                             children: [
                      
                
                                  Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Row(
                                     children: [
                                       Text("Transaction ID"),
                                       SizedBox(width: 10,),
                                       IconButton(onPressed: (){
                    
                                            Clipboard.setData(ClipboardData(text: "${e.transactionId}"));
                                            CustomSnackbar(context, "Text copied to Clipboard");
                                       }, icon: Icon(Icons.copy,size: 14,
                                       
                                       ),tooltip: "Copy transaction id",)
                                     ],
                                   ),
                                                                         Text("${e.transactionId}",),
                                 ],
                               ),
                             ],
                           ),
                          SizedBox(height:10),
                          ],
                                                      ),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: [
                                                          CardBorder(
                                                            margin: EdgeInsets.zero,
                                                            color: Colors.green,
                                                            onpress: (){
                                                              createAndPrintPdf(Paymententity(id: e.id, userId: e.userId!, amount: e.amount!, discountPercentage: e.discountPercentage!.toDouble(), receivedAmount: e.receivedAmount, paymentDate: e.paymentDate, transactionId: e.transactionId!, paymentStatus: e.paymentStatus!, paymentMethod: e.paymentMethod!, paymentType: e.paymentType!, subscriptionId: e.subscriptionId, serviceUsageId: e.serviceUsageId, termsAndConditions:true));
                                                            },
                                                            child: Text("print PDF")),
                                                            SizedBox(height: 16,),
                                                              Text("${e.paymentDate.day} / ${e.paymentDate.month} /${e.paymentDate.year}")
                                                        ],
                                                      ),
                      ],
                    )),).toList()
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}