import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/scaffolds.dart';
import 'package:xtreme_fitness/widgets/card.dart';

import '../../../config/const.dart';
import '../../../widgets/headingtext.dart';
import '../../../widgets/textformwidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    this.changepass,
    this.changesignup,
    required this.formkey,
  });
  final Function(bool)? changepass;
  final Function(bool)? changesignup;
  final GlobalKey<FormState> formkey;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final FocusNode _passwordfocus = FocusNode();
  final FocusNode _emailfocus = FocusNode();

  Future<bool> validateform(String email, String pass) async {
    return false;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _emailfocus.requestFocus();
    });
  }

  @override
  void dispose() {
    super.dispose();

    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _passwordfocus.dispose();
    _emailfocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxAuthController>(builder: (authctrl) {
      return Padding(
        padding: EdgeInsets.all(
            MediaQuery.sizeOf(context).width <= mobilescreen ? 16 : 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const HeadingText(
                  'Log In',
                  size: 20,
                ),
                IconButton(
                    onPressed: () {
                      // Get.offAndToNamed('/home');

                      authctrl.disposelogin();
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Image.asset(
                'assets/logo2.png',
                height: 40,
              ),
            ),
            Form(
                key: widget.formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedOpacity(
                      opacity: authctrl.loginerrortext == null ? 0 : 1,
                      duration: Durations.extralong1,
                      child: SizedBox(
                        width: double.maxFinite,
                        child: Cardonly(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.5),
                            child: Center(
                                child: Text(authctrl.loginerrortext ?? "",
                                    textAlign: TextAlign.center))),
                      ),
                    ),
                    TextFieldWidget(
                      hint: "Username",
                      icon: const Icon(Icons.person),
                      controller: _emailcontroller,
                      focusnode: _emailfocus,
                      enabletext: !authctrl.loginloading,
                      nextfocusnode: _passwordfocus,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                      hint: "Password",
                      focusnode: _passwordfocus,
                      icon: const Icon(Icons.lock),
                      obscure: true,
                      enabletext: !authctrl.loginloading,
                      fieldsubmitted: () {
                        if (widget.formkey.currentState!.validate()) {
                          authctrl
                              .authenticate(_emailcontroller.text,
                                  _passwordcontroller.text)
                              .then(
                            (value) {
                              if (!value.entries.first.key) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        content: Text(
                                  "Error Logging in",
                                )));
                              }
                            },
                          );
                        }
                      },
                      controller: _passwordcontroller,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FittedBox(
                      alignment: Alignment.bottomLeft,
                      fit: BoxFit.fitWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: authctrl.loginloading
                                ? null
                                : () {
                                    authctrl.disposelogin();
                                    widget.changepass!(true);
                                    // Get.offNamed('/forgotpassword');
                                  },
                            child: Text(
                              "Forgot Password?",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Cardonly(
                        margin: EdgeInsets.zero,
                        // disabledColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                        onpress: authctrl.loginloading
                            ? null
                            : () {
                                if (widget.formkey.currentState!.validate()) {
                                  authctrl
                                      .authenticate(_emailcontroller.text,
                                          _passwordcontroller.text)
                                      .then(
                                    (value) {
                                      if (!value.entries.first.key) {
                                        CustomSnackbar( "Log in Error");
                                      }
                                    },
                                  );
                                }
                              },
                        color: Theme.of(context).colorScheme.secondary,

                        padding: const EdgeInsets.all(16),
                        child: Center(
                          child: authctrl.loginloading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                  backgroundColor: Colors.transparent,
                                )
                              : const Text('Log in',
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.8)),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: authctrl.loginloading
                      ? null
                      : () {
                          authctrl.disposelogin();
                          // Get.offNamed('/signup');
                          widget.changesignup!(true);
                        },
                  child: Text('Register Member',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      )),
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}
