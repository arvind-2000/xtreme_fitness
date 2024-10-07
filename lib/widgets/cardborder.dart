import 'package:flutter/material.dart';

class CardBorder extends StatefulWidget {
  const CardBorder(
      {super.key,
      this.padding,
      this.margin,
      required this.child,
      this.onpress,
      this.color});
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget child;
  final VoidCallback? onpress;
  final Color? color;

  @override
  State<CardBorder> createState() => _CardBorderState();
}

class _CardBorderState extends State<CardBorder> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ??
          const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          // color: hover ? Colors.grey.withOpacity(0.3) : null,
          color: hover?Colors.grey.withOpacity(0.3):null,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 1,
            color: widget.color ??
                Theme.of(context).colorScheme.secondary.withOpacity(0.3),
          )),
      child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: widget.onpress,
          onHover: (v) {
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
