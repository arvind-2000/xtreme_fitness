import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authentifeatures/provider/screenprovider.dart';
import '../../SnackbarFeature/snarckbar.dart';
import '../../widgets/titletext.dart';
import '../models/usecases.dart';
import '../provider/authprovider.dart';
import '../widgets/textformwidget.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key,
  required this.cont
  });
  final BuildContext cont;
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmpasswordcontroller =
      TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();
  final FocusNode _passwordfocus = FocusNode();
  final FocusNode _confirmpasswordfocus = FocusNode();
  final FocusNode _phonefocus = FocusNode();
  final FocusNode _emailfocus = FocusNode();
  final FocusNode _namefocus = FocusNode();

  final AuthenticateUseCase _authUseCases = AuthenticateUseCase();

  Future<bool> validateform(AuthProvider prov, String email, String pass,
      String phone, String name) async {
    // Validate returns true if the form is valid, or false otherwise.
    if (_formkey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      if (await prov.userReg(email, name, pass, phone)) {
        snackBarFeature('Registration', "Registration Successful", widget.cont,
            AnimatedSnackBarType.success);
        return true;
      } else {
        if(context.mounted){
        snackBarFeature('Registration', "Registration error", widget.cont,
            AnimatedSnackBarType.error);
        }

        return false;
      }
    } else {
      snackBarFeature('Credentials', "Wrong credentials",widget.cont,
          AnimatedSnackBarType.error);
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _namefocus.requestFocus();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _confirmpasswordcontroller.dispose();
    _phonecontroller.dispose();
    _passwordfocus.dispose();
    _confirmpasswordfocus.dispose();
    _phonefocus.dispose();
    _emailfocus.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return GetBuilder<Screenprovider>(
      builder: (pagectrl) {
        return GetBuilder<AuthProvider>(
          builder: (authctrl) {
            return Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              // color: Theme.of(context).colorScheme.primary,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width>300?400 : null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                 
                  children: [
                     MediaQuery.sizeOf(context).width<600?const TitleText(""):const SizedBox(),
              const SizedBox(
                                          height: 30,
                                        ),
                  const Text(
                                          'Sign Up',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                    Form(
                        key: _formkey,
                        child: Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                  
                                TextFieldWidget(
                                  hint: "Full Name",
                                  icon: const Icon(Icons.person),
                                  controller: _namecontroller,
                                  focusnode: _namefocus,
                                  nextfocusnode: _emailfocus,
                                  validator: () {
                                    return _authUseCases
                                        .nameAuth(_namecontroller.text.trim());
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFieldWidget(
                                  hint: "Email",
                                    icon: const Icon(Icons.mail),
                                  controller: _emailcontroller,
                                  focusnode: _emailfocus,
                                  nextfocusnode: _phonefocus,
                                  validator: () {
                                    return _authUseCases
                                        .emailAuth(_emailcontroller.text.trim());
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFieldWidget(
                                  hint: "Phone",
                                  icon: const Icon(Icons.phone),
                                  controller: _phonecontroller,
                                  focusnode: _phonefocus,
                                  nextfocusnode: _passwordfocus,
                                  validator: () {
                                    return _authUseCases
                                        .phoneAuth(_phonecontroller.text.trim());
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFieldWidget(
                                  hint: "Password",
                                  focusnode: _passwordfocus,
                                  icon: const Icon(Icons.lock),
                                  obscure: true,
                                  interactivetext: false,
                                  nextfocusnode: _confirmpasswordfocus,
                                  controller: _passwordcontroller,
                                  validator: () {
                                    return _authUseCases
                                        .passwordAuth(_passwordcontroller.text.trim());
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFieldWidget(
                                  hint: "Confirm Password",
                                  focusnode: _confirmpasswordfocus,
                                  icon: const Icon(Icons.lock),
                                  obscure: true,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  interactivetext: false,
                                  fieldsubmitted: () async {
                                    bool v = await validateform(
                                        authctrl,
                                        _emailcontroller.text,
                                        _passwordcontroller.text,
                                        _phonecontroller.text,
                                        _namecontroller.text);
                          
                                pagectrl.changePage(v?0:1);
            
                                  },
                                  controller: _confirmpasswordcontroller,
                                  validator: () {
                                    return _confirmpasswordcontroller.text !=
                                            _passwordcontroller.text
                                        ? 'Must be same with password'
                                        : null;
                                  },
                                ),
                                        
                                  const SizedBox(
                                          height: 20,
                                        ),
                              ],
                            ),
                          ),
                        )),
                                             MaterialButton(
                      onPressed: () async {
                    bool v = await validateform(
                            authctrl,
                            _emailcontroller.text,
                            _passwordcontroller.text,
                            _phonecontroller.text,
                            _namecontroller.text);
                            
                                pagectrl.changePage(v?0:1);
            
                              
                              
            
                       
                     
            
                      
                      },
                      color: Theme.of(context).colorScheme.secondary,
                      minWidth: double.infinity,
                      padding: const EdgeInsets.all(16),
                      child: const Text('Sign Up',
                          style: TextStyle(
                            color: Colors.white,
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
                                    ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  pagectrl.changePage(0);
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
          }
        );
      }
    );
  }
}
