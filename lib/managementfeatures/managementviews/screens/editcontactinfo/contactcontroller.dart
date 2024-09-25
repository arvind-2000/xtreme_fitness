import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/editcontactinfo/getcontactmodel.dart';

class ContactController extends GetxController {
  final String _name = '';
  String get name => _name;

  final String _mail = '';
  String get mail => _mail;

  final String _number = '';
  String get number => _number;

  final String _address = '';
  String get address => _address;
  // Here we use Rx to create reactive variables
  GetContactModal? _contact;
  GetContactModal get contact => _contact!;

  final List<String> _allmessage = [];
  List<String> get allmessage => _allmessage;

  int getcount = 0;

  int _unreadCount = 0;
  int get unreadcount => _unreadCount;
  List<String> allincomingmessage = [
    'Message 1',
    'Message 2',
    'Message 3',
    'Message 4'
  ];

//textxontroller

  TextEditingController addresscon = TextEditingController();
  TextEditingController phonecon = TextEditingController();
  TextEditingController mailcon = TextEditingController();
  // Initialize with a Contact object

  @override
  void onInit() async {
    super.onInit();
    getcontactdetails();

    getstoredcount();
  }

  @override
  void dispose() {
    addresscon.dispose();
    phonecon.dispose();
    mailcon.dispose();
    super.dispose();
  }

  void getcontactdetails() async {
    try {
  var request =
      http.Request('GET', Uri.parse('http://10.10.1.96/api/Contacts'));
  
  http.StreamedResponse response = await request.send();
  
  if (response.statusCode == 200) {
    var allcontact =
        getContactModalFromJson(await response.stream.bytesToString());
    _contact = allcontact;
    update();
    addresscon.text = _contact!.address;
    mailcon.text = _contact!.email;
    phonecon.text = _contact!.phoneNumber;
    update();
  } else {
    print(response.reasonPhrase);
  }
} on Exception catch (e) {
  // TODO
  
}
  }

  void getstoredcount() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    if (pref.containsKey('messagecount')) {
      getcount = pref.getInt('messagecount')!;
      update();
      log('Get Count :$getcount');
    }
    checkForNewMessages();
  }

  // Save contact logic (can add API calls or database logic here)
  void saveContact() {
    // Save logic here (e.g., API call)
    Get.snackbar("Success", "Contact information updated!");
  }

  // Example function for polling new messages periodically
  // void startPollingForNewMessages() {
  //   // Periodically check for new messages (you can adjust the duration)
  //   Future.delayed(const Duration(seconds: 5), () async {
  //     if (isPolling) {
  //       List<String> newMessages = await checkForNewMessages();
  //       if (newMessages.isNotEmpty) {
  //         setState(() {
  //           messages.addAll(newMessages);
  //           unreadCount += newMessages.length;
  //         });
  //       }
  //       startPollingForNewMessages(); // Continue polling
  //     }
  //   });
  // }

  // // Dummy API call to get messages
  // void getMessagesFromAPI() async {
  //   _allmessage = ['Message 1', 'Message 2'];
  //   update();

  //   // Example messages
  // }

  // Dummy API call to check for new messages
  void checkForNewMessages() async {
    // int mg = 0;
    // for (var element in allincomingmessage) {
    //   if (_allmessage.contains(element)) {
    //     log('already contains');
    //   } else {
    //     _allmessage.add(element);
    //     mg += 1;
    //     update();
    //   }
    // }
    _unreadCount = allincomingmessage.length - getcount;
    update();

    // Replace with logic to check for new messages from API

    // Example new message
  }

  // Function to handle user tapping the badge
  void onBadgeTap() async {
    getcount += _unreadCount;
    update();
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt(
      "messagecount",
      getcount,
    );
    _unreadCount = 0;
    update();
    log("Unread Count :$_unreadCount");
  }
}
