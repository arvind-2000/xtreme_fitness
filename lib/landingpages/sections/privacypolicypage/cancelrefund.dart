import 'package:flutter/material.dart';

import '../../../widgets/headingtext.dart';
import 'termandcondition.dart';

class CancelrefundPage extends StatelessWidget {
  const CancelrefundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            SizedBox(height: 200,
            width: double.maxFinite,
            child: Image.asset('assets/suport.jpg',fit: BoxFit.cover),
            ),
     
          
               const SizedBox(height: 20,),
             Center(
               child: ConstrainedBox(
                 constraints: const BoxConstraints(maxWidth: 800),
                 child: Padding(
                   padding: const EdgeInsets.all(32.0),
                   child: const Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                          const HeadingText("CANCEL AND REFUND",size: 30,isbold: true,),
                             const SizedBox(height: 20,),
                       TitleandSub(title: "CANCELLATION AND REFUND POLICY",subtitle: "1. At XTREME FITNESS, under no circumstances will fees be refunded even if the member discontinues or is unable to carry on with the membership plan.\n2. Membership is non transferable.\n3. Membership transfer subject to approval from the Management of XTREME FITNESS.\n4. Once member registers at the centre or starts working out, no membership fee is refundable or transferable.\n",),
                                   SizedBox(height: 20,),
                       TitleandSub(title: "OTHER IMPORTANT POINTS",subtitle: "1. Membership will be valid only on full payment.\n2. Membership is non-refundable and non-transferable once the registration process is completed at the front desk and the member started working out at the centre. It cannot be exchanged with any group activities or different packages.\n3. Membership is not on usage basis. It is a fee, permitting access to XTREME FITNESS CENTER for a certain prefixed period. The unused number of days cannot be extended nor will the amount be refunded, if not used by the member for any reason.\n4. Membership period starts from the date of registration at the front desk and not from the date the member started using the facility for workout. Under no circumstances will fees be refunded even if the member discontinues or is unable to carry on with the membership plan.\n",),
                                   SizedBox(height: 20,),
                     ],
                   ),
                 ),
               ),
             ),
          ]
        )
      ),
    );
  }
}