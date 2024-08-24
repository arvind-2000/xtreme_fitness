import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../SnackbarFeature/snarckbar.dart';
import '../../widgets/titletext.dart';
import '../models/usecases.dart';
import '../provider/authprovider.dart';
import '../provider/screenprovider.dart';
import '../widgets/textformwidget.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    required this.context
  });
  final BuildContext context;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final FocusNode _passwordfocus = FocusNode();
  final FocusNode _emailfocus = FocusNode();

  final AuthenticateUseCase _authUseCases = AuthenticateUseCase();

Future<bool> validateform(AuthProvider prov,String email,String pass)  async{
    // Validate returns true if the form is valid, or false otherwise.
    if (_formkey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      Map<bool,String> d = await prov.authenticateLogin(email,pass);
      
   snackBarFeature("Auth",d.entries.first.value,widget.context,d.entries.first.key?AnimatedSnackBarType.success:AnimatedSnackBarType.error);
      _emailcontroller.clear();
      _passwordcontroller.clear();
      
        return d.entries.first.key;
     
    } else {
        snackBarFeature('Failed',"Wrong Credentials", context, AnimatedSnackBarType.warning);
  
    }
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
    
    return GetBuilder<Screenprovider>(
      builder: (pagectrl) {
        return GetBuilder<AuthProvider>(
          builder: (auth) {
            return Container(
            
              padding: const EdgeInsets.all(16),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    MediaQuery.sizeOf(context).width<600?const TitleText(""):const SizedBox(),
                  Expanded(
                    child: SizedBox(
                      
                      width:MediaQuery.sizeOf(context).width>300?400:null,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Log In',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Form(
                              key: _formkey,
                              child: Column(
                                children: [
                                  TextFieldWidget(
                                    hint: "User Name",
                                      icon: const Icon(Icons.person),
                                    controller: _emailcontroller,
                                    focusnode: _emailfocus,
                                    nextfocusnode: _passwordfocus,
                                    validator: () {
                                      return _authUseCases
                                          .emailAuth(_emailcontroller.text.trim());
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
                                    
                                    fieldsubmitted:() {
                                   validateform(auth,_emailcontroller.text,_passwordcontroller.text);
                                     
                                      
                                    
                                    },
                                    controller: _passwordcontroller,
                                    validator: () {
                                      return _authUseCases.passwordAuth(
                                          _passwordcontroller.text.trim());
                                    },
                                  ),
                                  
                                ],
                              )),
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
                                  onTap: (){
                                   pagectrl.changePage(2);
                                  },
                                  child: Text(
                                    "Forgot Password?",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).colorScheme.secondary),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MaterialButton(
                            disabledColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                            onPressed:auth.isLogging?null:(){
                              
                          validateform(auth,_emailcontroller.text,_passwordcontroller.text);
                     
                                    
                            },
                            color: Theme.of(context).colorScheme.secondary,
                            minWidth: double.infinity,
                            padding:const EdgeInsets.all(16),
                            child:auth.isLogging?const CircularProgressIndicator(color: Colors.white,backgroundColor: Colors.transparent,):const Text('Log in',
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
                                "Don't have an account?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                               ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: (){
                                  pagectrl.changePage(1);
                                },
                                child: Text('Sign Up',
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
                  ),
                ],
              ),
            );
          }
        );
      }
    );
  }
}
