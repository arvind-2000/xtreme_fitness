import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/calculationusecase.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/editrenewxtremers/editmemberform.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/editrenewxtremers/renewalforms.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/profilescreens/memberprofilescreen.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/scaffolds.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/xtremertabledatagrid.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/cardborder.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';

import '../../../widgets/headingtext.dart';
import '../../../widgets/textformwidget.dart';
import '../../managementdomain/entities.dart/xtremer.dart';
import 'nodatascreen.dart/nodatascreen.dart';

class RenewalScreen extends StatefulWidget {
  const RenewalScreen({super.key, this.pos});
  final int? pos;
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
    Get.find<GetxPageController>().renewaldispose();
    Get.find<AddMemberController>().onClose();
    Get.find<AddMemberController>().closeaddmembers();
    super.dispose();
  }

  List<String> d = [
    "All Members",
    "Personal",
    "General",
    "InActive",
    "To be Expired"
  ];
  List<String> renewlist = ["Renewal", "Edit", "View"];
  int pos = 0;
  DateTime startdatexl = DateTime.now();
  DateTime enddatexl = DateTime.now();
  int chooseXtremerxl = 0;
  int renewalpos = 0;
  Xtremer? _user;
  void changeuser(Xtremer us) {
    _user = us;
  }
  DataGridController dataGridController = DataGridController();
  @override
  void initState() {
    super.initState();
    _searchfocus.requestFocus();
    if (widget.pos != null) {
      pos = widget.pos!;
     
    }
 Get.find<ManagementController>().allxtremer();
    Get.put(AddMemberController());
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (timeStamp) => Get.find<ManagementController>().getxtremer(),
    // );
  }

  @override
  Widget build(BuildContext context) {
    // createAndPrintPdf(PaymentDetails(id: 0, userId: 123, amount: 4000, discountPercentage: 10, receivedAmount: 3900, paymentDate: DateTime.now(), transactionId: "XTRMPAY@366421", paymentStatus: "Online", paymentMethod: "dfhfdjhf", paymentType: "fsjfhjshf", subscriptionId: 0123));
    return GetBuilder<AddMemberController>(builder: (addmemberctrl) {
      return GetBuilder<GetxPageController>(builder: (pagectrl) {
        return GetBuilder<ManagementController>(builder: (managectrl) {
          return pagectrl.isrenewalforms
              ? const RenewalForms()
              : pagectrl.iseditforms
                  ? EditmemberForm()
                  : pagectrl.viewprofile && _user != null
                      ? MemberProfilescreen(
                          user: _user,
                          pagectrl: pagectrl,
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  HeadingText(
                                    "Xtremers",
                                    size: 30,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // const Text("All Members",style: TextStyle(fontSize: 20,),),

                                        SizedBox(
                                            height: MediaQuery.sizeOf(context)
                                                        .width <=
                                                    mobilescreen
                                                ? 40
                                                : 50,
                                            child: CardBorder(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary
                                                  .withOpacity(0.4),
                                              margin: EdgeInsets.zero,
                                              padding: const EdgeInsets.only(
                                                  left: 16, right: 8),
                                              child: DropdownButton(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                underline: const SizedBox(),
                                                dropdownColor: Colors.grey[800],
                                                focusColor: Colors.transparent,
                                                value: pos,
                                                hint: Text(d[pos],
                                                    style: const TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis)),
                                                items: d
                                                    .asMap()
                                                    .entries
                                                    .map((e) =>
                                                        DropdownMenuItem(
                                                          value: e.key,
                                                          child: Text(
                                                            e.value,
                                                            style: const TextStyle(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                fontSize: 12),
                                                          ),
                                                        ))
                                                    .toList(),
                                                onChanged: (value) {
                                                  setState(() {
                                                    pos = value!;
                                                    if (pos == 0) {
                                                      managectrl.allxtremer();
                                                    } else if (pos == 1) {
                                                      managectrl
                                                          .personalxtremer();
                                                    } else if (pos == 2) {
                                                      managectrl
                                                          .generalxtremer();
                                                    } else if (pos == 3) {
                                                      managectrl
                                                          .inactivextremer();
                                                    } else {
                                                      managectrl
                                                          .tobeexpiredlist();
                                                    }
                                                  });
                                                },
                                              ),
                                            )),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        MediaQuery.sizeOf(context).width <=
                                                mobilescreen
                                            ? const SizedBox()
                                            : Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 60,
                                                      width: MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              mobilescreen
                                                          ? double.maxFinite
                                                          : 400,
                                                      child: TextFieldWidget(
                                                          showhint: false,
                                                          hint:
                                                              "Search by id, name or phone",
                                                          controller:
                                                              _searchcontroller,
                                                          validator: () {},
                                                          onchanged: (text) {
                                                            managectrl
                                                                .searchusers(
                                                                    text);
                                                          },
                                                          fieldsubmitted: () {
                                                            managectrl.searchusers(
                                                                _searchcontroller
                                                                    .text);
                                                            _searchcontroller
                                                                .clear();
                                                          },
                                                          icon: const Icon(
                                                              Icons.search)),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(managectrl
                                                        .searchmessage!),
                                                  ],
                                                ),
                                              ),

                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                            height: MediaQuery.sizeOf(context)
                                                        .width <=
                                                    mobilescreen
                                                ? 40
                                                : 50,
                                            child: CardBorder(
                                                onpress: () {
                                                  Get.dialog(StatefulBuilder(
                                                      builder: (context, s) {
                                                    return Dialog(
                                                        child: SizedBox(
                                                      width: 500,
                                                      height: 600,
                                                      child: Cardonly(
                                                        margin: EdgeInsets.zero,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(vertical: 8,horizontal: 16),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const SizedBox(
                                                                height: 16,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  const HeadingText(
                                                                    "Export Xtremers",
                                                                    size: 20,
                                                                  ),
                                                                  IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        Get.back();
                                                                      },
                                                                      icon:
                                                                          const Icon(
                                                                        Icons
                                                                            .close,
                                                                        size:
                                                                            16,
                                                                      ))
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 16,
                                                              ),
                                                              Expanded(
                                                                  child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "Choose Xtremer",
                                                                    style: TextStyle(
                                                                        color: Theme.of(context)
                                                                            .colorScheme
                                                                            .onPrimary
                                                                            .withOpacity(
                                                                                0.5),
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          50,
                                                                      child:
                                                                          CardBorder(
                                                                        color: Theme.of(context)
                                                                            .colorScheme
                                                                            .onPrimary
                                                                            .withOpacity(0.4),
                                                                        margin:
                                                                            EdgeInsets.zero,
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            left:
                                                                                16,
                                                                            right:
                                                                                8),
                                                                        child:
                                                                            DropdownButton(
                                                                          underline:
                                                                              const SizedBox(),
                                                                          value:
                                                                              chooseXtremerxl,
                                                                          dropdownColor:
                                                                              Colors.grey[700],
                                                                          borderRadius:
                                                                              BorderRadius.circular(16),
                                                                          hint: Text(
                                                                              d[pos],
                                                                              style: const TextStyle(overflow: TextOverflow.ellipsis)),
                                                                          items: d
                                                                              .asMap()
                                                                              .entries
                                                                              .map((e) => DropdownMenuItem(
                                                                                    value: e.key,
                                                                                    child: Text(
                                                                                      e.value,
                                                                                      style: const TextStyle(overflow: TextOverflow.ellipsis, fontSize: 12),
                                                                                    ),
                                                                                  ))
                                                                              .toList(),
                                                                          onChanged:
                                                                              (value) {
                                                                            s(() {
                                                                              chooseXtremerxl = value!;
                                                                            });
                                                                          },
                                                                        ),
                                                                      )),
                                                                  const SizedBox(
                                                                    height: 16,
                                                                  ),
                                                                ],
                                                              )),
                                                              SizedBox(
                                                                width: double
                                                                    .maxFinite,
                                                                child: CardBorder(
                                                                    margin: EdgeInsets.zero,
                                                                    color: Colors.blue,
                                                                    onpress: () async {
                                                                      bool v =
                                                                          await exportXtremerDataToExcel(
                                                                        chooseXtremerxl ==
                                                                                0
                                                                            ? managectrl.getallXtremer
                                                                            : chooseXtremerxl == 1
                                                                                ? managectrl.allpersonalxtremer
                                                                                : chooseXtremerxl == 2
                                                                                    ? managectrl.allgeneralxtremer
                                                                                    : chooseXtremerxl == 3
                                                                                        ? managectrl.allinactivextremer
                                                                                        : managectrl.tobeExpired(),
                                                                        managectrl
                                                                            .getallMembership,
                                                                        "Xtremer list",
                                                                      );
                                                                      CustomSnackbar(
                                                                        
                                                                          v
                                                                              ? "Xtremer Reports exported."
                                                                              : "failed to export. No data");
                                                                    },
                                                                    child: const Center(
                                                                        child: Text(
                                                                      "Export Excels",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16),
                                                                    ))),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ));
                                                  }));
                                                },
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary
                                                    .withOpacity(0.4),
                                                margin: EdgeInsets.zero,
                                                padding: const EdgeInsets.only(
                                                    left: 16, right: 16),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                        height: 20,
                                                        width: 20,
                                                        child: Image.asset(
                                                          'assets/file.png',
                                                        )),
                                                    const Text("Export"),
                                                  ],
                                                ))),
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
                                  MediaQuery.sizeOf(context).width <=
                                          mobilescreen
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 60,
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                                .width <
                                                            mobilescreen
                                                        ? double.maxFinite
                                                        : 400,
                                                child: TextFieldWidget(
                                                    showhint: false,
                                                    hint:
                                                        "Search by id, name or phone",
                                                    controller:
                                                        _searchcontroller,
                                                    validator: () {},
                                                    onchanged: (text) {
                                                      managectrl
                                                          .searchusers(text);
                                                    },
                                                    fieldsubmitted: () {
                                                      managectrl.searchusers(
                                                          _searchcontroller
                                                              .text);
                                                      _searchcontroller.clear();
                                                    },
                                                    icon: const Icon(
                                                        Icons.search)),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              managectrl.searchmessage != null
                                                  ? Text(
                                                      managectrl.searchmessage!,
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[500]))
                                                  : const SizedBox(),
                                            ],
                                          ),
                                        )
                                      : const SizedBox(),
                                  
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                   children: [
                                     CardwithShadow(
                                      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                                      onpress: (){
                                         managectrl.selectedIndex(dataGridController.selectedRows);
                                            Get.dialog(
            
            StatefulBuilder(
            builder: (context,state) {
              
              return Dialog(
                
                child: SizedBox(width: 400,height: 500,child: 
                CardwithShadow(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const HeadingText("Send SMS"),
                      IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.close,size: 14,)),
                
                    ],
                  ),
                  
                       const SizedBox(height: 20,),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            const Text("Choose Template"),
                            const SizedBox(height: 10,),
                             GridView.builder(
                              shrinkWrap: true,
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                crossAxisSpacing: 10,
                                mainAxisExtent: 150,
                                mainAxisSpacing: 10
                                ),
                              itemCount: 3,
                         itemBuilder:(context, index) => CardwithShadow(
                          color: index == managectrl.templatepos?Colors.blue.withOpacity(0.2):null,
                              onpress: (){
                                   state((){
                                    managectrl.changeTemplate(index);
                                   });
                              },
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [const Text("Expiry"),const SizedBox(height: 10,),
                              Text("Your <fdfdfdgd> hfdjghjg hjdhgjhdgjh hgjdhgj",style: TextStyle(color: Colors.grey[500]),maxLines: 3,overflow: TextOverflow.ellipsis,)
                              ],))),
                              const SizedBox(height: 10,),
                             managectrl.selectedgrid.isEmpty?Center(child: Text("No members added. Please add a member first.",style: TextStyle(color: Colors.grey[200]),)): Text("Send Sms to ${managectrl.selectedgrid.length} members",style: TextStyle(color: Colors.grey[500]),),
                              ListView.builder(itemBuilder: (c,i){return CardwithShadow(
                                padding: EdgeInsets.zero,
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                child: ListTile(title: HeadingText('${managectrl.selectedgrid[i].firstName}',size: 16,),subtitle: Text("${managectrl.selectedgrid[i].mobileNumber}",style: const TextStyle(fontSize: 12),),));},itemCount: managectrl.selectedgrid.length,shrinkWrap: true,),
                                            
                          ],),
                        ),
                      ),
                      Cardonly(
                        onpress: managectrl.selectedgrid.isEmpty?null:(){
                          
                          
                          Get.back();
                          CustomSnackbar("SMS succesfully sent");
                        },
                        color: Colors.green[300],
                        child: const Center(child: Text("Send SMS"),))
                  ],)
                  
                  ),
                  ),
              );
            }
          ));

                                      },
                                      margin: const EdgeInsets.symmetric(vertical: 4,horizontal: 16),
                                      child: Center(child: Row(
                                        children: [

                                            Icon(Icons.message_outlined,size: 14,color: Colors.grey[300],),
                            const SizedBox(width: 10,),
                                          const Text("Send SMS"),
                                        ],
                                      ))),
                                   ],
                                 ),
                                  managectrl.getsearchXtremer.isEmpty
                                      ? const Expanded(
                                          child: NodataScreen(
                                              title: "No Xtremers",
                                              desc: "No Xtremers to show"),
                                        )
                                      :  XtremerDataTableWidget(controller: dataGridController,callback: changeuser,selectionMode: SelectionMode.multiple,)
                              
                                ],
                              ),
                            ),
                          ],
                        );
        });
      });
    });
  }
}
