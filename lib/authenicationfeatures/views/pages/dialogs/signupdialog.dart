import 'package:flutter/material.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/loginscreen.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/signup.dart';

import '../../../../widgets/card.dart';

class SignupDialog extends StatelessWidget {
  const SignupDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      
      child: SizedBox(
        height: 600,
        width: 500,
        child: Cardonly(
          color: Colors.grey[800]!.withOpacity(0.6),
          child: const SignUpPage()),
      ),
    );
  }
}