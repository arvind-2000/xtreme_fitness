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
  final GlobalKey<FormState> _formkey = GlobalKey();
  final GlobalKey<FormState> _formKeys = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool iscash = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GetxAuthController authctrl = Get.put(GetxAuthController());
    AddMemberController addmemberctrl = Get.put(AddMemberController());
    return Scaffold(
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
                        // addmemberctrl.changepaymentstatus(0);
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        if (prefs.containsKey('userid') &&
                            prefs.containsKey('password')) {
                              print("in returnss admin");
                          authctrl.authenticate(decryptData(prefs.getString('userid')!),
                            decryptData(  prefs.getString('password')!));
                        } else {
                          Get.offAllNamed('/home');
                          Get.dialog(const LoginDialog());
                        }
                      },
                    )),
              ));
        });
      }),
    );
  }
}