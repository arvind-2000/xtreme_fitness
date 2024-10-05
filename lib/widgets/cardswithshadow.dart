import 'package:flutter/material.dart';

class CardwithShadow extends StatelessWidget {
  const CardwithShadow(
      {super.key,
      this.padding,
      this.margin,
      required this.child,
      this.onpress,
      this.color,
      this.isShadow = true,
      this.height});
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget child;
  final VoidCallback? onpress;
  final Color? color;
  final bool isShadow;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: margin,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color.fromARGB(110, 72, 72, 72)),
        color: color ?? Theme.of(context).colorScheme.primary,
        // boxShadow:color == Colors.transparent?null:[
        //   BoxShadow(
        //     blurRadius: 10,
        //     spreadRadius: 1,
        //     color: Theme.of(context).colorScheme.primary,
        //     offset: const Offset(5, 7)
        //   ),
        //    const BoxShadow(
        //     blurRadius: 10,
        //     spreadRadius: 0.5,

        //     offset: Offset(-5, -7)
        //   ),
        // ],

        //         boxShadow:isShadow?[
        //   BoxShadow(
        //     blurRadius: 10,
        //     spreadRadius: 1,
        //     color: Color.fromARGB(221, 5, 5, 5),
        //     // offset: const Offset(5, 7)
        //   ),

        // ]:null,
      ),
      child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onpress,
          child: Padding(
            padding: padding ?? const EdgeInsets.all(16),
            child: child,
          )),
    );
  }
}
