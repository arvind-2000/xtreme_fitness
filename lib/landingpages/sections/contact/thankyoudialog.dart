import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

class ThankuDialog extends StatelessWidget {
  final GlobalKey<FormState> formkey;
  const ThankuDialog({super.key, required this.formkey});

  @override
  Widget build(BuildContext context) {
    final GetxLandingcontroller lnd = Get.find<GetxLandingcontroller>();
    return GetBuilder<GetxLandingcontroller>(builder: (_) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            CircleAvatar(
              radius: lnd.isloading ? 25 : 35,
              backgroundColor: lnd.isloading ? Colors.orange : Colors.green,
              child: lnd.isloading
                  ? const CircularProgressIndicator()
                  : const Icon(
                      Icons.check,
                      weight: 20,
                      color: Colors.white,
                      size: 30,
                    ),
            ),
            const SizedBox(height: 16),
            lnd.isloading
                ? const HeadingText(
                    'Please Wait..',
                    size: 18,
                  )
                : const HeadingText(
                    'Thank you for contacting us',
                    size: 25,
                  ),
            const SizedBox(height: 10),
            lnd.isloading
                ? const SizedBox()
                : Column(
                    children: [
                      const Text(
                        'We appreciate that you\'ve taken the time to write us. '
                        'We\'ll get back to you very soon.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 139, 138, 138)),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // formkey.currentState!.reset();

                          lnd.namecontroller.clear();
                          lnd.phonecontroller.clear();
                          lnd.subjectcontroller.clear();
                          lnd.messagecontroller.clear();

                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          backgroundColor: Colors.red,
                        ),
                        child: const Text(
                          'OK',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      );
    });
  }
}
