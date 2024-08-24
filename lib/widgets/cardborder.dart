import 'package:flutter/material.dart';

class CardBorder extends StatelessWidget {
  const CardBorder({super.key, this.padding, this.margin, required this.child, this.onpress, this.color});
final EdgeInsets? padding;
final EdgeInsets? margin;
final Widget child;
final VoidCallback? onpress;
final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin:margin?? const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
 

        border: Border.all(
          width: 1,
             color:color??Theme.of(context).colorScheme.secondary.withOpacity(0.3),
        )
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
              onTap: onpress,
        child: Padding(
          padding: padding??const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          child: child,
        )),
    );
  }
}