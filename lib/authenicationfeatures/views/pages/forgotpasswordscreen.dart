
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';

import '../../../widgets/headingtext.dart';
import '../../../widgets/textformwidget.dart';






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

  // final AuthenticateUseCase _authUseCases = AuthenticateUseCase();
    void validateform(String email,String pass,)  async{

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
  
    return GetBuilder<GetxAuthController>(
      builder: (authctrl) {
        return Container(
        
          padding: const EdgeInsets.all(16),
          // color: Theme.of(context).colorScheme.primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          
              SizedBox(
                width:MediaQuery.sizeOf(context).width>300?400:null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       const Row(
                          children: [
                            Icon(Icons.lock,size: 16,),
                            SizedBox(width: 10,),
                                       HeadingText(
                                        'Forgot Password',
                                          size: 20,
                                      ),
                          ],
                        ),

                          IconButton(onPressed: (){

                  Get.offAndToNamed('/login');
                }, icon: Icon(Icons.close)),
                // SizedBox(height: 10,),
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
                                // return _authUseCases
                                //     .emailAuth(_emailcontroller.text.trim());
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
                                validateform(_emailcontroller.text,_passwordcontroller.text);
                              },
                              controller: _passwordcontroller,
                              validator: () {
                                // return _authUseCases.passwordAuth(
                                //     _passwordcontroller.text.trim());
                              },
                            ),
                            
                          ],
                        )),
                    const SizedBox(
                      height: 10,
                    ),
               
                    MaterialButton(
                    
                      onPressed: () {
                        
                        validateform(_emailcontroller.text,_passwordcontroller.text);
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
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.6)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: (){
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
            ],
          ),
        );
      }
    );
  }
}