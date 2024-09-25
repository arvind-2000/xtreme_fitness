import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/dashboard.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/editcontactinfo/contactcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/nodatascreen.dart/nodatascreen.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';
import 'package:xtreme_fitness/widgets/textformwidget.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ContactController cntrl = Get.put(ContactController());
    return GetBuilder<ManagementController>(builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadingText('Edit Contact Info'),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      TextFieldWidget(
                          hint: "Address", controller: cntrl.addresscon),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          hint: "Phone Number", controller: cntrl.phonecon),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(hint: "Email", controller: cntrl.mailcon),
                    ],
                  ),
                ),
              ),
              // TextFormField(
              //   controller: cntrl.addresscon,
              //   decoration: const InputDecoration(
              //       labelStyle: TextStyle(color: Colors.white),
              //       border: OutlineInputBorder(),
              //       focusedBorder: OutlineInputBorder(
              //           borderSide: BorderSide(color: Colors.white)),
              //       labelText: 'Address'),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter an address';
              //     }
              //     return null;
              //   },
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              // TextFormField(
              //   controller: cntrl.mailcon,
              //   decoration: const InputDecoration(
              //       labelStyle: TextStyle(color: Colors.white),
              //       focusedBorder: OutlineInputBorder(
              //           borderSide: BorderSide(color: Colors.white)),
              //       labelText: 'Email',
              //       border: OutlineInputBorder(
              //           borderSide: BorderSide(color: Colors.black))),
              //   keyboardType: TextInputType.emailAddress,
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter an email';
              //     } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              //       return 'Please enter a valid email';
              //     }
              //     return null;
              //   },
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              // TextFormField(
              //   controller: cntrl.phonecon,
              //   decoration: const InputDecoration(
              //       labelStyle: TextStyle(color: Colors.white),
              //       border: OutlineInputBorder(),
              //       focusedBorder: OutlineInputBorder(
              //           borderSide: BorderSide(color: Colors.white)),
              //       labelText: 'Phone Number'),
              //   keyboardType: TextInputType.phone,
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter a phone number';
              //     }
              //     return null;
              //   },
              // ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardwithShadow(
                    isShadow: true,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Save',
                      ),
                    ),
                    onpress: () {},
                  )
                ],
              )
            ],
          ),
        ),
      );
      // return const NodataScreen(title: "Setting", desc: "No Setting Found");
    });
  }
}
