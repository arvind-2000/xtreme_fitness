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
    Get.find<GetxAuthController>().disposelogin();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _passwordfocus.dispose();
    _emailfocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxAuthController>(
      builder: (authctrl) {
        return Padding(
          padding: const EdgeInsets.all(32),
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
                                    IconButton(onPressed: (){
                  
              Get.offAndToNamed('/home');
            }, icon: const Icon(Icons.close)),
            
           ],
                   ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          AnimatedOpacity(opacity: authctrl.loginerrortext==null?0:1, duration: Durations.extralong1,child: SizedBox(
                            width: double.maxFinite,
                            child: Cardonly(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              color: Theme.of(context).colorScheme.secondary,
                              child: Center(child: Text(authctrl.loginerrortext??""))),
                          ),),

                        TextFieldWidget(
                          hint: "Username",
                            icon: const Icon(Icons.mail),
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
                          fieldsubmitted:() {
                                            if (_formkey.currentState!.validate()) {
  authctrl.authenticate(_emailcontroller.text,_passwordcontroller.text).then((value) {
   if(!value.entries.first.key){
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error Logging in",)));
   }
  },);}

                           
                            
                          
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
                      onTap:authctrl.loginloading?null:(){
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
                      if (_formkey.currentState!.validate()) {
  authctrl.authenticate(_emailcontroller.text,_passwordcontroller.text).then((value) {
   if(!value.entries.first.key){
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error Logging in",)));
   }
  },);
}
                
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
                        
                      ],
                    )),
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
                    onTap:authctrl.loginloading?null:(){
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
        );
      }
    );
  }
}
