import 'dart:developer';

import 'package:get/get.dart';

class GetxPageController extends GetxController {
  int navpage = 0;

  int addmemberpages = 0;
  bool viewprofile = false;
  bool isrenewalforms = false;
  bool iseditforms = false;
  void changeNavPage(int page) {
    navpage = page;
    update();
  }

  void changeaddMemberPage(int addpage) {
    addmemberpages = addpage;
    update();
  }


  @override
  void onClose() {

  
    super.onClose();
  }


  void changerenewal(bool v){

      isrenewalforms = v;
      update();
  }

  
  void changeeditform(bool v){

      iseditforms = v;
      update();
  }


  void changeviewprofile(){

     viewprofile =  viewprofile?false:true;
      update();
          print("In page control $viewprofile");

  }

  void disposes(){

 addmemberpages = 0;
  viewprofile = false;
isrenewalforms = false;
iseditforms = false;
  update();
  }
}
