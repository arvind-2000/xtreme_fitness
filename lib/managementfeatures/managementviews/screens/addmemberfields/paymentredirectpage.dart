import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/dialogs/logindialog.dart';
import 'package:xtreme_fitness/config/encrypt.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/paymentstatuscard.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'dart:html' as html;

class PaymentRedirectPage extends StatefulWidget {
  const PaymentRedirectPage(
      {super.key,
      this.phone,
      this.renewal,
      this.buttontext,
      this.callback,
      this.iseditform = false});
  final String? phone;
  final int? renewal;
  final String? buttontext;
  final VoidCallback? callback;
  final bool iseditform;
  @override
  State<PaymentRedirectPage> createState() => _PaymentRedirectPageState();
}

class _PaymentRedirectPageState extends State<PaymentRedirectPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool iscash = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(AddMemberController()).checkpaymentafterpaid();
  }

  @override
  Widget build(BuildContext context) {
    GetxAuthController authctrl = Get.put(GetxAuthController());
    AddMemberController addmemberctrl = Get.put(AddMemberController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GetBuilder<GetxPageController>(builder: (_) {
        return GetBuilder<AddMemberController>(builder: (_) {
          iscash = addmemberctrl.ispaymentcash;
          return Cardonly(
              color: Colors.transparent,
              child: Center(
                child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: PaymentStatusCard(
                      callback: () async {
                        authctrl.authentications();
                      },
                    )),
              ));
        });
      }),
    );
  }
}
