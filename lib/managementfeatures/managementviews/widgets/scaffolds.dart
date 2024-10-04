import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

void CustomSnackbar(BuildContext context, String message) {
  Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(color: Color.fromARGB(255, 67, 67, 67))),
      backgroundColor: const Color.fromARGB(255, 7, 0, 31),
      // title: HeadingText(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Get.back(); // Closes the dialog
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );
  // ScaffoldMessenger.of(context)
  //                                       .showSnackBar(SnackBar(
  //                                     showCloseIcon: true,
  //                                     width: 500,
  //                                     backgroundColor: Colors.green,
  //                                     behavior:
  //                                         SnackBarBehavior.floating,
  //                                     action: SnackBarAction(
  //                                         label: "View",
  //                                         onPressed: () {}),
  //                                     content: Text(message),
  //                                     duration: Durations.extralong4,
  //                                   ));
}
