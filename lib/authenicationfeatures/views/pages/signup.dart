import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/createmembers.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';
import 'package:xtreme_fitness/widgets/card.dart';

import '../../../authentifeatures/models/usecasesimpl.dart';
import '../../../config/const.dart';
import '../../../widgets/headingtext.dart';
import '../../../widgets/textformwidget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
    this.changelogin,
    required this.formkey,
  });
  final Function(bool)? changelogin;
  final GlobalKey<FormState> formkey;
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _confirmotp = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();
  final FocusNode _confirmotpfocus = FocusNode();
  final TextEditingController _otp1Controller = TextEditingController();
  final TextEditingController _otp2Controller = TextEditingController();
  final TextEditingController _otp3Controller = TextEditingController();
  final TextEditingController _otp4Controller = TextEditingController();
  // FocusNodes to control focus shifting
  final FocusNode _otp1FocusNode = FocusNode();
  final FocusNode _otp2FocusNode = FocusNode();
  final FocusNode _otp3FocusNode = FocusNode();
  final FocusNode _otp4FocusNode = FocusNode();

  final FocusNode _phonefocus = FocusNode();
  final AuthenticateUseCases _authUseCases = AuthenticateUseCases();

  Future<bool> validateform(
      String email, String pass, String phone, String name) async {
    // Validate returns true if the form is valid, or false otherwise.
    if (widget.formkey.currentState!.validate()) {
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
    return GetBuilder<GetxLandingcontroller>(builder: (landingcontroller) {
      return GetBuilder<GetxAuthController>(builder: (authctrl) {
        return Container(
          padding: EdgeInsets.all(
              MediaQuery.sizeOf(context).width <= mobilescreen ? 16 : 32),
          alignment: Alignment.center,
          // color: Theme.of(context).colorScheme.primary,
          child: SizedBox(
            // width: MediaQuery.sizeOf(context).width > 300 ? 400 : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          // Get.offAndToNamed('/home');
                          authctrl.signupclose();
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
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: authctrl.numberexists != null &&
                          authctrl.numberexists == false
                      ? const HeadingText('OTP Verification', size: 20)
                      : const HeadingText('Membership Registration', size: 20),
                ),
                Form(
                    key: widget.formkey,
                    child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          authctrl.numberexists != null &&
                                  authctrl.numberexists == false
                              ? const SizedBox()
                              : const SizedBox(
                                  height: 30,
                                ),
                          authctrl.numberexists != null &&
                                  authctrl.numberexists == false
                              ? const SizedBox()
                              : TextFieldWidget(
                                  counter: 10,
                                  hint: "Phone",
                                  icon: const Icon(Icons.phone),
                                  controller: _phonecontroller,
                                  focusnode: _phonefocus,
                                  enabletext: !authctrl.otploading,
                                  // nextfocusnode: _passwordfocus,
                                  validator: () {
                                    return _authUseCases.phoneAuth(
                                        _phonecontroller.text.trim(),
                                        "Phone Number");
                                  },
                                  fieldsubmitted: () {
                                    authctrl.signup(_phonecontroller.text);
                                  },
                                ),
                          authctrl.numberexists != null &&
                                  authctrl.numberexists == false
                              ? const SizedBox()
                              : const SizedBox(
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
                                        textalign: TextAlign.center,
                                        showhint: false,
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
                                      if (widget.formkey.currentState!
                                          .validate()) {
                                        if (authctrl.otp != null) {
                                          if (authctrl
                                              .confirmotp(_confirmotp.text)) {
                                            print('otp confirm here page');
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CreateXtremers(
                                                        phonenumber:
                                                            _phonecontroller
                                                                .text,
                                                        services:
                                                            landingcontroller
                                                                .services,
                                                      )),
                                            );
                                            // Get.to(() => CreateXtremers(
                                            //       phonenumber:
                                            //           _phonecontroller.text,
                                            //       services: landingcontroller
                                            //           .services,
                                            //     ));

                                            setState(() {
                                              otpcorrect = true;
                                            });
                                          } else {
                                            print("otpcorrect false");
                                            setState(() {
                                              otpcorrect = false;
                                            });
                                          }
                                          //confirm otp
                                        } else {
                                          print("authctrl.otp false");
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
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a Member?",
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
                              // Get.offNamed('/login');
                              authctrl.signupclose();
                              widget.changelogin!(true);
                            },
                      child: Text('Log In',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary,
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      });
    });
  }

  Widget _otpTextField(TextEditingController controller, FocusNode currentFocus,
      FocusNode? nextFocus,
      {bool enabletext = true}) {
    return SizedBox(
      width: 50,
      child: TextFormField(
        controller: controller,
        focusNode: currentFocus,
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        cursorColor: Theme.of(context).colorScheme.onPrimary,
        decoration: InputDecoration(
          counterText: "", // Hides the character count
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          enabled: enabletext,
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.onPrimary),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            // Move to the next field when the user enters a digit
            if (nextFocus != null) {
              FocusScope.of(context).requestFocus(nextFocus);
            } else {
              currentFocus
                  .unfocus(); // If it's the last field, unfocus the input
            }
          }
        },
        onFieldSubmitted: (value) {
          currentFocus
              .unfocus(); // When pressing enter, unfocus the current field
        },
      ),
    );
  }
}
  // Helper function to create a single OTP TextField
