import 'package:flutter/material.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/loginscreen.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/signup.dart';

import '../../../../widgets/card.dart';

class SignupDialog extends StatefulWidget {
  const SignupDialog({super.key});

  @override
  State<SignupDialog> createState() => _SignupDialogState();
}

class _SignupDialogState extends State<SignupDialog> {
  
  final GlobalKey<FormState> _formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      
      child: SizedBox(
        height: 600,
        width: 500,
        child: Cardonly(
          color: Colors.grey[800]!.withOpacity(0.6),
          child: SignUpPage(formkey: _formkey)),
      ),
    );
  }
}