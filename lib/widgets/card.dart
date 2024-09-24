import 'package:flutter/material.dart';

class Cardonly extends StatefulWidget {
  const Cardonly(
      {super.key,
      this.padding,
      this.margin,
      required this.child,
      this.onpress,
      this.color, this.hovercolor});
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget child;
  final VoidCallback? onpress;
  final Color? color;
  final Color? hovercolor;

  @override
  State<Cardonly> createState() => _CardonlyState();
}

class _CardonlyState extends State<Cardonly> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: widget.margin ?? const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color:hover?widget.hovercolor??Theme.of(context).colorScheme.secondary.withOpacity(0.4) :widget.color ?? Theme.of(context).colorScheme.primary,

      ),
      duration: const Duration(milliseconds: 700),
      child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: widget.onpress,
          onHover: (v){
              setState(() {
                hover = v;
              });
          },
          child: Padding(
            padding: widget.padding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: widget.child,
          )),
    );
  }
}
