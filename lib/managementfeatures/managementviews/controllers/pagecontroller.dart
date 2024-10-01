import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/config/const.dart';

class GetxPageController extends GetxController {
  int navpage = 0;
  String _overalldropdownname = dayslist2[0];
  String get overalldropdownname => _overalldropdownname;
  var overalldropdownindex = 0.obs;

  int addmemberpages = 0;

  bool viewprofile = false;
  bool isrenewalforms = false;
  bool iseditforms = false;


    GetxAuthController controller = Get.put(GetxAuthController());
  void changeNavPage(int page) {
    navpage = page;
    controller.authenticationsforsession();
    update();
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    navpage = 0;
    addmemberpages = 0;
    
    update();
  }

  
  void changeaddMemberPage(int addpage) {
    //print('in change page $addpage');
    addmemberpages = addpage;
    update();
  }

  void changeaddmemberclose() {
    addmemberpages = 0;
  }

  void changerenewal(bool v) {
    isrenewalforms = v;
    update();
  }

  void changeeditform(bool v) {
    iseditforms = v;
    update();
  }

  void changeviewprofile() {
   if(viewprofile){
     viewprofile = false;
   }else
   {viewprofile = true;}
    update();
    //print("In page control $viewprofile");
  }

  void disposes() {
    addmemberpages = 0;
    viewprofile = false;
    isrenewalforms = false;
    iseditforms = false;
    navpage=0;
  }
}
