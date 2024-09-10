import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';

class GetxPageController extends GetxController {
  int navpage = 0;
  String _overalldropdownname = dayslist2[0];
  String get overalldropdownname => _overalldropdownname;
  var overalldropdownindex = 0.obs;

  int addmemberpages = 0;

  bool viewprofile = false;
  bool isrenewalforms = false;
  bool iseditforms = false;
  void changeNavPage(int page) {
    navpage = page;
    update();
  }

  void changeaddMemberPage(int addpage) {
    print('in change page $addpage');
    addmemberpages = addpage;
    update();
  }

  void changeaddmemberclose() {
    addmemberpages = 0;
  }

  void overalldropdown(String? val) {
    ManagementController mgctrl = Get.put(ManagementController());
    _overalldropdownname = val!;
    overalldropdownindex = dayslist2.indexOf(_overalldropdownname).obs;
    update();
    mgctrl.getxtremerforoverall();
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
    viewprofile = viewprofile ? false : true;
    update();
    print("In page control $viewprofile");
  }

  void disposes() {
    addmemberpages = 0;
    viewprofile = false;
    isrenewalforms = false;
    iseditforms = false;
  }
}
