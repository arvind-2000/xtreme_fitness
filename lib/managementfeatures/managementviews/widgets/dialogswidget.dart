import 'package:flutter/material.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';

import '../../../config/const.dart';

class PageDialog extends StatelessWidget {
  const PageDialog(
      {super.key,
      required this.child,
      required this.no,
      required this.yes,
      this.heights});
  final Widget child;
  final VoidCallback no;
  final VoidCallback yes;
  final double? heights;
  @override
  Widget build(BuildContext context) {
    return Dialog(
         insetPadding: const EdgeInsets.all(16),
      alignment: const Alignment(0.25, -0.5),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 400,
        height: heights ?? 600,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Expanded(child: child),
              Row(
                children: [
                  Expanded(
                    child: CardwithShadow(
                        color: Colors.redAccent,
                        onpress: no,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                            padding: MediaQuery.sizeOf(context).width<=mobilescreen? EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4):null,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon(
                            //   Icons.cancel,
                            //   color: Colors.white,
                            // ),
                            Text(
                              "Cancel",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CardwithShadow(
                        color: Colors.green[300],
                        onpress: yes,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                              padding: MediaQuery.sizeOf(context).width<=mobilescreen? EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4):null,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon(
                            //   Icons.check,
                            //   color: Colors.white,
                            // ),
                            Text("OK", style: TextStyle(color: Colors.white)),
                          ],
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
