import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:xtreme_fitness/config/const.dart';

import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/editrenewxtremers/editmemberform.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/editrenewxtremers/renewalforms.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/cardborder.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';

import '../../../widgets/textformwidget.dart';
import '../../managementdomain/entities.dart/xtremer.dart';


class RenewalScreen extends StatefulWidget {
  const RenewalScreen({super.key});

  @override
  State<RenewalScreen> createState() => _RenewalScreenState();
}

class _RenewalScreenState extends State<RenewalScreen> {
  final TextEditingController _searchcontroller = TextEditingController();
  final FocusNode _searchfocus = FocusNode();
  @override
  void dispose() {
    _searchcontroller.dispose();
    _searchfocus.dispose(); 
    Get.find<GetxPageController>().disposes();
    Get.find<AddMemberController>().onClose();
    super.dispose();
  }

  List<String> d = ["All Members", "Personal", "General"];
  List<String> renewlist = ["Renewal", "Edit", "View"];
  int pos = 0;
  int renewalpos = 0;
  Xtremer? _user;
  void changeuser(Xtremer us) {
    _user = us;
  }

  @override
  void initState() {
    super.initState();
    _searchfocus.requestFocus();
    Get.put(AddMemberController()).onInit();
    WidgetsBinding.instance.addPostFrameCallback(

      (timeStamp) => Get.find<ManagementController>().getxtremer(),
    );
  }



