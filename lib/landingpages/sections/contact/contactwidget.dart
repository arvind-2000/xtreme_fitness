import 'package:flutter/material.dart';

Widget buildContactInfo(
    {required IconData icon,
    required String title,
    required String content,
    double? size}) {
  return Row(
    children: [
      Icon(icon, color: Colors.red, size: size ?? 25),
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

Widget buildTextField(String hint, {int maxLines = 1}) {
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
