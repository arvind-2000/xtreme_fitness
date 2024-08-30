import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';

import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addmembersscreen.dart';

import '../../../managementfeatures/managementviews/controllers/managementcontroller.dart';

class CreateXtremers extends StatefulWidget {
  const CreateXtremers({super.key});

  @override
  State<CreateXtremers> createState() => _CreateXtremersState();
}

class _CreateXtremersState extends State<CreateXtremers> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
        Get.put(ManagementController());
        Get.put(AddMemberController());

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddMemberScreen(),
    );
  }
}