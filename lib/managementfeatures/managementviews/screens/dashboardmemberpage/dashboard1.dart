import 'package:flutter/material.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

class DashBoardMemberScreen extends StatelessWidget {
  const DashBoardMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(children: [
              SizedBox(
                width: 350,
                child: CardwithShadow(
                  padding: EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadingText("Current Plan",color: Colors.white60,),
                    SizedBox(height: 30,),
                         Text("Plan",style: TextStyle(fontSize: 16,color: Colors.white60)),
                       Text("Personal",style: TextStyle(fontSize: 20)),
                     SizedBox(height: 10,),
                       Text("Trainer",style: TextStyle(fontSize: 16,color: Colors.white60)),
                       Text("Gokul",style: TextStyle(fontSize: 20)),
                       SizedBox(height: 20,),
                    Text("Start",style: TextStyle(fontSize: 16,color: Colors.white60)),
                    SizedBox(height: 6,),
                    Text("04/03/2024",style: TextStyle(fontSize: 20),),
                    SizedBox(height: 10,),
                     Text("End",style: TextStyle(fontSize: 16,color: Colors.white60)),
                     SizedBox(height: 6,),
                     Text("04/03/2024",style: TextStyle(fontSize: 20),),
                     SizedBox(height: 30,),
                      Text("Remaining",style: TextStyle(fontSize: 16,color: Colors.white60),),
                    SizedBox(height: 6,),
                    Text("6 Days",style: TextStyle(fontSize: 28),),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: double.maxFinite,
                      child: CardwithShadow(
                        
                        color: Theme.of(context).colorScheme.secondary,
                        child: Center(child: Text("Renew Plan"))),
                    )
                  ],
                ),
                
                ),
              )     
          ]),
        ),
      ],
    );
  }
}