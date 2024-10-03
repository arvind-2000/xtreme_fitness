import 'package:flutter/material.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';

import '../../../config/const.dart';

class PageDialog extends StatelessWidget {
  const PageDialog({
    super.key,
    required this.child,
    required this.no,
    required this.yes,
    this.allignToCenter,
    this.iscancelreg,
  });
  final bool? allignToCenter;
  final bool? iscancelreg;
  final Widget child;
  final VoidCallback no;
  final VoidCallback yes;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      backgroundColor: Colors.grey[800],
      alignment: allignToCenter != null ? null : const Alignment(0.25, -0.5),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 400,
        // height: heights ?? 400,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              child,
              // Expanded(child: child),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: CardwithShadow(
                        color: Colors.redAccent,
                        onpress: no,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        padding:
                            MediaQuery.sizeOf(context).width <= mobilescreen
                                ? const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 12)
                                : null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon(
                            //   Icons.cancel,
                            //   color: Colors.white,
                            // ),
                            Text(
                              iscancelreg == null ? "Cancel" : "NO",
                              style: const TextStyle(color: Colors.white),
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
                            horizontal: 8, vertical: 12),
                        padding:
                            MediaQuery.sizeOf(context).width <= mobilescreen
                                ? const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 12)
                                : null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon(
                            //   Icons.check,
                            //   color: Colors.white,
                            // ),
                            Text(iscancelreg == null ? "OK" : "YES",
                                style: const TextStyle(color: Colors.white)),
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
