import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/servicesentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/dummies.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/managementrepoimpl.dart';

import '../../managementfeatures/managementdomain/entities.dart/planentity.dart';

class GetxLandingcontroller extends GetxController {
  final ManagementrepoImpl managementrepoImpl = ManagementrepoImpl();
  final scrollController = PageController();
  final scafoldKey = GlobalKey<ScaffoldState>();
  ItemScrollController? scrollControllers;
  GlobalKey<ScaffoldState> get key => scafoldKey;
  int _navindex = 0;
  int get navindex => _navindex;
  int _hoverindex = 0;
  int get hoverindex => _hoverindex;

  int _imagehoverindex = 0;
  int get imagehoverindex => _imagehoverindex;
  int _currentIndex = 0;
  bool _isUserScroll = true; // Flag to control scroll listener
  List<Plan> _plan = [];
  List<ServiceEntity> _services = [];
  bool _isHovered = false;
  bool get isHovered => _isHovered;

  bool _isHoveredimage = false;
  bool get isHoveredimage => _isHoveredimage;

  List<Plan> get getallplans => _plan;
  List<ServiceEntity> get getallservices => _services;
  ServiceEntity? services;
  int page = 0;
  int plandurations = 1;
  @override
  void onInit() {
    super.onInit();
    page = 0;
    update();
    getPlans();
    getServices();
      scrollControllers = ItemScrollController();
  }

  GetxLandingcontroller() {
    scrollController.addListener(_onScroll);
  }

    void setscrollcontroller(ItemScrollController controller){
        scrollControllers = controller;
        update();
  }

  void changeScrolltoScreen(int index) {
    debugPrint("in scroll control");
    scrollControllers!.scrollTo(
        index: index % 5,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOutCubic);
  }

  PageController get controller => scrollController;
  int get currentIndex => _currentIndex;

  void _onScroll() {
    if (!_isUserScroll) return; // Ignore if the flag is set to false
    double offset = scrollController.offset;
    int newIndex;
    log(offset.toString());

    if (offset < 480) {
      newIndex = 0;
    } else if (offset < 1220) {
      newIndex = 1;
    } else if (offset < 1920) {
      newIndex = 2;
    } else if (offset < 2720) {
      newIndex = 3;
    } else {
      newIndex = 4;
    }

    if (newIndex != _currentIndex) {
      _currentIndex = newIndex;
      update();
      // Call setNavIndex to update NavProvider
    }
  }

  void setscroll(bool isscroll) {
    _isUserScroll = isscroll;
    update();
    log("isUserScroll: $_isUserScroll");
  }

  void onHover(bool ishov, int ind) {
    _hoverindex = ind;
    _isHovered = ishov;
    log(_hoverindex.toString());
    update();
  }

  void onHoverimage(bool ishov, int ind) {
    _imagehoverindex = ind;
    _isHoveredimage = ishov;
    log(_hoverindex.toString());
    update();
  }

  void setnavindex(int index) {
    _navindex = index;
    update();
  }

  void setNavIndex(BuildContext context) {
    if (!_isUserScroll) return; // Ignore if the flag is set to false
    // Access NavProvider and call setnavindex
    setnavindex(_currentIndex);
  }

  void scroll(int index, {bool isMobile = false}) {
    setscroll(false); // Disable scroll listener temporarily

    log("_isUserScroll: $_isUserScroll");

    if (isMobile) {
      // If it's a mobile device, use jumpToPage
      controller.jumpToPage(index);
      setscroll(true); // Re-enable scroll listener immediately
    } else {
      // Otherwise, animate to the page
      controller
          .animateToPage(
        index,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      )
          .then((_) {
        setscroll(
            true); // Re-enable scroll listener after the animation completes
      });
    }
  }

  void changeplanduration(int duration) {
    plandurations = duration;
    update();
  }

  void sendEmail() async {
    final Email email = Email(
      body: 'This is a test message.',
      subject: 'Contact Form Submission',
      recipients: ['PETERPARKER@MASTERSTUDY.COM'],
      isHTML: false,
    );

    try {
      await FlutterEmailSender.send(email);
      print('Email sent successfully!');
    } catch (error) {
      print('Failed to send email: $error');
    }
  }

  void getPlans() async {
    _plan = await managementrepoImpl.getPlans();
    // _plan = dummyplan;
    print(_plan.length);
    update();
  }

  void getServices() async {
    _services = await managementrepoImpl.getServices();
    // _services = dummyservices;
    update();
  }

  void addServices(ServiceEntity servic) async {
    // _services = await managementrepoImpl.getServices();
    services = servic;
  }

  void changelandingpage(int pageindex) {
    page = pageindex;
    update();
  }
}
