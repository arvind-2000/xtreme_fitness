import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:xtreme_fitness/config/apis.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/servicesentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/managementrepoimpl.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

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
  bool get isUserScroll => _isUserScroll;
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

  bool _isloading = true;
  bool get isloading => _isloading;
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  //Text controller for contact us form

  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController subjectcontroller = TextEditingController();
  TextEditingController messagecontroller = TextEditingController();
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
    // scrollController.addListener(_onScroll);

    itemPositionsListener.itemPositions.addListener(() {
      if (isUserScroll) {
        setscroll(true);

        final visibleItems = itemPositionsListener.itemPositions.value;
        if (visibleItems.isNotEmpty) {
          // Find the first visible item
          const screenMidpoint = 0.5; // Midpoint of the screen (50%)

          // Find the first item that crosses the midpoint
          final midPointItem = visibleItems
              .where((ItemPosition position) =>
                  position.itemLeadingEdge < screenMidpoint &&
                  position.itemTrailingEdge > screenMidpoint)
              .reduce((current, next) =>
                  current.itemLeadingEdge < next.itemLeadingEdge
                      ? current
                      : next);

          // Update the index based on the item passing the midpoint
          _currentIndex = midPointItem.index;

          // Call update function to reflect the change
          update();
        }
      }
    });
  }

  void setscrollcontroller(ItemScrollController controller) {
    scrollControllers = controller;
    update();
  }

  void changeScrolltoScreen(int index) {
    setscroll(false);
    debugPrint("in scroll control");
    scrollControllers!
        .scrollTo(
            index: index % 5,
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOutCubic)
        .then((_) {
      setscroll(true);
    });
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
        setscroll(true);
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
      ////print('Email sent successfully!');
    } catch (error) {
      //print('Failed to send email: $error');
    }
  }

  void getPlans() async {
    _plan = await managementrepoImpl.getPlans();
    //print(_plan.length);
    update();
  }

  void getServices() async {
    _services = await managementrepoImpl.getServices();

    update();
  }

  void addServices(ServiceEntity servic) async {
    services = servic;
  }

  void changelandingpage(int pageindex) {
    page = pageindex;
    update();
  }

  Future sendmessage() async {
    _isloading = true;
    update();
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('$api/api/Messages'));
    request.body = json.encode({
      "name": namecontroller.text,
      "phoneNumber": phonecontroller.text,
      "subject": subjectcontroller.text,
      "messageContent": messagecontroller.text,
      "isRead": false,
      "isReplied": false
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      _isloading = false;
      update();
      log('Successfuly send message');
      //print(await response.stream.bytesToString());
    } else {
      //print(response.reasonPhrase);
    }
  }

  void showThankYouDialog(BuildContext context) {
    Get.dialog(AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          CircleAvatar(
            radius: _isloading ? 25 : 35,
            backgroundColor: _isloading ? Colors.orange : Colors.green,
            child: _isloading
                ? const CircularProgressIndicator()
                : const Icon(
                    Icons.check,
                    weight: 20,
                    color: Colors.white,
                    size: 30,
                  ),
          ),
          const SizedBox(height: 16),
          _isloading
              ? const HeadingText(
                  'Please Wait..',
                  size: 18,
                )
              : const HeadingText(
                  'Thank you for contacting us',
                  size: 25,
                ),
          const SizedBox(height: 10),
          _isloading
              ? const SizedBox()
              : Column(
                  children: [
                    const Text(
                      'We appreciate that you\'ve taken the time to write us. '
                      'We\'ll get back to you very soon.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 139, 138, 138)),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        namecontroller.clear();
                        phonecontroller.clear();
                        subjectcontroller.clear();
                        messagecontroller.clear();

                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        'OK',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    ));
  }
}
