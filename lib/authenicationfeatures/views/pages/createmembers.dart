import 'dart:html' as html;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/servicesentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addmemberfields/addserviceusage.dart';

import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addmembersscreen.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/dialogswidget.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

import '../../../managementfeatures/managementviews/controllers/managementcontroller.dart';
import '../../../widgets/cardborderhover.dart';
import '../../../widgets/normaltext.dart';

class CreateXtremers extends StatefulWidget {
  const CreateXtremers({super.key, this.phonenumber, this.services});
  final String? phonenumber;
  final ServiceEntity? services;
  @override
  State<CreateXtremers> createState() => _CreateXtremersState();
}

class _CreateXtremersState extends State<CreateXtremers> {
  bool isLoading = true;
  bool canpos = false;
  @override
  void initState() {
    super.initState();
    Get.put(ManagementController());
    Get.put(AddMemberController());
    Future.delayed(const Duration(seconds: 2)).then((value) => setState(() {
          isLoading = false;
        }));

    // Listen for the 'beforeunload' event to show a warning when the user tries to navigate awa
  }

  // Function to show a custom warning dialog
  Future<bool> _showExitWarningDialog(BuildContext context) async {
    return await showDialog(
            context: context,
            builder: (context) => PageDialog(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const HeadingText("Registration!!"),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            NormalText(
                              text: "Cancel Registration?",
                              size: 20,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text("Press Yes to cancel the registration."),
                          ],
                        ),
                      )
                    ],
                  ),
                  no: () {
                    setState(() {
                      canpos = false;
                    });
                    Navigator.of(context).pop(false); // Don't leave
                  },
                  yes: () {
                    setState(() {
                      canpos = true;
                    });
                    Navigator.of(context).pop(true);
                    Get.offAllNamed('/home'); // Leave
                  },
                )) ??
        false; // If the dialog is dismissed without choosing, return false (stay)
  }

  @override
  Widget build(BuildContext context) {
    final AddMemberController addMemberController =
        Get.put(AddMemberController());
    return PopScope(
      canPop: canpos,
      onPopInvoked: (didPop) {
        _showExitWarningDialog(context);
      },
      child: Scaffold(
        body: isLoading
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    HeadingText("Creating Xtremer Account ...")
                  ],
                ),
              )
            : Center(
                child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1000),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                          child: Center(
                            child: InkWell(
                                onTap: () {
                                  // _showExitWarningDialog(context);
                                },
                                child: Image.asset(
                                    height: 60, width: 60, "assets/logo1.png")),
                          ),
                        ),
                        Expanded(
                            child: CardBorderHover(
                                child: addMemberController.selectedservice !=
                                        null
                                    ? AddServiceUsage(
                                        serviceEntity:
                                            addMemberController.selectedservice,
                                        phonenumber: widget.phonenumber)
                                    : AddMemberScreen(
                                        phonenumber: widget.phonenumber,
                                      ))),
                      ],
                    )),
              ),
      ),
    );
  }
}
