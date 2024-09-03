import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText(this.text,{super.key,this.size });
 final String text;
 final double? size;
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontFamily: "Montserrat",fontSize: size??26,fontWeight: FontWeight.w500),);

  }
}