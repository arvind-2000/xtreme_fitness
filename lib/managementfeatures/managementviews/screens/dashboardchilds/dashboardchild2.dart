import 'package:flutter/material.dart';

import '../../../../config/const.dart';
import '../../../../widgets/titletext.dart';

class DashboardChild2 extends StatelessWidget {
  const DashboardChild2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText("Sales"),
                  SizedBox(height: 5,),
                  Text("Earnings"),

                ],
              ),

                DropdownButton(
                  underline: SizedBox(),
                  hint: Text("Week",style: TextStyle(fontSize: 10),),
                  value: 0,
                  items:List.generate(3, (index) => DropdownMenuItem(
                    value: index,
                    child: Text(dayslist[index],style: const TextStyle(fontSize: 10))),) , onChanged: (value) {  },)
          
            ],
          ),
        ],
      ),
    );
  }
}