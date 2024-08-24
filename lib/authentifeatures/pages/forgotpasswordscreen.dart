import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../SnackbarFeature/snarckbar.dart';
import '../../widgets/titletext.dart';
import '../models/usecases.dart';
import '../provider/authprovider.dart';
import '../provider/screenprovider.dart';
import '../widgets/textformwidget.dart';


class ForgotPassWordScreen extends StatefulWidget {
  const ForgotPassWordScreen({super.key});  

  @override
  State<ForgotPassWordScreen> createState() => _ForgotPassWordScreenState();
}

class _ForgotPassWordScreenState extends State<ForgotPassWordScreen> {
    final _formkey = GlobalKey<FormState>();

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final FocusNode _passwordfocus = FocusNode();
  final FocusNode _emailfocus = FocusNode();

  final AuthenticateUseCase _authUseCases = AuthenticateUseCase();
    void validateform(AuthProvider prov,String email,String pass,)  async{
    // Validate returns true if the form is valid, or false otherwise.
      if (_formkey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      await prov.authenticateLogin(email,pass);
//       if(context.mounted){
//  snackBarFeature(_d.entries.first.value,_d.entries.first.value,context,_d.entries.first.key?AnimatedSnackBarType.success:AnimatedSnackBarType.error);
//       }
  
 
   
    } else {
        snackBarFeature('Failed',"Wrong Credentials", context, AnimatedSnackBarType.warning);
    }
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
          builder: (authctrl) {
            return Container(
            
              padding: const EdgeInsets.all(16),
              // color: Theme.of(context).colorScheme.primary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   MediaQuery.sizeOf(context).width<600?const TitleText("Forgot Password"):const SizedBox(),
                  Expanded(
                    child: SizedBox(
                      width:MediaQuery.sizeOf(context).width>300?400:null,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         const Row(
                            children: [
                              Icon(Icons.lock,size: 16,),
                              SizedBox(width: 10,),
                              Text(
                                'Forgot Password ?',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Form(
                              key: _formkey,
                              child: Column(
                                children: [
                                  TextFieldWidget(
                                    hint: "Email",
                                    icon: const Icon(Icons.mail),
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
                                    hint: "New Password",
                                    focusnode: _passwordfocus,
                                    icon: const Icon(Icons.lock),
                                    obscure: true,
                                    
                                    fieldsubmitted:(){
                                      validateform(authctrl,_emailcontroller.text,_passwordcontroller.text);
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
                     
                          MaterialButton(
                          
                            onPressed: () {
                              
                              validateform(authctrl,_emailcontroller.text,_passwordcontroller.text);
                            },
                            color: Theme.of(context).colorScheme.secondary,
                            minWidth: double.infinity,
                            padding:const EdgeInsets.all(16),
                            child:const Text('Change Password',
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
                                "Go to ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                   ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: (){
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