import 'package:flutter/material.dart';

class CardsRound extends StatelessWidget {
  const CardsRound({super.key,
  required this.child,
  required this.color
  });
  final Widget child;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(offset: Offset(0.5, 0.5),
          blurRadius: 10,
          blurStyle: BlurStyle.normal,
          spreadRadius: 7,
          color: Colors.black26
          )
        ]
      ),
      child: child,
    );
  }
}