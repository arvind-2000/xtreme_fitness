import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // F
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/editcontactinfo/contactcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/nodatascreen.dart/nodatascreen.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

class MessageListScreen extends StatelessWidget {
  const MessageListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ContactController contactController = Get.put(ContactController());
    return contactController.allmessage.isEmpty
        ? const NodataScreen(title: "Messages", desc: "No Message Found")
        : GetBuilder<ContactController>(builder: (_) {
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const HeadingText('All Message'),
                        const SizedBox(
                          height: 50,
                        ),
                        // Top Filters
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const FilterChipWidget(
                                      label: 'All', isSelected: true),
                                  const SizedBox(width: 8),
                                  FilterChipWidget(
                                      label: 'Unread',
                                      isSelected: false,
                                      badgeCount: contactController
                                          .unreadmessagelist.length),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(height: 1),
                      ],
                    ),
                  ),

                  // Message List
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: contactController.allmessage.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            MessageTile(ind: index),
                            Divider(
                              color: Colors.grey[900],
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          });
  }
}

// Model for a message
// class ddddd {
//   final String sender;
//   final String subject;
//   final String content;
//   final String date;
//   final String initials;
//   final bool isUnread;

//   Message({
//     required this.sender,
//     required this.subject,
//     required this.content,
//     required this.date,
//     required this.initials,
//     required this.isUnread,
//   });
// }

// // Message data
// List<Message> messages = [
//   Message(
//       sender: 'Sarah Thompson',
//       subject: 'Team Meeting Reminder',
//       content: 'Hi Team, Just a quick reminder...',
//       date: '05-07-2024',
//       initials: 'ST',
//       isUnread: true),
//   Message(
//       sender: 'David Martinez',
//       subject: 'New Project Kickoff',
//       content: 'I am excited to announce...',
//       date: '04-07-2024',
//       initials: 'DM',
//       isUnread: true),
//   Message(
//       sender: 'Emily Johnson',
//       subject: 'Client Feedback',
//       content: 'Dear Team, I wanted to share...',
//       date: '04-07-2024',
//       initials: 'EJ',
//       isUnread: false),
//   // Add more messages as needed
// ];

// Widget for each message tile
class MessageTile extends StatelessWidget {
  final int ind;

  const MessageTile({super.key, required this.ind});
  String getFirstTwoLetters(String name) {
    // Split the name by spaces into a list of words
    List<String> words = name.split(' ');
    print("Word Length :${words.length}");
    // Ensure there are at least two words
    if (words.length >= 2) {
      // Take the first two letters of the first word and the first two letters of the second word
      String firstTwoLetters = words[0].substring(0, 1).toUpperCase();
      String secondTwoLetters = words[1].substring(0, 1).toUpperCase();

      // Combine them and return
      return firstTwoLetters + secondTwoLetters;
    } else {
      String firstTwoLetters = words[0].substring(0, 1).toUpperCase();
      return firstTwoLetters;
    }
  }

  @override
  Widget build(BuildContext context) {
    ContactController conctrl = Get.put(ContactController());
    return Container(
      color: !conctrl.allmessage[ind].isRead
          ? const Color.fromARGB(255, 61, 61, 61).withOpacity(0.4)
          : null,
      child: ListTile(
        hoverColor: Colors.blueGrey[900]!.withOpacity(0.5),
        leading: CircleAvatar(
          child: Text(getFirstTwoLetters(conctrl.allmessage[ind].name!)),
        ),
        title: Text(conctrl.allmessage[ind].subject),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(conctrl.allmessage[ind].messageContent,
                style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 5),
            Text(
                DateFormat('yyyy-MM-dd')
                    .format(conctrl.allmessage[ind].createdAt!),
                style: const TextStyle(color: Colors.grey)),
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            conctrl.deletemessage(id: conctrl.allmessage[ind].id);
            log('Delete Tap');
          },
          icon: const Icon(Icons.delete_outline),
        ),
        onTap: () {
          log('Tile Tap');
          if (!conctrl.allmessage[ind].isRead) {
            conctrl.updatemessageisread(
                id: conctrl.allmessage[ind].id,
                messagecontent: conctrl.allmessage[ind].messageContent);
          }

          conctrl.viewMessage(conctrl.allmessage[ind], context);
          // Handle tap on message
        },
      ),
    );
  }
}

// Filter Chip Widget
class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final int? badgeCount;

  const FilterChipWidget(
      {super.key,
      required this.label,
      required this.isSelected,
      this.badgeCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label,
            style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
        if (badgeCount != null)
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text('$badgeCount',
                  style: const TextStyle(color: Colors.white)),
            ),
          ),
      ],
    );
  }
}
