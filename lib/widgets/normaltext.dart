

import 'package:flutter/material.dart';

class NormalText extends StatelessWidget {
  const NormalText({super.key, required this.text, this.size, this.color});
  final String text;
  final double? size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(overflow: TextOverflow.ellipsis,color: color,fontSize: size));
  }
}