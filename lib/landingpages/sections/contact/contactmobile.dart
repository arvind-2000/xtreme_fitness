import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';
import 'package:xtreme_fitness/landingpages/sections/contact/contactwidget.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

class ContactMobile extends StatelessWidget {
  const ContactMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GetxLandingcontroller landingcontroller = Get.put(GetxLandingcontroller());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      color: const Color.fromARGB(255, 29, 28, 28),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 70,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadingText(
                "Contact Us",
                size: 25,
                isbold: true,
              ),
              const SizedBox(height: 10),
              const Divider(color: Colors.red, thickness: 2),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildContactInfo(
                    size: 16,
                    icon: Icons.location_on,
                    title: 'POSTAL ADDRESS:',
                    content: 'MANTRIPUKHRI,\nIMPHAL EAST, MANIPUR\n795002.',
                  ),
                  buildContactInfo(
                    size: 16,
                    icon: Icons.phone,
                    title: 'PHONE:',
                    content: '+91 12345467890',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              buildContactInfo(
                size: 16,
                icon: Icons.email,
                title: 'EMAIL:',
                content: 'noreply@support.xtreme.com',
              ),
            ],
          ),
          const SizedBox(height: 30),
          // Right Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadingText(
                "Send Us A Message",
                size: 20,
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
              buildTextField('Name', null,
                  con: landingcontroller.namecontroller),
              const SizedBox(height: 10),
              buildTextField('Phone Number', null,
                  con: landingcontroller.phonecontroller),
              const SizedBox(height: 10),
              buildTextField('Subject', null,
                  con: landingcontroller.subjectcontroller),
              const SizedBox(height: 10),
              buildTextField('Your Message', 3,
                  con: landingcontroller.messagecontroller),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
