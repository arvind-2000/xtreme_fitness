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
      return Dialog(
        insetPadding: Responsive.isTablet(context)
            ? EdgeInsets.zero
            : const EdgeInsets.symmetric(vertical: 200, horizontal: 50),
        child: SizedBox(
          height: Responsive.isTablet(context) ? 500 : null,
          width: Responsive.isTablet(context) ? 400 : null,
          child: Cardonly(
              margin: EdgeInsets.zero,
              color: Colors.grey[800]!.withOpacity(0.6),
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
                        )),
        ),
      );
    });
  }
}
