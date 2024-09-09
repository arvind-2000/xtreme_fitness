import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/servicesentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addmemberfields/addserviceusage.dart';

import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addmembersscreen.dart';

import '../../../managementfeatures/managementviews/controllers/managementcontroller.dart';
import '../../../widgets/cardborderhover.dart';

class CreateXtremers extends StatefulWidget {
  const CreateXtremers({super.key, this.phonenumber, this.services});
  final String? phonenumber;
  final ServiceEntity? services;
  @override
  State<CreateXtremers> createState() => _CreateXtremersState();
}

class _CreateXtremersState extends State<CreateXtremers> {

  @override
  void initState() {
    super.initState();
        Get.put(ManagementController());
        Get.put(AddMemberController());

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
            constraints:  const BoxConstraints(maxWidth:1000),
           child: Column(
             children: [
              SizedBox(height: 100,child: Center(child: Image.asset(height: 60,width: 60,"assets/logo1.png"),),),
               Expanded(child: CardBorderHover(child:widget.services!=null?AddServiceUsage(serviceEntity: widget.services,phonenumber:widget.phonenumber):AddMemberScreen(phonenumber: widget.phonenumber,))),
             ],
           )),
      ),
    );
  }
}