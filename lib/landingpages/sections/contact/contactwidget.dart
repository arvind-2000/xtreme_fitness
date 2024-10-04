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
          Text(
            content,
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ],
      ),
    ],
  );
}

Widget buildTextField(
  String hint,
  int? maxline, {
  required TextEditingController? con,
}) {
  return TextFormField(
    controller: con,
    cursorColor: Colors.white,
    maxLines: maxline ?? 1,
    decoration: InputDecoration(
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 91, 90, 90))),
      hintStyle: const TextStyle(color: Color.fromARGB(255, 80, 80, 80)),
      hintText: hint,
    ),
  );
}
