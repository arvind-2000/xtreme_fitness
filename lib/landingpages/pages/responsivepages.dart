import 'package:flutter/material.dart';
import 'package:xtreme_fitness/config/const.dart';

class ResponsivePages extends StatelessWidget {
  const ResponsivePages(
      {super.key,
      required this.child1,
      this.child2,
      this.screenheight,
      this.colors,
      this.issize = true});
  final Widget child1;
  final Widget? child2;
  final double? screenheight;
  final Color? colors;
  final bool issize;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width;
    return Container(
      color: colors,
      child: size <= mobilescreen
          ? SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [child1, child2 ?? const SizedBox()],
                ),
              ),
            )
          : SizedBox(
              height: screenheight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: issize ? 100 : 0,
                  ),
                  Expanded(child: child1),
                  child2 != null ? Expanded(child: child2!) : const SizedBox(),
                  SizedBox(
                    width: issize ? 100 : 0,
                  ),
                ],
              ),
            ),
    );
  }
}
