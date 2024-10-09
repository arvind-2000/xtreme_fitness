import 'package:flutter/material.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/dialogs/mobile/forgotpasswordscreenmobile.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/dialogs/mobile/loginscreen.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/dialogs/mobile/signup.dart';
import 'package:xtreme_fitness/responsive/responsive.dart';

import '../../../../../widgets/card.dart';

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
      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Cardonly(
                    margin: EdgeInsets.zero,
                    color: Colors.grey[800]!.withOpacity(0.6),
                    child: Container(
                      width: Responsive.isTablet(context)
                          ? MediaQuery.of(context).size.width / 2
                          : null,
                      padding: const EdgeInsets.all(16),
                      alignment: Alignment.center,
                      child: isforgot
                          ? ForgotPassWordScreenMobile(
                              changelogin: (v) {
                                state(() {
                                  isforgot = v;
                                });
                              },
                            )
                          : isSignup
                              ? SignUpPageMobile(
                                  changelogin: (v) {
                                    state(() {
                                      isSignup = false;
                                    });
                                  },
                                )
                              : LoginScreenMobile(
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
                                ),
                    )),
              ),
            ],
          ),
        ),
      );
    });
  }
}
