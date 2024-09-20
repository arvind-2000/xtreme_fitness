import 'package:flutter/material.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/forgotpasswordscreen.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/loginscreen.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/signup.dart';

import '../../../../widgets/card.dart';

class LoginDialogMobile extends StatefulWidget {
  const LoginDialogMobile({super.key, this.signupdialog});
  final bool? signupdialog;
  @override
  State<LoginDialogMobile> createState() => _LoginDialogMobileState();
}

class _LoginDialogMobileState extends State<LoginDialogMobile> {
  bool isforgot = false;
  bool isSignup = false;

  @override
  void initState() {
    super.initState();
    if (widget.signupdialog != null) {
      isSignup = widget.signupdialog!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, state) {
      return Dialog(
        child: SizedBox(
          height: 400,
          width: 200,
          child: Cardonly(
              margin: EdgeInsets.zero,
              color: Colors.grey[800]!.withOpacity(0.6),
              child: isforgot
                  ? ForgotPassWordScreen(
                      changelogin: (v) {
                        state(() {
                          isforgot = v;
                        });
                      },
                    )
                  : isSignup
                      ? SignUpPage(
                          changelogin: (v) {
                            state(() {
                              isSignup = false;
                            });
                          },
                        )
                      : LoginScreen(
                          changesignup: (v) {
                            state(() {
                              isSignup = v;
                            });
                          },
                          changepass: (v) {
                            state(() {
                              isforgot = v;
                            });
                          },
                        )),
        ),
      );
    });
  }
}
