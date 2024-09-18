import 'package:flutter/material.dart';

import '../config/const.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    super.key,
    required this.size,
    required this.children,
  });

  final double size;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return GridView(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: size < 600
              ? 1
              : size < mobilescreen
                  ? 2
                  : size > mobilescreen && size < 1200
                      ? 3
                      : 4,
          // crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: size < 600
              ? 1 / 1.2
              : size > mobilescreen && size < 1200
                  ? 3 / 5
                  : 3 / 3.3,
        ),
        shrinkWrap: true,
        children: children);
  }
}
