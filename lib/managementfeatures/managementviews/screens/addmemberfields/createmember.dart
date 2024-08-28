import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/calculationusecase.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';

import '../../../../authentifeatures/widgets/textformwidget.dart';
import '../../../../widgets/titletext.dart';
import '../../widgets/dialogswidget.dart';

class CreateMember extends StatefulWidget {
  const CreateMember({super.key});

  @override
  State<CreateMember> createState() => _CreateMemberState();
}

class _CreateMemberState extends State<CreateMember> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  final GlobalKey<FormState> _formKeys = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool iscash = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddMemberController>(builder: (addmemberctrl) {
      iscash = addmemberctrl.ispaymentcash;
      return Cardonly(
          color: Colors.transparent,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //upload image
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: CardwithShadow(
                        padding: EdgeInsets.zero,
                        onpress: () {
                          addmemberctrl.pickImage();
                        },
                        child: addmemberctrl.isImageloading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Colors.blue[300],
                                ),
                              )
                            : addmemberctrl.getprofile != null
                                ? Image.memory(
                                    addmemberctrl.getprofile!,
                                    fit: BoxFit.contain,
                                  )
                                : const Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Center(
                                      child: Icon(Icons.add_a_photo_outlined),
                                    ),
                                  )),
                  ),
                  Text(
                    addmemberctrl.isimagesize
                        ? "Photo must be 500 x 500 px"
                        : "Photo exceeds 500 x 500 px",
                    style: TextStyle(
                        color: addmemberctrl.isimagesize
                            ? Theme.of(context).colorScheme.onSurface
                            : Theme.of(context).colorScheme.error,
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Form(
                      key: _formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldWidget(
                              hint: "User Name", controller: username),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFieldWidget(
                            hint: "Password",
                            controller: password,
                            obscure: true,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            "Bill Details",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Admission Fees"),
                              addmemberctrl.admissionfees != null
                                  ? Text(
                                      "Rs ${addmemberctrl.admissionfees!.price}")
                                  : const SizedBox()
                            ],
                          ),
                          addmemberctrl.selectedplan != null
                              ? Text(addmemberctrl.selectedplan!.category)
                              : const SizedBox(),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Price"),
                              addmemberctrl.selectedplan != null
                                  ? Text(
                                      "Rs ${addmemberctrl.selectedplan!.price}")
                                  : const SizedBox(),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Discount"),
                              addmemberctrl.selectedplan != null
                                  ? Text(
                                      "${addmemberctrl.selectedplan!.discountPercentage} %")
                                  : const SizedBox(),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Discounted price"),
                              addmemberctrl.selectedplan != null
                                  ? Text(
                                      "Rs ${addmemberctrl.selectedplan!.price - (addmemberctrl.selectedplan!.price * (addmemberctrl.selectedplan!.discountPercentage / 100))}")
                                  : const SizedBox(),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Total",
                                style: TextStyle(fontSize: 20),
                              ),
                              addmemberctrl.selectedplan != null
                                  ? Text(
                                      "Rs ${total(addmemberctrl.admissionfees!.price, percentprice(addmemberctrl.selectedplan!.price, addmemberctrl.selectedplan!.discountPercentage))}",
                                      style: const TextStyle(fontSize: 20),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CardwithShadow(
                              onpress: () {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      StatefulBuilder(builder: (context, s) {
                                    return PageDialog(
                                        no: () {
                                          Navigator.pop(context);
                                        },
                                        yes: () {
                                          addmemberctrl.addXtremer(username.text,password.text);
                                          // ScaffoldMessenger.of(context)
                                          //     .showSnackBar(const SnackBar(
                                          //   content:
                                          //       Text("Added Member Successfully"),
                                          //   duration: Durations.extralong1,
                                          // ));
            
                                          Navigator.pop(context);
            
                                          // showDialog(
                                          //   context: context,
                                          //   builder: (context) => Dialog(
                                          //     child: SizedBox(
                                          //       height: 600,
                                          //       width: 400,
                                          //       child: Padding(
                                          //         padding:
                                          //             const EdgeInsets.all(20),
                                          //         child: Column(
                                          //           crossAxisAlignment:
                                          //               CrossAxisAlignment.start,
                                          //           children: [
                                          //             Expanded(
                                          //               child: Column(
                                          //                 crossAxisAlignment:
                                          //                     CrossAxisAlignment
                                          //                         .start,
                                          //                 children: [
                                          //                   Row(
                                          //                     mainAxisAlignment:
                                          //                         MainAxisAlignment
                                          //                             .center,
                                          //                     children: [
                                          //                       Image.asset(
                                          //                         'assets/logo2.png',
                                          //                         height: 100,
                                          //                         width: 100,
                                          //                       ),
                                          //                     ],
                                          //                   ),
                                          //                   const SizedBox(
                                          //                       height: 20),
                                          //                   const Text(
                                          //                       'Company Name',
                                          //                       style: TextStyle(
                                          //                           fontSize: 24,
                                          //                           fontWeight:
                                          //                               FontWeight
                                          //                                   .bold)),
                                          //                   const Text(
                                          //                       'Phone: (123) 456-7890',
                                          //                       style: TextStyle(
                                          //                           fontSize:
                                          //                               18)),
                                          //                   const Text(
                                          //                       'Email: info@company.com',
                                          //                       style: TextStyle(
                                          //                           fontSize:
                                          //                               18)),
                                          //                   const SizedBox(
                                          //                       height: 20),
                                          //                   const Divider(),
                                          //                   const SizedBox(
                                          //                       height: 10),
                                          //                   const Text(
                                          //                       'Transaction ID: 123456789',
                                          //                       style: TextStyle(
                                          //                           fontSize:
                                          //                               18)),
                                          //                   Text(
                                          //                       'Date: ${DateTime.now().toLocal().toString()}',
                                          //                       style:
                                          //                           const TextStyle(
                                          //                               fontSize:
                                          //                                   18)),
                                          //                   const SizedBox(
                                          //                       height: 20),
                                          //                   const Row(
                                          //                     mainAxisAlignment:
                                          //                         MainAxisAlignment
                                          //                             .spaceBetween,
                                          //                     children: [
                                          //                       Text('Amount Due',
                                          //                           style: TextStyle(
                                          //                               fontSize:
                                          //                                   18)),
                                          //                       Text('\$123.45',
                                          //                           style: TextStyle(
                                          //                               fontSize:
                                          //                                   18)),
                                          //                     ],
                                          //                   ),
                                          //                   const SizedBox(
                                          //                       height: 20),
                                          //                   const Text(
                                          //                       'Thank you for your purchase!',
                                          //                       style: TextStyle(
                                          //                           fontSize:
                                          //                               16)),
                                          //                 ],
                                          //               ),
                                          //             ),
                                          //             CardwithShadow(
                                          //                 onpress: () {
                                          //                   addmemberctrl
                                          //                       .createAndPrintPdf();
                                          //                   Navigator.pop(
                                          //                       context);
                                          //                 },
                                          //                 child: const Row(
                                          //                   children: [
                                          //                     Icon(Icons.print),
                                          //                     SizedBox(
                                          //                       width: 10,
                                          //                     ),
                                          //                     Text(
                                          //                         "Print Receipt")
                                          //                   ],
                                          //                 ))
                                          //           ],
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // );
                                        },
                                        child: Form(
                                          key: _formKeys,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const TitleText(
                                                      "Payment Method"),
                                                  IconButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      icon:
                                                          const Icon(Icons.close))
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              const Text(
                                                "Bill Details",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text("Admission Fees"),
                                                  addmemberctrl.admissionfees !=
                                                          null
                                                      ? Text(
                                                          "Rs ${addmemberctrl.admissionfees!.price}")
                                                      : const SizedBox()
                                                ],
                                              ),
                                              addmemberctrl.selectedplan != null
                                                  ? Text(addmemberctrl
                                                      .selectedplan!.category)
                                                  : const SizedBox(),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text("Price"),
                                                  addmemberctrl.selectedplan !=
                                                          null
                                                      ? Text(
                                                          "Rs ${addmemberctrl.selectedplan!.price}")
                                                      : const SizedBox(),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text("Discount"),
                                                  addmemberctrl.selectedplan !=
                                                          null
                                                      ? Text(
                                                          "${addmemberctrl.selectedplan!.discountPercentage} %")
                                                      : const SizedBox(),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text("Discounted price"),
                                                  addmemberctrl.selectedplan !=
                                                          null
                                                      ? Text(
                                                          "Rs ${addmemberctrl.selectedplan!.price - (addmemberctrl.selectedplan!.price * (addmemberctrl.selectedplan!.discountPercentage / 100))}")
                                                      : const SizedBox(),
                                                ],
                                              ),
                                              const Divider(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Total",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  addmemberctrl.selectedplan !=
                                                          null
                                                      ? Text(
                                                          "Rs ${total(addmemberctrl.admissionfees!.price, percentprice(addmemberctrl.selectedplan!.price, addmemberctrl.selectedplan!.discountPercentage))}",
                                                          style: const TextStyle(
                                                              fontSize: 20),
                                                        )
                                                      : const SizedBox(),
                                                ],
                                              ),
            
                                              // Row(
                                              //   children: [
                                              //     Expanded(child: CardwithShadow(
                                              //       color: Theme.of(context).colorScheme.error.withOpacity(0.6),
                                              //       margin: const EdgeInsets.all(16),
                                              //       child: const Text("Check Plans before Adding?\nPress OK to confirm",textAlign: TextAlign.center,)))
                                              //   ],
                                              // )
            
                                              const Text("Choose Payment Method"),
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              Row(
                                                children: [
                                                  Radio(
                                                      activeColor: Colors.blue,
                                                      value: true,
                                                      groupValue: iscash,
                                                      onChanged: (v) {
                                                        s(() {
                                                          addmemberctrl
                                                              .setpaymentmethod(
                                                                  v!);
                                                          iscash = v;
                                                        });
                                                      }),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  const Text("Cash"),
                                                  const SizedBox(
                                                    width: 16,
                                                  ),
                                                  Radio(
                                                      activeColor: Colors.blue,
                                                      value: false,
                                                      groupValue: iscash,
                                                      onChanged: (v) {
                                                        s(() {
                                                          addmemberctrl
                                                              .setpaymentmethod(
                                                                  v!);
                                                          iscash = v;
                                                        });
                                                      }),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  const Text("Online"),
                                                  const SizedBox(
                                                    width: 16,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ));
                                  }),
                                );
                              },
                              color: Colors.blue[300],
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.money,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    "Pay Now",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ))
                        ],
                      ))
                ],
              ),
            ),
          ));
    });
  }
}
