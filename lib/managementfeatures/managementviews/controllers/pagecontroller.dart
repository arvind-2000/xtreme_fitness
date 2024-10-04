import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/config/const.dart';

class GetxPageController extends GetxController {
  int navpage = 0;
  final String _overalldropdownname = dayslist2[0];
  String get overalldropdownname => _overalldropdownname;
  var overalldropdownindex = 0.obs;

  int addmemberpages = 0;

  bool viewprofile = false;
  bool isrenewalforms = false;
  bool iseditforms = false;

  bool _istwo = false;
  bool _isthree = false;
  bool _isfour = false;
  bool _isfive = false;

  bool get istwo => _istwo;
  bool get isthree => _isthree;
  bool get isfour => _isfour;
  bool get isfive => _isfive;

  GetxAuthController controller = Get.put(GetxAuthController());
  void changeNavPage(int page) {
    navpage = page;
    controller.authenticationsforsession();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    navpage = 0;
    addmemberpages = 0;
  }

  void changeaddMemberPage(int addpage) {
    //print('in change page $addpage');
    addmemberpages = addpage;
    update();
    if (addpage == 1) {
      _istwo = true;
      update();
    } else if (addpage == 2) {
      _isthree = true;
      update();
    } else if (addpage == 3) {
      _isfour = true;
      update();
    } else if (addpage == 4) {
      _isfive = true;
      update();
    }
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
    if (viewprofile) {
      viewprofile = false;
    } else {
      viewprofile = true;
    }
    update();
    //print("In page control $viewprofile");
  }

  void disposes() {
    addmemberpages = 0;
    viewprofile = false;
    isrenewalforms = false;
    iseditforms = false;
    navpage = 0;
  }
}
