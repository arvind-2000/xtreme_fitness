import 'package:flutter/material.dart';


class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});
  static const String routename = "LandingScreen";

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {



  @override
  Widget build(BuildContext context) {

    return 
   Scaffold(

     body: SafeArea(child: Container(
      child: Row(children: [ ],),
     )

      ),
   );
  }
}