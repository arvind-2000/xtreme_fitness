import 'package:flutter/material.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
      child: Row(
        children: [
          // Left Section
          Expanded(
            flex: 1,
            child: Column(
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
                _buildContactInfo(
                  icon: Icons.location_on,
                  title: 'POSTAL ADDRESS:',
                  content: 'MANTRIPUKHRI,\nIMPHAL EAST, MANIPUR\n795002.',
                ),
                const SizedBox(height: 20),
                _buildContactInfo(
                  icon: Icons.phone,
                  title: 'PHONE:',
                  content: '+91 12345467890',
                ),
                const SizedBox(height: 20),
                _buildContactInfo(
                  icon: Icons.email,
                  title: 'EMAIL:',
                  content: 'noreply@support.xtreme.com',
                ),
              ],
            ),
          ),
          const SizedBox(width: 40),
          // Right Section
          Expanded(
            flex: 2,
            child: Column(
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
                _buildTextField('Name'),
                const SizedBox(height: 10),
                _buildTextField('Email Address'),
                const SizedBox(height: 10),
                _buildTextField('Subject'),
                const SizedBox(height: 10),
                _buildTextField('Your Message', maxLines: 3),
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(
      {required IconData icon,
      required String title,
      required String content}) {
    return Row(
      children: [
        Icon(icon, color: Colors.red, size: 25),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(content),
          ],
        ),
      ],
    );
  }

  Widget _buildTextField(String hint, {int maxLines = 1}) {
    return TextFormField(
      cursorColor: Colors.white,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Color.fromARGB(255, 80, 80, 80)),
        border: const OutlineInputBorder(),
        hintText: hint,
      ),
    );
  }
}
