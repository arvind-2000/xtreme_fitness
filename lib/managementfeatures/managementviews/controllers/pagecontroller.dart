import 'package:get/get.dart';

class GetxPageController extends GetxController{
  int navpage = 0;

  int addmemberpages = 0;
  bool viewprofile = false;
  
  void changeNavPage(int page){
    navpage = page;
    update();
  }


  void changeaddMemberPage(int addpage){
      addmemberpages = addpage;
      update();
  }


  @override
  void onClose() {

  
    super.onClose();
  }


  void changeviewprofile(){
      viewprofile = !viewprofile;
      update();

  }
}