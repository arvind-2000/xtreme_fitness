import 'package:flutter/material.dart';

import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/editcontactinfo/contactcontroller.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    ContactController contrl = Get.put(ContactController());
    return GetBuilder<ContactController>(builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadingText('Message'),
            const SizedBox(
              height: 15,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: contrl.allincomingmessage.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(contrl.allincomingmessage[index]),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}