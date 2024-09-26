import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xtreme_fitness/config/apis.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/editcontactinfo/getcontactmodel.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/editcontactinfo/getmessagemodel.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

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
  GetContactModal? get contact => _contact;

  List<GetMessageModal> _allmesage = [];
  List<GetMessageModal> get allmessage => _allmesage;
//unread list
  final List<GetMessageModal> _unreadmessagelist = [];
  List<GetMessageModal> get unreadmessagelist => _unreadmessagelist;
//read list
  final List<GetMessageModal> _readmessagelist = [];
  List<GetMessageModal> get readmessagelist => _readmessagelist;

  int getcount = 0;
  bool _isloading = false;
  bool get isloading => true;
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
  TextEditingController pincodecon = TextEditingController();
  TextEditingController phonecon = TextEditingController();
  TextEditingController mailcon = TextEditingController();
  // Initialize with a Contact object

  @override
  void onInit() async {
    super.onInit();
    getcontactdetails();
    getallmessage();
    // getstoredcount();
  }

  @override
  void dispose() {
    addresscon.dispose();
    phonecon.dispose();
    mailcon.dispose();
    super.dispose();
  }

  void getcontactdetails() async {
    var request = http.Request('GET', Uri.parse('$api/api/Contacts'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var allcontact =
          getContactModalFromJson(await response.stream.bytesToString());
      _contact = allcontact;
      update();
      addresscon.text = _contact!.address!;
      pincodecon.text = _contact!.pinCode!;
      mailcon.text = _contact!.email!;
      phonecon.text = _contact!.phoneNumber!;
      update();
    } else {
      print(response.reasonPhrase);
    }
  }

  void updatecontactinfo() async {
    log("Phone Controller :${phonecon.text}");
    _isloading = true;
    update();
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('PUT', Uri.parse('$api/api/Contacts/1'));
    request.body = json.encode({
      "id": 1,
      "address": addresscon.text,
      "email": mailcon.text,
      "PhoneNumber": phonecon.text,
      "pincode": pincodecon.text,
      "UpdatedAt": DateTime.now().toIso8601String()
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      _isloading = false;
      update();
      print(await response.stream.bytesToString());
      getcontactdetails();
    } else {
      print(response.reasonPhrase);
    }
  }

  void showDialogforupdate(BuildContext context) {
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
          // const Icon(
          //   Icons.check_circle,
          //   color: Colors.white,
          //   size: 70,
          // ),
          const SizedBox(height: 16),
          _isloading
              ? const HeadingText(
                  'Please Wait..',
                  size: 18,
                )
              : const HeadingText(
                  'Details Updated Successfully',
                  size: 25,
                ),
          // const Text(
          //   'Thank you for contacting us.',
          //   style: TextStyle(
          //     fontSize: 18,
          //     fontWeight: FontWeight.bold,
          //   ),
          //   textAlign: TextAlign.center,
          // ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              backgroundColor: Colors.red,
            ),
            child: const Text(
              'OK',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ));
  }

  void getallmessage() async {
    _unreadmessagelist.clear();
    _readmessagelist.clear();
    var request = http.Request('GET', Uri.parse('$api/api/Messages'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var allsms =
          getMessageModalFromJson(await response.stream.bytesToString());
      _allmesage = allsms;
      update();
      for (var element in _allmesage) {
        if (element.isRead) {
          if (_readmessagelist.contains(element)) {
            log('already contains element');
          } else {
            _readmessagelist.add(element);
          }
        } else {
          if (_unreadmessagelist.contains(element)) {
            log('already contains element');
          } else {
            _unreadmessagelist.add(element);
          }
        }
      }

      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
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
