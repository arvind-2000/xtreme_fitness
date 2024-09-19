import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton(
      {super.key,
      this.padding,
      this.margin,
      required this.child,
      this.onpress,
      this.color,
      this.isShadow = true});
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget child;
  final VoidCallback? onpress;
  final Color? color;
  final bool isShadow;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            color ?? Theme.of(context).colorScheme.primary,
            Colors.blueAccent, // You can replace this with any other color
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onpress,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
  }
}
