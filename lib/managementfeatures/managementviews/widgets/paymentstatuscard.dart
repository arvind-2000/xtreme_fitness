
import 'package:flutter/material.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/paymententity.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

class PaymentStatusCard extends StatelessWidget {
  const PaymentStatusCard({super.key ,this.color,this.status = 3});
  
  final Color? color;
  final int status;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 600,
      child: CardwithShadow(

        color: color,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Expanded(
               child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       status == 3?CircularProgressIndicator():status == 1?Icon(Icons.check,color: Colors.green,):Icon(Icons.dangerous,color: Theme.of(context).colorScheme.error,),
                     ],
                   ),
                     SizedBox(height: 30,),
                             status == 3?HeadingText("Processing Payment",size: 30):status == 1?HeadingText("Successfull",size: 30,color: Colors.green,):HeadingText("Failed",size: 30),
                             SizedBox(height: 10,),
                             status == 3?Text("The Payment process has been started"):status == 1?Text("The Payment has been successfully processed"):Text("Unfortunately the payment has been declined"),
                             SizedBox(height: 40,),
                             Divider(
                               color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.4),
                             ),
                              Text("Transaction Id"),
                             Text("XtrmPAY1234567",style: TextStyle(fontSize: 20),),
                   SizedBox(height: 10,),
                             Text("Amount"),
                             Text("Rs. 200",style: TextStyle(fontSize: 20),),
                   SizedBox(height: 10,),
                    Text("Discount"),
                             Text("10 %",style: TextStyle(fontSize: 20),),
                   SizedBox(height: 10,),
                    Text("Receive Amount"),
                             Text("Rs. 180",style: TextStyle(fontSize: 20),),
                   SizedBox(height: 10,),
                
                 
                 ],
               ),
             ),

            SizedBox(
              width: double.maxFinite,
              child: Cardonly(
                  color: Colors.blue[200],
                child: Center(child: Text("Download Receipt"))),
            ),



        ],),
      ),
    );
  }
}