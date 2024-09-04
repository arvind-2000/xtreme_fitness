import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/createmembers.dart';
import 'package:xtreme_fitness/widgets/card.dart';

import '../../../authentifeatures/models/usecasesimpl.dart';
import '../../../widgets/headingtext.dart';
import '../../../widgets/textformwidget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController _confirmotp = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();
  final FocusNode _confirmotpfocus = FocusNode();

  final FocusNode _phonefocus = FocusNode();
  final AuthenticateUseCases _authUseCases = AuthenticateUseCases();

  Future<bool> validateform(
      String email, String pass, String phone, String name) async {
    // Validate returns true if the form is valid, or false otherwise.
    if (_formkey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world
      return false;
    } else {
      return false;
    }
  }

  bool otpshow = false;
  bool? otpcorrect;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _phonefocus.requestFocus();
    });
  }

  @override
  void dispose() {
    super.dispose();

    _confirmotp.dispose();
    _confirmotpfocus.dispose();
    _phonecontroller.dispose();

    _phonefocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxAuthController>(builder: (authctrl) {
      return Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        // color: Theme.of(context).colorScheme.primary,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width > 300 ? 400 : null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const HeadingText(
                    'Sign Up',
                    size: 20,
                  ),
                  IconButton(
                      onPressed: () {
                        Get.offAndToNamed('/home');
                        authctrl.signupclose();
                      },
                      icon: const Icon(Icons.close)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Form(
                    key: _formkey,
                    child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),

                          authctrl.numberexists != null &&
                                  authctrl.numberexists == false
                              ? const SizedBox()
                              : TextFieldWidget(
                                  hint: "Phone",
                                  icon: const Icon(Icons.phone),
                                  controller: _phonecontroller,
                                  focusnode: _phonefocus,
                                  enabletext: !authctrl.otploading,
                                  // nextfocusnode: _passwordfocus,
                                  validator: () {
                                    return _authUseCases.phoneAuth(
                                        _phonecontroller.text.trim());
                                  },
                                  fieldsubmitted: () {
                                    authctrl.signup(_phonecontroller.text);
                                  },
                                ),
                          const SizedBox(
                            height: 20,
                          ),
                          authctrl.signuperror != null
                              ? AnimatedOpacity(
                                  duration: Durations.extralong1,
                                  opacity: authctrl.signuperror != null ? 1 : 0,
                                  child: Cardonly(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(0.5),
                                      child: Text(
                                        authctrl.signuperror ?? "",
                                        textAlign: TextAlign.center,
                                      )))
                              : const SizedBox(),
                          authctrl.numberexists != null &&
                                  authctrl.numberexists == false
                              ? Column(
                                  children: [
                                    const Text(
                                            "We have send an OTP to your number")
                                        .animate()
                                        .slideY(begin: 1, end: 0),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(_phonecontroller.text)
                                        .animate()
                                        .slideY(begin: 1, end: 0),
                                  ],
                                )
                              : const SizedBox(),
                          authctrl.numberexists != null &&
                                  authctrl.numberexists == false
                              ? Center(
                                  child: ConstrainedBox(
                                    constraints:
                                        const BoxConstraints(maxWidth: 300),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: TextFieldWidget(
                                        hint: 'OTP',
                                        controller: _confirmotp,
                                        enabletext: !authctrl.otploading,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(),

                          !authctrl.otploading &&
                                  otpcorrect != null &&
                                  otpcorrect == false
                              ? Center(
                                      child: Text(
                                  "You have entered a wrong number. Try again",
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.error),
                                ).animate().slideY(begin: 1, end: 0))
                                  .animate()
                                  .fadeIn()
                              : const SizedBox(),
                          // TextFieldWidget(
                          //   hint: "Password",
                          //   focusnode: _passwordfocus,
                          //   icon: const Icon(Icons.lock),
                          //   obscure: true,
                          //   interactivetext: false,
                          //   nextfocusnode: _confirmpasswordfocus,
                          //   controller: _passwordcontroller,
                          //   validator: () {
                          //     // return _authUseCases
                          //     //     .passwordAuth(_passwordcontroller.text.trim());
                          //   },
                          // ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          // TextFieldWidget(
                          //   hint: "Confirm Password",
                          //   focusnode: _confirmpasswordfocus,
                          //   icon: const Icon(Icons.lock),
                          //   obscure: true,
                          //   autovalidateMode: AutovalidateMode.disabled,
                          //   interactivetext: false,
                          //   fieldsubmitted: () async {
                          //     bool v = await validateform(

                          //         _emailcontroller.text,
                          //         _passwordcontroller.text,
                          //         _phonecontroller.text,
                          //         _namecontroller.text);

                          // // pageprov.changePage(v?0:1);

                          //   },
                          //   controller: _confirmpasswordcontroller,
                          //   validator: () {
                          //     return _confirmpasswordcontroller.text !=
                          //             _passwordcontroller.text
                          //         ? 'Must be same with password'
                          //         : null;
                          //   },
                          // ),

                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.maxFinite,
                            child: Cardonly(
                              margin: EdgeInsets.zero,
                              onpress: authctrl.otploading
                                  ? null
                                  : () async {
                                      if (_formkey.currentState!.validate()) {
                                        if (authctrl.otp != null) {
                                          if (authctrl
                                              .confirmotp(_confirmotp.text)) {
                                            Get.to(() => CreateXtremers(
                                                  phonenumber:
                                                      _phonecontroller.text,
                                                ));

                                            setState(() {
                                              otpcorrect = true;
                                            });
                                          } else {
                                            setState(() {
                                              otpcorrect = false;
                                            });
                                          }
                                          //confirm otp
                                        } else {
                                          //send otp
                                          authctrl
                                              .signup(_phonecontroller.text);
                                          setState(() {
                                            otpshow = true;
                                          });
                                        }
                                      }
                                    },
                              color: Theme.of(context).colorScheme.secondary,
                              padding: const EdgeInsets.all(16),
                              child: Center(
                                child: authctrl.otploading
                                    ? CircularProgressIndicator(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                      )
                                    : Text(
                                        authctrl.otp == null
                                            ? "Send OTP"
                                            : 'Confirm OTP',
                                        style: const TextStyle(
                                          color: Colors.white,
                                        )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an Account?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white60.withOpacity(0.8)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: authctrl.otploading
                        ? null
                        : () {
                            Get.offNamed('/login');
                          },
                    child: Text('Log In',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
