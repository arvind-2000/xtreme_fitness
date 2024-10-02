import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:universal_html/html.dart' as html;
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
  final int _unreadCount = 0;

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
    log(DateTime.now().toString());
    getContactDetails();
    // getallmessageduplic();
    // getallmessage();
    // getstoredcount();
  }

  @override
  void dispose() {
    addresscon.dispose();
    phonecon.dispose();
    mailcon.dispose();
    super.dispose();
  }

  void getContactDetails() async {
    try {
      // Make the request using universal_html's HttpRequest with withCredentials set to true
      var response = await html.HttpRequest.request(
        '$api/api/Contacts',
        method: 'GET',
        withCredentials: true, // Enable credentials
      );

      if (response.status == 200) {
        var allContact = getContactModalFromJson(response.responseText!);
        _contact = allContact;
        update();

        // Update your controllers with the fetched contact details
        addresscon.text = _contact!.address!;
        pincodecon.text = _contact!.pinCode!;
        mailcon.text = _contact!.email!;
        phonecon.text = _contact!.phoneNumber!;
        update();
      } else {
        print(response.statusText);
      }
    } catch (error) {}
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
      //print(await response.stream.bytesToString());
      getContactDetails();
    } else {
      //print(response.reasonPhrase);
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

  // void getallmessageduplic() {
  //   _unreadmessagelist.clear();
  //   _readmessagelist.clear();
  //   // Convert messageDataDemo to a JSON string using json.encode()
  //   var jsonString = json.encode(messageDataDemo);
  //   var allsms = getMessageModalFromJson(jsonString);
  //   _allmesage = allsms;
  //   update();
  //   for (var element in _allmesage) {
  //     if (element.isRead) {
  //       if (_readmessagelist.contains(element)) {
  //         log('already contains element');
  //       } else {
  //         _readmessagelist.add(element);
  //       }
  //     } else {
  //       if (_unreadmessagelist.contains(element)) {
  //         log('already contains element');
  //       } else {
  //         _unreadmessagelist.add(element);
  //       }
  //     }
  //   }
  // }

  void updatemessageisread(
      {required int id, required String messagecontent}) async {
    var url =
        '$api/api/Messages/$id'; // API endpoint to update message read status
    var headers = {'Content-Type': 'application/json'};

    try {
      // Make the PUT request using universal_html's HttpRequest with withCredentials set to true
      var response = await html.HttpRequest.request(
        url,
        method: 'PUT',
        sendData: json.encode({
          "Id": id,
          "isRead": true,
          "MessageContent": messagecontent
        }), // JSON body with the updated field
        requestHeaders: headers,
        withCredentials: true, // Enable credentials for cross-origin requests
      );

      if (response.status == 200 || response.status == 204) {
        //print('Message updated successfully: ${response.responseText}');
        getallmessage(); // Refresh the message list after successful update
      } else {
        //print('Failed to update message. Status code: ${response.status}');
      }
    } catch (error) {
      // Handle any errors during the request
      //print('Error updating message: $error');
    }
  }

  void deletemessage({required int id}) async {
    var url = '$api/api/Messages/$id'; // API endpoint for deleting a message
    var headers = {'Content-Type': 'application/json'};

    try {
      // Make the DELETE request using universal_html's HttpRequest with withCredentials set to true
      var response = await html.HttpRequest.request(
        url,
        method: 'DELETE',
        requestHeaders: headers,
        withCredentials: true, // Enable credentials for cross-origin requests
      );

      if (response.status == 200 || response.status == 204) {
        //print('Message deleted successfully: ${response.responseText}');
        getallmessage(); // Refresh the message list after successful deletion
      } else {
        //print('Failed to delete message. Status code: ${response.status}');
      }
    } catch (error) {
      // Handle any errors during the request
      //print('Error deleting message: $error');
    }
  }

  void getallmessage() async {
    _unreadmessagelist.clear();
    _readmessagelist.clear();

    try {
      // Make the request using universal_html's HttpRequest
      var response = await html.HttpRequest.request(
        '$api/api/Messages',
        method: 'GET',
        withCredentials: true, // Enable credentials for cross-origin requests
      );

      if (response.status == 200) {
        // Parse the response text to get message objects
        var allMessages = getMessageModalFromJson(response.responseText!);
        _allmesage = allMessages.reversed.toList();
        update();
        log("Message Length : ${_allmesage.length}");

        // Categorize messages into read and unread lists
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

        //print(response.responseText);
      } else {
        //print('Failed to fetch messages. Status code: ${response.status}');
      }
    } catch (error) {
      // Handle any errors that occur during the request
      //print('Error fetching messages: $error');
    }
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

  // Function to handle user tapping the badge
  // void onBadgeTap() async {
  //   getcount += _unreadCount;
  //   update();
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   pref.setInt(
  //     "messagecount",
  //     getcount,
  //   );
  //   _unreadCount = 0;
  //   update();
  //   log("Unread Count :$_unreadCount");
  // }

  void viewMessage(GetMessageModal message, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: Color.fromARGB(255, 67, 67, 67)),
              borderRadius: BorderRadius.circular(5)),
          alignment: const Alignment(0.22, -0.5),
          title: const Column(
            children: [
              HeadingText(
                'Message Details',
                size: 20,
              ),
              Divider(),
            ],
          ),
          content: SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Text(
                      'Sender Name : ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      message.name!,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      'Contact number : ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      message.phoneNumber,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const HeadingText(
                  'Message Content',
                  size: 16,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  textAlign: TextAlign.justify,
                  message.messageContent,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                  softWrap: true,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
