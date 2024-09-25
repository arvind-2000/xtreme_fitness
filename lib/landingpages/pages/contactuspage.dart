import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';
import 'package:xtreme_fitness/landingpages/sections/contact/contactwidget.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/editcontactinfo/contactcontroller.dart';
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
            ? const Column(
                children: [
                  ContactWdget(),
                  SizedBox(
                    height: 40,
                  ),
                  SendMessageWidget()
                ],
              )
            : const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Section
                  Expanded(
                    flex: 1,
                    child: ContactWdget(),
                  ),
                  SizedBox(width: 40),
                  // Right Section
                  Expanded(
                    flex: 2,
                    child: SendMessageWidget(),
                  ),
                ],
              ),
      ),
    );
  }
}

class SendMessageWidget extends StatelessWidget {
  const SendMessageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GetxLandingcontroller landingcontroller = Get.put(GetxLandingcontroller());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeadingText(
          "Send Us A Message",
          size: 25,
        ),
        // Container(
        //   color: Colors.black,
        //   padding: const EdgeInsets.all(10),
        //   child: const Text(
        //     'Send Us A Message',
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
        const SizedBox(height: 30),
        buildTextField('Name', null, con: landingcontroller.namecontroller),
        const SizedBox(height: 10),
        buildTextField('Phone Number', null,
            con: landingcontroller.phonecontroller),
        const SizedBox(height: 10),
        buildTextField('Subject', null,
            con: landingcontroller.subjectcontroller),
        const SizedBox(height: 10),
        buildTextField('Your Message', null,
            con: landingcontroller.messagecontroller),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            // Add form submission logic here
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: const Text(
            'SUBMIT',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class ContactWdget extends StatelessWidget {
  const ContactWdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ContactController conctrl = Get.put(ContactController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeadingText(
          "Contact Us",
          size: 40,
          isbold: true,
        ),
        const SizedBox(height: 10),
        const Divider(color: Colors.red, thickness: 2),
        const SizedBox(height: 20),
        buildContactInfo(
          icon: Icons.location_on,
          title: 'POSTAL ADDRESS:',
          content: '${conctrl.contact.address}\n${conctrl.contact.pinCode}',
        ),
        const SizedBox(height: 20),
        buildContactInfo(
          icon: Icons.phone,
          title: 'PHONE:',
          content: conctrl.contact.phoneNumber,
        ),
        const SizedBox(height: 20),
        buildContactInfo(
          icon: Icons.email,
          title: 'EMAIL:',
          content: conctrl.contact.email,
        ),
      ],
    );
  }
}
