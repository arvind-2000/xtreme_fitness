import 'package:flutter/material.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/forgotpasswordscreen.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/loginscreen.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/signup.dart';

import '../../../../widgets/card.dart';

class LoginDialog extends StatefulWidget {
  const LoginDialog({super.key, this.signupdialog});
  final bool? signupdialog;
  @override
  State<LoginDialog> createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          height: isSignup || isforgot ? 500 : 600,
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
