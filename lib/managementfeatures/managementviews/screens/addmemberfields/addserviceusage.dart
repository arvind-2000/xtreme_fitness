import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/authentifeatures/domain/domainusecases.dart';
import 'package:xtreme_fitness/authentifeatures/models/usecasesimpl.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/servicesentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/dialogswidget.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/scaffolds.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';
import 'package:xtreme_fitness/widgets/normaltext.dart';
import 'package:xtreme_fitness/widgets/textformwidget.dart';

import '../../../../config/const.dart';
import '../../../../widgets/cardborder.dart';
import '../../../../widgets/cardswithshadow.dart';
import '../../../../widgets/titletext.dart';
import '../../widgets/paymentstatuscard.dart';
import '../nodatascreen.dart/nodatascreen.dart';

class AddServiceUsage extends StatefulWidget {
  const AddServiceUsage({super.key, this.serviceEntity, this.phonenumber});
  final ServiceEntity? serviceEntity;
  final String? phonenumber;
  @override
  State<AddServiceUsage> createState() => _AddServiceUsageState();
}

class _AddServiceUsageState extends State<AddServiceUsage> {
  final GlobalKey<FormState> _globalKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.serviceEntity != null) {
        Get.put(AddMemberController()).addservices(widget.serviceEntity!);
      }
      if(widget.phonenumber!=null){
        _phonenumber.text = widget.phonenumber!;
      }
    });
  }

  final TextEditingController _phonenumber = TextEditingController();
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey();
  final AuthUseCases _authusecase = AuthenticateUseCases();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width;
    return GetBuilder<GetxAuthController>(builder: (authctrl) {
      return GetBuilder<AddMemberController>(builder: (addmemberctrl) {
        return GetBuilder<GetxLandingcontroller>(builder: (landingctrl) {
          return Center(
            child: ConstrainedBox(
              constraints:
                  const BoxConstraints(maxWidth: 1000, maxHeight: 1000),
              child: addmemberctrl.paymentstatus != 0
                  ? PaymentStatusCard(
                      callback: (){
                        addmemberctrl.changepaymentstatus(0);
                        addmemberctrl.changeServiceUsage(ispage: false);
                        Get.back();
                      },
                    )
                  : Form(
                      key: _globalKey,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const HeadingText("Book Service"),
                              const SizedBox(
                                height: 16,
                              ),
                              landingctrl.getallservices.isEmpty
                                  ? const NodataScreen(
                                      title: "No Services",
                                      desc: "No Services to show.",
                                      onpress: null,
                                    )
                                  : GridView(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: size < 500
                                            ? 1
                                            : size < mobilescreen
                                                ? 2
                                                : size > mobilescreen &&
                                                        size < 1200
                                                    ? 3
                                                    : 3,
                                        mainAxisSpacing: 16,
                                        crossAxisSpacing: 16,
                                        childAspectRatio: size < 500
                                            ? 1
                                            : size < 700
                                                ? 4 / 6
                                                : 4 / 5,
                                      ),
                                      children: landingctrl.getallservices
                                          .where(
                                            (element) => element.isactive,
                                          )
                                          .toList()
                                          .asMap()
                                          .entries
                                          .map(
                                            (e) => CardwithShadow(
                                                // margin: const EdgeInsets.all(16),
                                                color: addmemberctrl
                                                            .selectedservice !=
                                                        null
                                                    ? addmemberctrl
                                                                .selectedservice!
                                                                .id ==
                                                            e.value.id
                                                        ? Colors.grey[700]
                                                        : null
                                                    : null,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    HeadingText(
                                                      e.value.name,
                                                      size: 24,
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text(
                                                              "Member Price"),
                                                          Text(
                                                            e.value.memberPrice
                                                                .toString(),
                                                            style: const TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          const Text(
                                                              "Non Member Price"),
                                                          Text(
                                                            e.value.nonMemberPrice
                                                                .toString(),
                                                            style: const TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    CardBorder(
                                                        onpress: () {
                                                          addmemberctrl
                                                              .addservices(
                                                                  e.value);
                                                        },
                                                        color: Colors.green[300],
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              addmemberctrl.selectedservice !=
                                                                          null &&
                                                                      addmemberctrl
                                                                              .selectedservice!
                                                                              .id ==
                                                                          e.value
                                                                              .id
                                                                  ? Icons.check
                                                                  : Icons.add,
                                                              color: Colors.white,
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            addmemberctrl.selectedservice !=
                                                                        null &&
                                                                    addmemberctrl
                                                                            .selectedservice!
                                                                            .id ==
                                                                        e.value.id
                                                                ? const Text(
                                                                    "Service Added",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white))
                                                                : const Text(
                                                                    "Add Service",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  )
                                                          ],
                                                        ))
                                                  ],
                                                )),
                                          )
                                          .toList()),
                              const SizedBox(
                                height: 16,
                              ),
                              addmemberctrl.selectedservice == null
                                  ? const SizedBox()
                                  : Column(
                                      children: [
                                        const NormalText(
                                          text: "Bill Details",
                                          size: 16,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Amount"),
                                            authctrl.getuser!=null&& authctrl.ismember?Text(
                                                "Rs . ${addmemberctrl.selectedservice!.memberPrice}"):Text(
                                                "Rs . ${addmemberctrl.selectedservice!.nonMemberPrice}")
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Divider(
                                          color: Colors.grey[600],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Total Amount"),
                                         authctrl.getuser!=null && authctrl.ismember?Text(
                                                "Rs . ${addmemberctrl.selectedservice!.memberPrice}"):Text(
                                                "Rs . ${addmemberctrl.selectedservice!.nonMemberPrice}")
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Cardonly(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            padding: const EdgeInsets.all(16),
                                            margin: EdgeInsets.zero,
                                            onpress: () async {
                                              Get.dialog(StatefulBuilder(
                                                  builder: (context, state) {
                                                return PageDialog(
                                                  allignToCenter: true,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                           TitleText(
                                                              "Payment Method",size:MediaQuery.sizeOf(context).width<mobilescreen?16:null),
                                                          IconButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              icon: const Icon(
                                                                  Icons.close))
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 30,
                                                      ),
                                                      const NormalText(
                                                        text: "Bill Details",
                                                        size: 16,
                                                      ),
                                                      Text(addmemberctrl
                                                          .selectedservice!
                                                          .name),
                                                      const SizedBox(
                                                        height: 16,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text("Amount"),
                                                           authctrl.getuser!=null && authctrl.ismember?Text(
                                                                                                  "Rs . ${addmemberctrl.selectedservice!.memberPrice}"):Text(
                                                                                                  "Rs . ${addmemberctrl.selectedservice!.nonMemberPrice}")
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 16,
                                                      ),
                                                      Divider(
                                                        color: Colors.grey[600],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text(
                                                              "Total Amount"),
                                                        authctrl.getuser!=null && authctrl.ismember?Text(
                                                                                                  "Rs . ${addmemberctrl.selectedservice!.memberPrice}"):Text(
                                                                                                  "Rs . ${addmemberctrl.selectedservice!.nonMemberPrice}")
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 16,
                                                      ),
                                                      addmemberctrl.authctrl.ismember
                                                          ? const SizedBox()
                                                          : const Text(
                                                              "Choose Payment Method"),
                                                      addmemberctrl.authctrl.ismember
                                                          ? const SizedBox()
                                                          : Row(
                                                              children: [
                                                                Radio(
                                                                    activeColor:
                                                                        Colors
                                                                            .blue,
                                                                    value: true,
                                                                    groupValue:
                                                                        addmemberctrl
                                                                            .ispaymentcash,
                                                                    onChanged:
                                                                        (v) {
                                                                      state(() {
                                                                        addmemberctrl
                                                                            .setpaymentmethod(v!);
                                                                      });
                                                                    }),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                const Text(
                                                                    "Cash"),
                                                                const SizedBox(
                                                                  width: 16,
                                                                ),
                                                                Radio(
                                                                    activeColor:
                                                                        Colors
                                                                            .blue,
                                                                    value:
                                                                        false,
                                                                    groupValue:
                                                                        addmemberctrl
                                                                            .ispaymentcash,
                                                                    onChanged:
                                                                        (v) {
                                                                      state(() {
                                                                        addmemberctrl
                                                                            .setpaymentmethod(v!);
                                                                      });
                                                                    }),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                const Text(
                                                                    "Online"),
                                                                const SizedBox(
                                                                  width: 16,
                                                                ),
                                                              ],
                                                            ),
                                                      const SizedBox(
                                                        height: 16,
                                                      ),
                                                      authctrl.getuser == null ||
                                                              authctrl.ismember ==
                                                                  false
                                                          ? Form(
                                                              key: _formkey,
                                                              child: Column(
                                                                children: [
                                                     
                                                                  TextFieldWidget(
                                                                    hint:
                                                                        "Phone Number",
                                                                    controller:
                                                                        _phonenumber,
                                                                    validator:
                                                                        () {
                                                                      return _authusecase.phoneAuth(
                                                                          _phonenumber
                                                                              .text,
                                                                          "Enter a valid number");
                                                                    },
                                                                  ),
                                                                  TextFieldWidget(
                                                                      hint:
                                                                          "First Name",
                                                                      controller:
                                                                          _firstname,
                                                                      validator:
                                                                          () {
                                                                        return _authusecase.nameAuth(
                                                                            _firstname.text,
                                                                            "Enter a valid name");
                                                                      }),
                                                                                    TextFieldWidget(
                                                                    hint:
                                                                        "Last Name",
                                                                    controller:
                                                                        _lastname,
                                                                    validator:
                                                                        () {
                                                                      return _authusecase.nameAuth(
                                                                          _lastname
                                                                              .text,
                                                                          "Enter a valid name");
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          : const SizedBox(),
                                                    ],
                                                  ),
                                                  no: () {
                                                    Navigator.pop(context);
                                                  },
                                                  yes: () async {
                                                    bool v = true;
                                                    // create user
                          
                                                    if (authctrl.getuser==null ||
                                                        authctrl.ismember ==
                                                            false) {
                                                      if (_formkey.currentState!
                                                          .validate()) {
                                                        Navigator.pop(context);
                                                        addmemberctrl
                                                            .changepaymentstatus(
                                                                3);
                                                        Future.delayed(
                                                          const Duration(
                                                              seconds: 3),
                                                          () async {
                                                            v = await addmemberctrl.createuser(
                                                                _phonenumber.text
                                                                    .trim(),
                                                                '${_firstname.text.trim()}',
                                                                _phonenumber.text
                                                                    .trim(),
                                                                role: authctrl.getuser ==
                                                                            null ||
                                                                        authctrl.ismember ==
                                                                            false
                                                                    ? "servicemember"
                                                                    : "Member");
                          
                                                            if (v) {
                                                              addmemberctrl.addServiceusage(
                                                                  paymentonline:
                                                                      !addmemberctrl
                                                                          .ispaymentcash);
                                                            } else {
                                                              addmemberctrl
                                                                  .changepaymentstatus(
                                                                      4);
                                                              CustomSnackbar(
                                                                  context,
                                                                  addmemberctrl
                                                                          .usererrormessage ??
                                                                      "Error creating payement");
                                                              //print("${addmemberctrl.usererrormessage}");
                                                            }
                                                          },
                                                        );
                                                      }
                                                    } else {
                                                     Get.back();

                                                    
                                                      addmemberctrl
                                                          .changepaymentstatus(3);
                                                      Future.delayed(
                                                        const Duration(
                                                            seconds: 3),
                                                        () {
                                                          addmemberctrl.addServiceusage(
                                                              paymentonline:
                                                                  !addmemberctrl
                                                                      .ispaymentcash);
                                                        },
                                                      );
                                                    }
                                                  },
                                                );
                                              }));
                          
                                              //
                                            },
                                            child: const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.add),
                                                SizedBox(
                                                  width: 6,
                                                ),
                                                Text("Add Service"),
                                              ],
                                            )),
                                      ],
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ),
          );
        });
      });
    });
  }
}
