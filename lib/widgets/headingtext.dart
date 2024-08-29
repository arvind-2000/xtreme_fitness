import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HeadingText extends StatelessWidget {
  const HeadingText(this.text,{super.key,this.size, this.color, this.isbold = false });
 final String text;
 final double? size;
 final Color? color;
 final bool isbold;



  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontFamily: "Montserrat",fontSize: size??26,fontWeight: isbold?FontWeight.bold:null,foreground: Paint()..shader =  LinearGradient(
     
     begin: Alignment.centerLeft,
     end: Alignment.bottomRight,
  colors:[const Color.fromARGB(193, 255, 255, 255),Colors.red],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)) ),).animate().slideY(begin: 0.5,end: 0).fadeIn();

  }
}