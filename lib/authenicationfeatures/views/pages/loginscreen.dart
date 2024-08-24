import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import '../../../widgets/headingtext.dart';
import '../../../widgets/textformwidget.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
 
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final FocusNode _passwordfocus = FocusNode();
  final FocusNode _emailfocus = FocusNode();


Future<bool> validateform(String email,String pass)  async{

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
    return GetBuilder<GetxAuthController>(
      builder: (authctrl) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
             
            SizedBox(
              
              width:MediaQuery.sizeOf(context).width>300?400:null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
             Row(
               children: [
                IconButton(onPressed: (){

                  Get.offAndToNamed('/home');
                }, icon: Icon(Icons.arrow_back)),
                SizedBox(height: 10,),
                 const HeadingText(
                                      'Log In',
                                        size: 20,
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
                            hint: "Username",
                              icon: const Icon(Icons.mail),
                            controller: _emailcontroller,
                            focusnode: _emailfocus,
                            nextfocusnode: _passwordfocus,
                            validator: () {
                              // return tapcontroller.authusecase
                              //     .emailAuth(_emailcontroller.text.trim());
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
                           validateform(_emailcontroller.text,_passwordcontroller.text);
                             
                              
                            
                            },
                            controller: _passwordcontroller,
                            validator: () {
                              // return tapcontroller.authusecase.passwordAuth(
                              //     _passwordcontroller.text.trim());
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
                              Get.offNamed('/forgotpassword');
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
                  SizedBox(
                    width: double.maxFinite,
                    child: Cardonly(
                          margin: EdgeInsets.zero,
                      // disabledColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                      onpress:authctrl.loginloading?null:(){
                          authctrl.authenticate(_emailcontroller.text,_passwordcontroller.text).then((value) {
                           if(!value.entries.first.key){
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error Logging in",)));
                           }
                          },);
                    
                      },
                      color: Theme.of(context).colorScheme.secondary,
                     
                      padding:const EdgeInsets.all(16),
                      child:Center(
                        child:                           authctrl.loginloading?const CircularProgressIndicator(color: Colors.white,backgroundColor: Colors.transparent,):const Text('Log in',
                              style: TextStyle(
                                color: Colors.white,
                              )),
                      
                      ),
                    ),
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
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.8)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap:(){
                        Get.offNamed('/signup');
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
          ],
        );
      }
    );
  }
}
