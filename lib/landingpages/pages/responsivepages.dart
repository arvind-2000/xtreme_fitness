import 'package:flutter/material.dart';
import 'package:xtreme_fitness/responsive/responsive.dart';

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
    return Container(
      color: colors,
      child: Responsive.isMobile(context) || Responsive.isTablet(context)
          ? SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
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
                  Expanded(
                      flex: MediaQuery.of(context).size.width < 1200 ? 4 : 1,
                      child: child1),
                  child2 != null
                      ? Expanded(flex: 1, child: child2!)
                      : const SizedBox(),
                  SizedBox(
                    width: issize ? 100 : 0,
                  ),
                ],
              ),
            ),
    );
  }
}
