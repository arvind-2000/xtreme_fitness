import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/AuthHandlerPage.dart';
import 'package:xtreme_fitness/handlerpage.dart';

class GetxAuthController extends GetxController{

  ///login 0 signup 1 forgotpass 2
  int changeAuthindex = 0;

  bool _authentication = false;
  bool loginloading = false;





  ///change between login signup forgot password page [0] [1] [2]
  void changeAuthPage(int index){
    changeAuthindex = index;
    update();
  }

  
  void authenticate(){
    loginloading = true;
    update();
    Future.delayed(const Duration(seconds: 2)).then((v){
      _authentication = true;
      loginloading = false;
      update();
          if(_authentication==true){
    Get.offAll(()=>const HandlerPage());

    }
  
    });
    
    

  }

  void logout(){
    loginloading = true;
    update();
    Future.delayed(const Duration(seconds: 2)).then((v){
        _authentication = false;
      loginloading = false;
      update();
          if(_authentication==false){
    Get.offAll(()=>const AuthHandlerPage());

    }

    });

  }

  void signup(){

  }


}