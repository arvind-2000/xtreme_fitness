import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HeadingText extends StatelessWidget {
  const HeadingText(this.text,{super.key,this.size });
 final String text;
 final double? size;
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontFamily: "Montserrat",fontSize: size??26),).animate().slideX(begin: -1,end: 0);

  }
}