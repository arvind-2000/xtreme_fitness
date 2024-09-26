import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';

import '../../../authentifeatures/models/usecasesimpl.dart';
import '../../../config/const.dart';
import '../../../widgets/card.dart';
import '../../../widgets/headingtext.dart';
import '../../../widgets/textformwidget.dart';
import 'createmembers.dart';

class ForgotPassWordScreen extends StatefulWidget {
  const ForgotPassWordScreen({super.key, this.changelogin, required this.formkey});
  final Function(bool)? changelogin;
  final GlobalKey<FormState> formkey;
  @override
  State<ForgotPassWordScreen> createState() => _ForgotPassWordScreenState();
}

class _ForgotPassWordScreenState extends State<ForgotPassWordScreen> {

  final _formkeyrenewpass = GlobalKey<FormState>();
  bool? _otpcorrect;

  final TextEditingController _phonecontroller = TextEditingController();
  final TextEditingController _otpcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmpasswordcontroller =
      TextEditingController();
  final FocusNode _passwordfocus = FocusNode();
  final FocusNode _confirmpasswordfocus = FocusNode();
  final FocusNode _phonefocus = FocusNode();
  final AuthenticateUseCases _authUseCases = AuthenticateUseCases();
  // final AuthenticateUseCase _authUseCases = AuthenticateUseCase();
  void validateotp() {}

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
    _phonecontroller.dispose();
    _passwordcontroller.dispose();
    _confirmpasswordcontroller.dispose();
    _confirmpasswordfocus.dispose();
    _passwordfocus.dispose();
    _phonefocus.dispose();
    Get.find<GetxAuthController>().disposeforgotpass();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxAuthController>(builder: (authctrl) {
      return Container(
             padding: EdgeInsets.all(  MediaQuery.sizeOf(context).width<=mobilescreen?16:32),
        // color: Theme.of(context).colorScheme.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width > 300 ? 400 : null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                          const Row(
                    
                    children: [
                      Icon(
                        Icons.lock,
                        size: 16,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      HeadingText(
                        'Forgot Password',
                        size: 20,
                      ),
                    ],
                  ),
                      IconButton(
                          onPressed: authctrl.otploading
                              ? null
                              : () {
                                  authctrl.disposeforgotpass();
                                  Navigator.pop(context);
                                  // Get.offAndToNamed('/login');
                                },
                          icon: const Icon(Icons.close)),
                      // SizedBox(height: 10,),
                    ],
                  ),
                  Center(
                    child: Image.asset(
                      'assets/logo2.png',
                      height: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
              
                  const SizedBox(
                    height: 10,
                  ),
                  authctrl.forgotpass != null
                      ? Center(
                          child: Cardonly(
                              child: Column(children: [
                            Icon(
                              authctrl.forgotpass! ? Icons.check : Icons.error,
                              size: 40,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              authctrl.forgotpasserrormessage ?? "Error",
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            // CardBorder(child: Text("Login Now"))
                          ])),
                        )
                      : _otpcorrect != null && _otpcorrect!
                          ? Form(
                              key: _formkeyrenewpass,
                              child: Center(
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    TextFieldWidget(
                                      hint: "Password",
                                      obscure: true,
                                      icon: const Icon(Icons.lock),
                                      controller: _passwordcontroller,
                                      focusnode: _confirmpasswordfocus,
                                      enabletext: !authctrl.otploading,
                                      nextfocusnode: _confirmpasswordfocus,
                                      validator: () {
                                        return _authUseCases.passwordAuth(
                                            _passwordcontroller.text.trim());
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFieldWidget(
                                      hint: "Confirm Password",
                                      icon: const Icon(Icons.lock),
                                      controller: _confirmpasswordcontroller,
                                      obscure: true,
                                      focusnode: _passwordfocus,
                                      enabletext: !authctrl.otploading,
                                      nextfocusnode: _confirmpasswordfocus,
                                      validator: () {
                                        return _passwordcontroller.text !=
                                                _confirmpasswordcontroller.text
                                            ? "Not matched with password"
                                            : null;
                                      },
                                      fieldsubmitted: () {
                                        if (_formkeyrenewpass.currentState!
                                            .validate()) {
                                          authctrl.changepassword(
                                              _passwordcontroller.text.trim());
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    authctrl.forgotpasserrormessage != null
                                        ? Center(
                                                child: Text(
                                            authctrl.forgotpasserrormessage!,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .error),
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
                                                if (_formkeyrenewpass
                                                    .currentState!
                                                    .validate()) {
                                                  authctrl.changepassword(
                                                      _passwordcontroller.text
                                                          .trim());
                                                }
                                              },
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        padding: const EdgeInsets.all(16),
                                        child: Center(
                                          child: authctrl.otploading
                                              ? CircularProgressIndicator(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSecondary,
                                                )
                                              : const Text("Change Password",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                          : Form(
                              key: widget.formkey,
                              child: Center(
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    authctrl.otp != null
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
                                                  _phonecontroller.text.trim(),
                                                  "Phone Number");
                                            },
                                            fieldsubmitted: () {
                                              authctrl.passwordrenew(
                                                  _phonecontroller.text);
                                            },
                                          ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    authctrl.signuperror != null
                                        ? AnimatedOpacity(
                                            duration: Durations.extralong1,
                                            opacity:
                                                authctrl.numberexists! ? 1 : 0,
                                            child: Cardonly(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary
                                                    .withOpacity(0.5),
                                                child: Text(
                                                  authctrl.signuperror!,
                                                  textAlign: TextAlign.center,
                                                )))
                                        : const SizedBox(),
                                    authctrl.otp != null
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
                                    authctrl.otp != null
                                        ? Center(
                                            child: ConstrainedBox(
                                              constraints: const BoxConstraints(
                                                  maxWidth: 300),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                                child: TextFieldWidget(
                                                    hint: 'OTP',
                                                    controller: _otpcontroller,
                                                    enabletext:
                                                        !authctrl.otploading,
                                                    fieldsubmitted: () {
                                                      if (authctrl.otp !=
                                                          null) {
                                                        if (authctrl.confirmotp(
                                                            _otpcontroller
                                                                .text)) {
                                                          Get.to(() =>
                                                              const CreateXtremers());

                                                          setState(() {
                                                            _otpcorrect = true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            _otpcorrect = false;
                                                          });
                                                        }
                                                      }
                                                    }),
                                              ),
                                            ),
                                          )
                                        : const SizedBox(),
                                    !authctrl.otploading &&
                                            _otpcorrect != null &&
                                            _otpcorrect == false
                                        ? Center(
                                                child: Text(
                                            "You have entered a wrong number. Try again",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .error),
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
                                                    if (authctrl.confirmotp(
                                                        _otpcontroller.text)) {
                                                      setState(() {
                                                        _otpcorrect = true;
                                                      });
                                                    } else {
                                                      setState(() {
                                                        _otpcorrect = false;
                                                      });
                                                    }
                                                    //confirm otp
                                                  } else {
                                                    //send otp
                                                    authctrl.passwordrenew(
                                                        _phonecontroller.text);
                                                  }
                                                }
                                              },
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
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
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Go to ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.6)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          authctrl.disposeforgotpass();
                          // Get.offNamed('/login');
                          widget.changelogin!(false);
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
          ],
        ),
      );
    });
  }
}
