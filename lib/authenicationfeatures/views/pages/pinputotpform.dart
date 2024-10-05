import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';

class PinPutForm extends StatelessWidget {
  final Function(String)? onsubmit;
  const PinPutForm({super.key, required this.onsubmit});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
    );
    return GetBuilder<GetxAuthController>(builder: (authctrl) {
      return Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 10),
        child: Pinput(
          onSubmitted: onsubmit,
          length: 4, // Number of digits for the OTP
          defaultPinTheme: defaultPinTheme, // Default styling for the boxes
          focusedPinTheme: defaultPinTheme.copyWith(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue), // Border when focused
            ),
          ),
          submittedPinTheme: defaultPinTheme.copyWith(
            decoration: BoxDecoration(
              color: Colors.grey.shade200, // Background when submitted
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade400),
            ),
          ),
          onCompleted: (pin) {
            authctrl.getonfirmotp(pin);
            // You can handle the OTP code here
            print('OTP Entered: $pin');
          },
          showCursor: true,
          cursor: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: Colors.black,
                height: 2,
                width: 20,
              ),
            ],
          ),
        ),
      );
    });
  }
}