  @override
  Widget build(BuildContext context) {
    // createAndPrintPdf(PaymentDetails(id: 0, userId: 123, amount: 4000, discountPercentage: 10, receivedAmount: 3900, paymentDate: DateTime.now(), transactionId: "XTRMPAY@366421", paymentStatus: "Online", paymentMethod: "dfhfdjhf", paymentType: "fsjfhjshf", subscriptionId: 0123));
    return GetBuilder<AddMemberController>(
      builder: (addmemberctrl) {
        return GetBuilder<GetxPageController>(builder: (pagectrl) {
          return GetBuilder<ManagementController>(builder: (managectrl) {
            return pagectrl.isrenewalforms?RenewalForms()
                :pagectrl.iseditforms?EditmemberForm(): Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //     const Padding(
                      //   padding: EdgeInsets.all(16.0),
                      //   child: Row(
                      //     children: [
                      //       HeadingText("Renewal",size: 30,),
                      //     ],
                      //   ),
                      // ),
                      Expanded(
                        child: CardwithShadow(
                          margin: const EdgeInsets.all(16),
                          padding: EdgeInsets.zero,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // const Text("All Members",style: TextStyle(fontSize: 20,),),
                                  
                                    SizedBox(
                                        height: 40,
                                     
                                        child: CardBorder(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary
                                              .withOpacity(0.4),
                                          margin: EdgeInsets.zero,
                                          padding: const EdgeInsets.only(
                                              left: 16, right: 8),
                                          child: DropdownButton(
                                            underline: const SizedBox(),
                                            value: pos,
                                            hint: Text(d[pos],style: const TextStyle(overflow: TextOverflow.ellipsis)),
                                            items: d
                                                .asMap()
                                                .entries
                                                .map((e) => DropdownMenuItem(
                                                      value: e.key,
                                                      child: Text(e.value,style: const TextStyle(overflow: TextOverflow.ellipsis),),
                                                    ))
                                                .toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                pos = value!;
                                                if(pos == 0){
                                                    managectrl.allxtremer();
                                                }else if(pos == 1){
                                                      managectrl.personalxtremer();
                                                }else if(pos == 2){
                                                       managectrl.generalxtremer();
                                                }
                                              });
                                            },
                                          ),
                                        )),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height:50,
                                            width:MediaQuery.sizeOf(context).width<mobilescreen?double.maxFinite: 400,
                                            child: TextFieldWidget(
                                                hint: "Search by id, name or phone",
                                                controller: _searchcontroller,
                                                validator: () {
                                                                            
                                                                            
                                                },
                                                onchanged: (text) {
                                                        managectrl.searchusers(text);
                                                },
                                                fieldsubmitted: (){
                                                  managectrl.searchusers(_searchcontroller.text);
                                                  _searchcontroller.clear();
                                                },
                                              
                                                icon: const Icon(Icons.search)),
                                          ),
        
                                              const SizedBox(height: 10,),
                                    Text(managectrl.searchmessage!),
                                        ],
                                      ),
                                    ),
                                   
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  IconButton(onPressed: (){
                                    pagectrl.changerenewal(true);
                                  }, icon: const Icon(Icons.repeat_one)),
                                  const SizedBox(width: 20,),
                                  IconButton(onPressed: (){
                                        pagectrl.changeeditform(true);
                                  }, icon: const Icon(Icons.edit)),
                                    // const Expanded(
                                    //     child: Row(
                                    //   children: [],
                                    // )),
                                    // Cardonly(
                                    //   onpress: (){},
                                    //   color: Theme.of(context).colorScheme.secondary,child: Text("Search",style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),),)
                                  ],
                                ),
                              ),
                       
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Expanded(
                                        child: Text(
                                      "Name",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    const Expanded(
                                        child: Text("phone",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold))),
                                    const Expanded(
                                        child: Text("Start",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold))),
                                    MediaQuery.sizeOf(context).width <= mobilescreen
                                        ? const SizedBox()
                                        : const Expanded(
                                            child: Text("End",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold))),
                                    MediaQuery.sizeOf(context).width <= mobilescreen
                                        ? const SizedBox()
                                        : const Expanded(
                                            child: Text("Membership",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold))),
                                    const Expanded(
                                        child: Text("Actions",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold))),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.2),
                                height: 1,
                              ),
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                        Expanded(child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 10,),
                                            Text(managectrl.getsearchXtremer[index].firstName!,style:const TextStyle(fontSize: 14),),
                                               MediaQuery.sizeOf(context).width<=mobilescreen?Cardonly(
                                                  margin: const EdgeInsets.only(top: 4),
                                                  padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 16),
                                                  color: Colors.green[200],
                                                  child: const Text('Personal',style: TextStyle(fontSize: 10),)):const SizedBox()
                                          ],
                                        )),
                                        Expanded(child: Text(managectrl.getsearchXtremer[index].homeNumber!,style:const TextStyle(fontSize: 14))),
                                        Expanded(child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text("4/5/2024",style:TextStyle(fontSize: 14)),
                                            const SizedBox(height: 5,),
                                            MediaQuery.sizeOf(context).width<=mobilescreen?const Text("4/5/2024",style:TextStyle(fontSize: 14)):const SizedBox()
                                          ],
                                        )),
                                        MediaQuery.sizeOf(context).width<=mobilescreen?const SizedBox():const Expanded(child: Text("4/5/2024",style:TextStyle(fontSize: 14))),
                                      //  MediaQuery.sizeOf(context).width<=mobilescreen?const SizedBox():Expanded(child: Text(managectrl.getsearchXtremer[index].trainerName!.isEmpty?"General":"Personal",style:const TextStyle(fontSize: 14))),
                                        Expanded(child:MediaQuery.sizeOf(context).width<=mobilescreen?SizedBox(
                                          height: 30,
                                          child: CardBorder(
                                              margin: EdgeInsets.zero,
                                              padding: const EdgeInsets.only(left: 16,right: 8),
                                              child: DropdownButton(
                                                underline:const SizedBox(),
                                                value: renewalpos,
                                                items:renewlist.asMap().entries.map((e) => DropdownMenuItem(value: e.key,child: Text(e.value,style: const TextStyle(fontSize: 10),),)).toList(), onChanged:(value) {
                                                setState(() {       
                                                   renewalpos = value!;  
                                          
                                                });
                                              },),
                                            ),
                                        ):Row(
                                          children: [
                                            CardBorder(
                                              margin: EdgeInsets.zero,
                                              onpress: (){
                                                pagectrl.changerenewal(true);
                                                      addmemberctrl.addxtremersrenewaledit(managectrl.getsearchXtremer[index]);
                                                     
                                              },
                                              child: const Text("Renewal",style:TextStyle(fontSize: 14))),
                                              const SizedBox(width: 5,),
                                              IconButton(onPressed: (){
                                                pagectrl.changeeditform(true);
                                                     addmemberctrl.addxtremersedit(managectrl.getsearchXtremer[index]);
                                                     

                                              }, icon: const Icon(Icons.edit,size: 14,),tooltip: "Edit",),
                                                 const SizedBox(width: 5,),
                                              IconButton(onPressed: (){
                                                    changeuser(managectrl.getsearchXtremer[index]);
                                                    pagectrl.changeviewprofile();
                                                
                                              }, icon: const Icon(Icons.person,size: 14,),tooltip: "View Profile",),
                                          ],
                                        )),
                                                          
                                                              ],),
                                      ),
                                      Divider(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary
                                            .withOpacity(0.2),
                                        height: 1,
                                      ),
                                    ],
                                  ),
                                  itemCount: managectrl.getsearchXtremer.length,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                
                    ],
                  );
          });
        });
      }
    );
  }
}
