import 'package:get/get.dart';

class GetxPageController extends GetxController{
  int navpage = 0;

  void changeNavPage(int page){
    navpage = page;
    update();
  }

  
}