import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import 'package:xtreme_fitness/authentifeatures/models/usecasesimpl.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/config/manageconfig.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';

import '../../../../widgets/cardswithshadow.dart';
import '../../../../widgets/textformwidget.dart';
import '../../controllers/pagecontroller.dart';

class PersonaldetailsField extends StatefulWidget {
  const PersonaldetailsField({
    super.key,
    required this.pagectrl, this.phonenumber,
  });
    final String? phonenumber;
  final GetxPageController pagectrl;

  @override
  State<PersonaldetailsField> createState() => _PersonaldetailsFieldState();
}

class _PersonaldetailsFieldState extends State<PersonaldetailsField> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final AuthenticateUseCases authusecase = AuthenticateUseCases();

  final TextEditingController _fullnamecontroller = TextEditingController();

  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _phonecontroller = TextEditingController();

  final TextEditingController _addresscontroller = TextEditingController();

  final TextEditingController _pincodecontroller = TextEditingController();

  final TextEditingController _occupationcontroller = TextEditingController();

  final TextEditingController _homephonecontroller = TextEditingController();

  final TextEditingController _emergencynamecontroller =
      TextEditingController();

  final TextEditingController _emergencyphonecontroller =
      TextEditingController();

  final TextEditingController _disabilitycontroller = TextEditingController();

  final TextEditingController _othercontroller = TextEditingController();

  final FocusNode _fullnameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();
  final FocusNode _pincodeFocusNode = FocusNode();
  final FocusNode _occupationFocusNode = FocusNode();
  final FocusNode _homephoneFocusNode = FocusNode();
  final FocusNode _emergencynameFocusNode = FocusNode();
  final FocusNode _emergencyphoneFocusNode = FocusNode();
  final FocusNode _disabilityFocusNode = FocusNode();
  final FocusNode _otherFocusNode = FocusNode();
  @override
  void dispose() {
    _fullnamecontroller.dispose();
    _emailcontroller.dispose();
    _phonecontroller.dispose();
    _addresscontroller.dispose();
    _pincodecontroller.dispose();
    _occupationcontroller.dispose();
    _homephonecontroller.dispose();
    _emergencyphonecontroller.dispose();
    _emergencynamecontroller.dispose();
    _disabilitycontroller.dispose();
    _othercontroller.dispose();

    // Dispose FocusNode instances
    _fullnameFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    _addressFocusNode.dispose();
    _pincodeFocusNode.dispose();
    _occupationFocusNode.dispose();
    _homephoneFocusNode.dispose();
    _emergencynameFocusNode.dispose();
    _emergencyphoneFocusNode.dispose();
    _disabilityFocusNode.dispose();
    _otherFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fullnameFocusNode.requestFocus();
    _phonecontroller.text = widget.phonenumber??"";
  }

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.sizeOf(context).width;
    return GetBuilder<AddMemberController>(builder: (addmembrctrl) {
      return Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: TextFieldWidget(
                      hint: "Full Name",
                      controller: _fullnamecontroller,
                      focusnode: _fullnameFocusNode,
                      validator: () {
                        return authusecase.nameAuth(_fullnamecontroller.text);
                      },
                      nextfocusnode: _emailFocusNode,
                    )),
                SizedBox(
                  width: size < mobilescreen ? 0 : 16,
                ),
                size < mobilescreen
                    ? const SizedBox()
                    : Expanded(
                        child: TextFieldWidget(
                            hint: "Email",
                            controller: _emailcontroller,
                            focusnode: _emailFocusNode,
                            nextfocusnode: _addressFocusNode,
                            validator: () {
                              return authusecase
                                  .emailAuth(_emailcontroller.text);
                            })),
              ],
            ),
            SizedBox(
              height: size < mobilescreen ? 16 : 0,
            ),
            size < mobilescreen
                ? TextFieldWidget(
                    hint: "Email",
                    controller: _emailcontroller,
                    focusnode: _emailFocusNode,
                    nextfocusnode: _addressFocusNode,
                    validator: () {
                      return authusecase.emailAuth(_emailcontroller.text);
                    })
                : const SizedBox(),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "D.O.B",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  showDatePicker(
                                          context: context,
                                          firstDate: DateTime(1950),
                                          lastDate:
                                              DateTime(DateTime.now().year + 1))
                                      .then(
                                    (value) {
                                      addmembrctrl
                                          .addDOB(value ?? DateTime.now());
                                      _addressFocusNode.requestFocus();
                                    },
                                  );
                                },
                                icon: const Icon(Icons.date_range)),
                            Text(
                                "${addmembrctrl.dob.day}/${addmembrctrl.dob.month}/${addmembrctrl.dob.year}")
                          ],
                        ),
                      ],
                    )),
                // child: TextFieldWidget(hint: "DOB", controller: _phonecontroller,)),
                SizedBox(
                  width: size < mobilescreen ? 0 : 16,
                ),
                size < mobilescreen
                    ? const SizedBox()
                    : Expanded(
                        flex: 3,
                        child: TextFieldWidget(
                            hint: "Address",
                            controller: _addresscontroller,
                            focusnode: _addressFocusNode,
                            nextfocusnode: _pincodeFocusNode,
                            validator: () {
                              return authusecase
                                  .nameAuth(_addresscontroller.text);
                            })),
              ],
            ),
            SizedBox(
              height: size < mobilescreen ? 16 : 0,
            ),
            size < mobilescreen
                ? TextFieldWidget(
                    hint: "Address",
                    controller: _addresscontroller,
                    focusnode: _addressFocusNode,
                    nextfocusnode: _pincodeFocusNode,
                       validator: () {
                              return authusecase
                                  .nameAuth(_addresscontroller.text);
                            })
                : const SizedBox(),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: TextFieldWidget(
                  hint: "Postal Code",
                  controller: _pincodecontroller,
                  focusnode: _pincodeFocusNode,
                  nextfocusnode: _occupationFocusNode,
                )),
                SizedBox(
                  width: size < mobilescreen ? 0 : 16,
                ),
                size < mobilescreen
                    ? const SizedBox()
                    : Expanded(
                        child: TextFieldWidget(
                            hint: "Occupation",
                            controller: _occupationcontroller,
                            focusnode: _occupationFocusNode,
                            nextfocusnode: _homephoneFocusNode,
                               validator: () {
                              return authusecase
                                  .nameAuth(_occupationcontroller.text);
                            })),
              ],
            ),

            SizedBox(
              height: size < mobilescreen ? 16 : 0,
            ),
            size < mobilescreen
                ? TextFieldWidget(
                    hint: "Occupation",
                    controller: _occupationcontroller,
                    focusnode: _occupationFocusNode,
                    nextfocusnode: _homephoneFocusNode,  validator: () {
                              return authusecase
                                  .nameAuth(_occupationcontroller.text);
                            })
                : const SizedBox(),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: TextFieldWidget(
                        hint: "Home Number",
                        controller: _homephonecontroller,
                        focusnode: _homephoneFocusNode,
                        nextfocusnode: _phoneFocusNode,
                        validator: () {
                          return authusecase
                              .phoneAuth(_homephonecontroller.text);
                        })),
                SizedBox(
                  width: size < mobilescreen ? 0 : 16,
                ),
                size < mobilescreen
                    ? const SizedBox()
                    : Expanded(
                        child: TextFieldWidget(
                            hint: "Mobile Number",
                            controller: _phonecontroller,
                                enabletext: widget.phonenumber==null,
                            focusnode: _phoneFocusNode,

                            nextfocusnode: _emergencynameFocusNode,
                            validator: () {
                              return authusecase
                                  .phoneAuth(_phonecontroller.text);
                            })),
              ],
            ),

            SizedBox(
              height: size < mobilescreen ? 16 : 0,
            ),
            size < mobilescreen
                ? TextFieldWidget(
                    hint: "Mobile Number",
                    enabletext: widget.phonenumber==null,
                    controller: _phonecontroller,
                    focusnode: _occupationFocusNode,
                    nextfocusnode: _homephoneFocusNode,
                    validator: () {
                      return authusecase.phoneAuth(_phonecontroller.text);
                    })
                : const SizedBox(),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Disability",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            // Row(
            //   children: [
            //     Text("yes"),
            //     SizedBox(width: 16,),
            //     Text("No"),
            //   ],
            // ),
            Row(
              children: [
                Row(
                  children: [
                    Radio(
                        value: true,
                        groupValue: addmembrctrl.disability,
                        onChanged: (v) {
                          addmembrctrl.setdisability(v!);

                          _disabilityFocusNode.requestFocus();
                        },
                        activeColor: Colors.blue,
                        hoverColor: Colors.blue.withOpacity(0.2)),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Yes")
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    Radio(
                      value: false,
                      groupValue: addmembrctrl.disability,
                      onChanged: (v) {
                        addmembrctrl.setdisability(v!);
                      },
                      activeColor: Colors.blue,
                      hoverColor: Colors.blue.withOpacity(0.2),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("No")
                  ],
                ),
              ],
            ),
            addmembrctrl.disability
                ? TextFieldWidget(
                    hint: "Specify Disability",
                    controller: _disabilitycontroller,
                    focusnode: _disabilityFocusNode,
                    nextfocusnode: _emergencynameFocusNode,
                      validator: () {
                              return authusecase
                                  .nameAuth(_disabilitycontroller.text);
                            }
                  ).animate().fadeIn()
                : const SizedBox(),

            const SizedBox(
              height: 20,
            ),
            const Text("Emergency Contact Details"),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: TextFieldWidget(
                        hint: "Name",
                        controller: _emergencynamecontroller,
                        focusnode: _emergencynameFocusNode,
                        nextfocusnode: _emergencyphoneFocusNode,
                          validator: () {
                              return authusecase
                                  .nameAuth(_emergencynamecontroller.text);
                            })),
                SizedBox(
                  width: size < mobilescreen ? 0 : 16,
                ),
                size < mobilescreen
                    ? const SizedBox()
                    : Expanded(
                        child: TextFieldWidget(
                            hint: "Mobile Number",
                            controller: _emergencyphonecontroller,
                            focusnode: _emergencyphoneFocusNode,
                            validator: () {
                              return authusecase
                                  .phoneAuth(_emergencyphonecontroller.text);
                            })),
              ],
            ),

            SizedBox(
              height: size < mobilescreen ? 16 : 0,
            ),
            size < mobilescreen
                ? TextFieldWidget(
                    hint: "Mobile Number",
                    controller: _emergencyphonecontroller,
                    focusnode: _emergencyphoneFocusNode,
                    validator: () {
                      return authusecase
                          .phoneAuth(_emergencyphonecontroller.text);
                    })
                : const SizedBox(),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Choose Relation"),
                    const SizedBox(
                      height: 6,
                    ),
                    DropdownMenu(
                        menuStyle: MenuStyle(
                            backgroundColor: WidgetStateColor.resolveWith(
                          (states) => Theme.of(context).colorScheme.primary,
                        )),
                        onSelected: (index) {
                          addmembrctrl.setRelation(index!);
                        },
                        dropdownMenuEntries: relation.entries
                            .map((e) => DropdownMenuEntry(
                                value: e.key,
                                label: e.value,
                                style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateColor.resolveWith(
                                  (states) =>
                                      Theme.of(context).colorScheme.primary,
                                ))))
                            .toList()),
                  ],
                )),
                SizedBox(
                  width: size < mobilescreen ? 0 : 16,
                ),
                size < mobilescreen
                    ? const SizedBox()
                    : const Expanded(child: SizedBox()),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            addmembrctrl.relationship == 20
                ? TextFieldWidget(
                    hint: "Other",
                    controller: _othercontroller,
                    validator: addmembrctrl.relationship == 20 ? null :   () {
                              return authusecase
                                  .nameAuth(_othercontroller.text);
                            },
                    focusnode: _otherFocusNode,
                    
                  ).animate().fadeIn()
                : const SizedBox(),
            const SizedBox(
              height: 20,
            ),

            CardwithShadow(
                color: Theme.of(context).colorScheme.secondary,
                onpress: () {
                  if (_formkey.currentState!.validate()) {
                    addmembrctrl.addpersonaldetails(
                      name: _fullnamecontroller.text.trim(),
                      phone: _phonecontroller.text.trim(),
                      homephone: _homephonecontroller.text.trim(),
                      address: _addresscontroller.text.trim(),
                      postalcode: _pincodecontroller.text.trim(),
                      occupation: _occupationcontroller.text.trim(),
                      emergencycontact: _emergencyphonecontroller.text.trim(),
                      emergencyname: _emergencynamecontroller.text.trim(),
                    );
                    widget.pagectrl.changeaddMemberPage(1);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:
                            Text("Add required fields before proceeding")));
                  }
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Add plan",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ))
          ],
        ),
      );
    });
  }
}
