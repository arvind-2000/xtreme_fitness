import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';
import 'package:xtreme_fitness/landingpages/sections/contact/contactwidget.dart';
import 'package:xtreme_fitness/landingpages/sections/contact/thankyoudialog.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/editcontactinfo/contactcontroller.dart';
import 'package:xtreme_fitness/responsive/responsive.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

import '../../config/const.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 36, 34, 34),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal:
                MediaQuery.sizeOf(context).width <= mobilescreen ? 16 : 100,
            vertical: 30),
        child: MediaQuery.sizeOf(context).width <= mobilescreen
            ? Column(
                children: [
                  const ContactWdget(),
                  const SizedBox(
                    height: 40,
                  ),
                  SendMessageWidget()
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Section
                  Expanded(
                    flex: Responsive.isMobile(context) ||
                            Responsive.isTablet(context)
                        ? 15
                        : 10,
                    child: const ContactWdget(),
                  ),
                  const SizedBox(width: 40),
                  // Right Section
                  Expanded(flex: 20, child: SendMessageWidget()),
                ],
              ),
      ),
    );
  }
}

class SendMessageWidget extends StatelessWidget {
  // Add a GlobalKey to access the Form

  final _formKey = GlobalKey<FormState>();

  SendMessageWidget({super.key});
  @override
  Widget build(BuildContext context) {
    GetxLandingcontroller landingcontroller = Get.find<GetxLandingcontroller>();

    return Form(
      // Wrap in Form to enable validation
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadingText(
            "Send Us A Message",
            size: 25,
          ),

          const SizedBox(height: 30),

          // Name Field with Validation
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: landingcontroller.namecontroller,
            cursorColor: Colors.white,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 91, 90, 90)),
              ),
              labelText: 'Name',
              labelStyle: TextStyle(color: Color.fromARGB(255, 152, 151, 151)),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null; // Return null if validation passes
            },
          ),
          const SizedBox(height: 15),

          // Phone Number Field with Validation
          TextFormField(
            maxLength: 10,
            autovalidateMode: AutovalidateMode.onUserInteraction,

            controller: landingcontroller.phonecontroller,
            cursorColor: Colors.white,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 91, 90, 90)),
              ),
              labelText: 'Phone Number',
              labelStyle: TextStyle(color: Color.fromARGB(255, 152, 151, 151)),
            ),
            keyboardType: TextInputType
                .phone, // To make it more user-friendly for phone numbers
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                // Simple 10-digit phone number validation
                return 'Please enter a valid 10-digit phone number';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),

          // Subject Field with Validation
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: landingcontroller.subjectcontroller,
            cursorColor: Colors.white,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 91, 90, 90)),
              ),
              labelText: 'Subject',
              labelStyle: TextStyle(color: Color.fromARGB(255, 152, 151, 151)),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a subject';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),

          // Message Field with Validation
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,

            controller: landingcontroller.messagecontroller,
            cursorColor: Colors.white,
            maxLines: 5, // Allow more lines for the message
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 91, 90, 90)),
              ),
              labelText: 'Message',
              labelStyle: TextStyle(color: Color.fromARGB(255, 152, 151, 151)),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a message';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),

          // Submit Button
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Get.dialog(ThankuDialog(
                  formkey: _formKey,
                ));
                landingcontroller.sendmessage();

                // If all fields are valid, show the Thank You dialog
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              backgroundColor: Colors.red,
            ),
            child: const Text(
              'SUBMIT',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactWdget extends StatelessWidget {
  const ContactWdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ContactController conctrl = Get.find<ContactController>();
    return GetBuilder<ContactController>(builder: (_) {
      return conctrl.contact == null
          ? const Column(
              children: [
                Center(
                    child: SizedBox(
                  child: HeadingText('Server Error...'),
                )),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeadingText(
                  "Get in Touch",
                  size: 40,
                  isbold: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(height: 10),
                const Divider(color: Colors.red, thickness: 2),
                const SizedBox(height: 20),
                buildContactInfo(
                  icon: Icons.location_on,
                  title: 'POSTAL ADDRESS:',
                  content:
                      '${conctrl.contact?.address}\n${conctrl.contact?.pinCode}',
                ),
                const SizedBox(height: 20),
                buildContactInfo(
                  icon: Icons.phone,
                  title: 'PHONE:',
                  content: conctrl.contact?.phoneNumber ?? "",
                ),
                const SizedBox(height: 20),
                buildContactInfo(
                  icon: Icons.email,
                  title: 'EMAIL:',
                  content: conctrl.contact?.email ?? "",
                ),
              ],
            );
    });
  }
}
