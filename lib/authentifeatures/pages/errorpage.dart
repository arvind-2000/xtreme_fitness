import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authentifeatures/pages/homescreen.dart';

import '../widgets/cards.dart';

class ErrorPages extends StatelessWidget {
  const ErrorPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Center(
        child: ConstrainedBox(constraints: BoxConstraints(maxHeight: 400,maxWidth: 500),
        child: Container(
          padding:const  EdgeInsets.all(16),
          width: double.infinity,
          child: CardsRound(color: Theme.of(context).colorScheme.primary, child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('We Are sorry',style: TextStyle(fontSize: 24,color: Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.bold),),
              Text('We cannot find the page',style: TextStyle(fontSize: 16,color: Theme.of(context).colorScheme.onSecondary,fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                    Get.to(HomeScreen());
              }, child:const  Text("Go to Home"))
            ],
          )),
        ),
        
        ),
      )),
    );
  }
}