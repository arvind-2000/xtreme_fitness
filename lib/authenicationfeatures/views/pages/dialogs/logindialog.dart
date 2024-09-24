import 'package:flutter/material.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/forgotpasswordscreen.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/loginscreen.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/signup.dart';

import '../../../../config/const.dart';
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
  final _formkey = GlobalKey<FormState>();
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
        insetPadding: EdgeInsets.all(8),
        backgroundColor: Colors.grey[900],
        child: SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500),
              
              child: SizedBox(
                     
              height:  MediaQuery.sizeOf(context).width<=mobilescreen?500:isSignup || isforgot ? 600 : 650,
              child: Cardonly(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
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
                            formkey: _formkey,
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
          ),
        ),
      );
    });
  }
}
