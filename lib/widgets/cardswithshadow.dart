import 'package:flutter/material.dart';

class CardwithShadow extends StatelessWidget {
  const CardwithShadow({super.key, this.padding, this.margin, required this.child, this.onpress, this.color});
final EdgeInsets? padding;
final EdgeInsets? margin;
final Widget child;
final VoidCallback? onpress;
final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
    
      margin: margin,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color:color??Theme.of(context).colorScheme.primary
        
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
              onTap: onpress,
        child: Padding(
          padding: padding??const EdgeInsets.all(16),
          child: child,
        )),
    );
  }
}