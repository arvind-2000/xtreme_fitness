import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/nodatascreen.dart/nodatascreen.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/profilescreens/memberprofilescreen.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/titletext.dart';

import '../../../widgets/headingtext.dart';
import '../../managementdomain/entities.dart/xtremer.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({super.key});

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ManagementController>().getxtremer();
  }

  Xtremer? _user;
  void changeuser(Xtremer us){
    _user = us;
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxPageController>(
      builder: (pagectrl) {
        return GetBuilder<ManagementController>(
          builder: (managectrl) {
            return pagectrl.viewprofile && _user!=null?MemberProfilescreen(user: _user,) :Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             
              children: [
                    const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: HeadingText("Edit User",size: 30,),
                ),
              Expanded(child:managectrl.getallXtremer.isEmpty?const NodataScreen(title: "Xtremer", desc: "No users added") :ListView.builder(
                itemCount: managectrl.getallXtremer.length,
                itemBuilder: (c,i)=> ListCard(designation: "Member", name: managectrl.getallXtremer[i].firstName!, phone: managectrl.getallXtremer[i].mobileNumber!,user: managectrl.getallXtremer[i],userss: changeuser,).animate().slideX(begin: 1,end: 0))),
                         const SizedBox(height: 40,)
              ],
            );
          }
        );
      }
    );
  }
}

class ListCard extends StatelessWidget {
  const ListCard({
    super.key, required this.name, required this.phone, required this.designation, required this.userss, required this.user,
  });
  final String name;
  final String phone;
  final String designation;
  final Function(Xtremer) userss;
  final Xtremer user;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxPageController>(
      builder: (pagectrl) {
        return CardwithShadow(
                    margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          
                            TitleText(name),
                            SizedBox(height: 10,),
                            Text("phone"),
                            Text(phone,style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 6,),
                               Text("Designation"),
                            Text(designation,style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                                                ),
                        ),
        
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(children: [
                                CardwithShadow(
                                  padding: EdgeInsets.all(8),
                             
                                  child: Icon(Icons.edit,color: Colors.white,size: 12,)),
                                SizedBox(width: 6,),
                                CardwithShadow(
                                    padding: EdgeInsets.all(8),
                                  color: Colors.red[300]!.withOpacity(0.3),
                                  child: Icon(Icons.delete,color: Colors.white,size: 12,)),
                            ],),
                            SizedBox(height: 16,),
                            CardwithShadow(
                              onpress: (){
                                userss(user);
                                pagectrl.changeviewprofile();
                              
                              },

                              child: Text("View"))
                          ],
                        )
                      ],
                    ));
      }
    );
  }
}