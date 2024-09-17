import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authentifeatures/models/usecasesimpl.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/config/manageconfig.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/xtremer.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';

import '../../../../widgets/cardborder.dart';
import '../../../../widgets/cardswithshadow.dart';
import '../../../../widgets/textformwidget.dart';
import '../../controllers/pagecontroller.dart';

class PersonaldetailsField extends StatefulWidget {
  const PersonaldetailsField({
    super.key,
    required this.pagectrl,
    this.phonenumber,
    required this.callback,
  });
  final String? phonenumber;
  final GetxPageController pagectrl;
  final VoidCallback callback;
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

  // final TextEditingController _fullnamecontroller = TextEditingController(text: "dfbdf");

  // final TextEditingController _emailcontroller = TextEditingController(text: 'fh@gm.com');

  // final TextEditingController _phonecontroller = TextEditingController(text: '90172637464');

  // final TextEditingController _addresscontroller = TextEditingController(text: 'fghdgfh');

  // final TextEditingController _pincodecontroller = TextEditingController(text: '786544');

  // final TextEditingController _occupationcontroller = TextEditingController(text:'fgdhfghd');

  // final TextEditingController _homephonecontroller = TextEditingController(text: '8888888889');

  // final TextEditingController _emergencynamecontroller =
  //     TextEditingController(text:'fghsg');

  // final TextEditingController _emergencyphonecontroller =
  //     TextEditingController(text: '17171717171');

  final TextEditingController _disabilitycontroller = TextEditingController();

  final TextEditingController _othercontroller = TextEditingController();
  Xtremer? xtremers;
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
    xtremers = Get.find<AddMemberController>().xtremer;
    _phonecontroller.text = widget.phonenumber ?? "";
    if (xtremers != null && widget.phonenumber == null) {
      _fullnamecontroller.text = xtremers!.firstName ?? "";
      _emailcontroller.text = xtremers!.email ?? "";
      _phonecontroller.text = xtremers!.mobileNumber ?? "";
      _homephonecontroller.text = xtremers!.homeNumber ?? "";
      _occupationcontroller.text = xtremers!.occupation ?? "";
      _pincodecontroller.text = xtremers!.postcode ?? "";
      _addresscontroller.text = xtremers!.address ?? "";
      _emergencynamecontroller.text = xtremers!.contactName ?? "";
      _emergencyphonecontroller.text = xtremers!.contactNumber ?? "";
      _disabilitycontroller.text = xtremers!.disability ?? "";
      _othercontroller.text = xtremers!.relationship ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.sizeOf(context).width;
    return GetBuilder<AddMemberController>(builder: (addmembrctrl) {
      return SingleChildScrollView(
        child: Form(
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
                          return authusecase.nameAuth(
                              _fullnamecontroller.text, "full Name");
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
                                if (_emailcontroller.text.isNotEmpty) {
                                  return authusecase.emailAuth(
                                      _emailcontroller.text, "Email");
                                }
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
                        return authusecase.emailAuth(
                            _emailcontroller.text, "Email");
                      })
                  : const SizedBox(),
              const SizedBox(
                height: 16,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Choose DOB",
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.5),
                            fontSize: 12),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      CardBorder(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(0.6),
                        onpress: () {
                          showDatePicker(
                                  builder: (context, child) {
                                    return Theme(
                                        data: ThemeData(
                                            colorScheme: ColorScheme.dark(
                                                primary: Colors.blue[200]!),
                                            buttonTheme: const ButtonThemeData(
                                                buttonColor: Colors.white)),
                                        child: child!);
                                  },
                                  context: context,
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime(DateTime.now().year + 1))
                              .then(
                            (value) {
                              addmembrctrl.addDOB(value ?? DateTime.now());
                              _addressFocusNode.requestFocus();
                            },
                          );
                        },
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        margin: EdgeInsets.zero,
                        child: Row(
                          children: [
                            const Text(
                              "D.O.B:",
                              style: TextStyle(fontSize: 14),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.date_range,
                                  size: 14,
                                ),
                                addmembrctrl.dob == null
                                    ? const SizedBox()
                                    : Text(
                                        "${addmembrctrl.dob!.day}/${addmembrctrl.dob!.month}/${addmembrctrl.dob!.year}",
                                        style: const TextStyle(fontSize: 14),
                                      )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                                return authusecase.nameAuth(
                                    _addresscontroller.text, "Address");
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
                        return authusecase.nameAuth(
                            _addresscontroller.text, "Address");
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
                    counter: 6,
                    validator: () {
                      return authusecase.pincodeauth(
                          _pincodecontroller.text, "Pin Code");
                    },
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
                                return authusecase.nameAuth(
                                    _occupationcontroller.text, "Occupation");
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
                      nextfocusnode: _homephoneFocusNode,
                      validator: () {
                        return authusecase.nameAuth(
                            _occupationcontroller.text, "Occupation");
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
                          counter: 10,
                          controller: _homephonecontroller,
                          focusnode: _homephoneFocusNode,
                          nextfocusnode: _phoneFocusNode,
                          validator: () {
                            return authusecase.phoneAuth(
                                _homephonecontroller.text, "Home NUmber");
                          })),
                  SizedBox(
                    width: size < mobilescreen ? 0 : 16,
                  ),
                  size < mobilescreen
                      ? const SizedBox()
                      : Expanded(
                          child: TextFieldWidget(
                              hint: "Mobile Number",
                              counter: 10,
                              controller: _phonecontroller,
                              enabletext: widget.phonenumber == null,
                              focusnode: _phoneFocusNode,
                              nextfocusnode: _emergencynameFocusNode,
                              validator: () {
                                return authusecase.phoneAuth(
                                    _phonecontroller.text, "Moile number");
                              })),
                ],
              ),

              SizedBox(
                height: size < mobilescreen ? 16 : 0,
              ),
              size < mobilescreen
                  ? TextFieldWidget(
                      hint: "Mobile Number",
                      counter: 10,
                      enabletext: widget.phonenumber == null,
                      controller: _phonecontroller,
                      focusnode: _occupationFocusNode,
                      nextfocusnode: _homephoneFocusNode,
                      validator: () {
                        return authusecase.phoneAuth(
                            _phonecontroller.text, "Mobile Number");
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
                        return authusecase.nameAuth(
                            _disabilitycontroller.text, "Disabilty");
                      }).animate().fadeIn()
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
                            return authusecase.nameAuth(
                                _emergencynamecontroller.text,
                                "Emergency Name");
                          })),
                  SizedBox(
                    width: size < mobilescreen ? 0 : 16,
                  ),
                  size < mobilescreen
                      ? const SizedBox()
                      : Expanded(
                          child: TextFieldWidget(
                              hint: "Mobile Number",
                              counter: 10,
                              controller: _emergencyphonecontroller,
                              focusnode: _emergencyphoneFocusNode,
                              validator: () {
                                return authusecase.phoneAuth(
                                    _emergencyphonecontroller.text,
                                    "Mobile Number");
                              })),
                ],
              ),

              SizedBox(
                height: size < mobilescreen ? 16 : 0,
              ),
              size < mobilescreen
                  ? TextFieldWidget(
                      hint: "Mobile Number",
                      counter: 10,
                      controller: _emergencyphonecontroller,
                      focusnode: _emergencyphoneFocusNode,
                      validator: () {
                        return authusecase.phoneAuth(
                            _emergencyphonecontroller.text, "Mobile Number");
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
                          hintText: relation[addmembrctrl.relationship] ?? "",
                          menuStyle: MenuStyle(
                              backgroundColor: WidgetStateColor.resolveWith(
                            (states) => Theme.of(context).colorScheme.primary,
                          )),
                          onSelected: (index) {
                            addmembrctrl.setRelation(index!);
                            print(addmembrctrl.relationship);
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
                      validator: addmembrctrl.relationship == 20
                          ? null
                          : () {
                              return authusecase.nameAuth(
                                  _othercontroller.text, "Other");
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
                    if (_formkey.currentState!.validate() &&
                        addmembrctrl.dob != null) {
                      print(
                          "${_fullnamecontroller.text.trim()} ${_phonecontroller.text.trim()}  ${_homephonecontroller.text.trim()} ${_emailcontroller.text.trim()} ${_addresscontroller.text.trim()} ${_pincodecontroller.text.trim()} ${_occupationcontroller.text.trim()} ${_emergencyphonecontroller.text.trim()} ${_emergencynamecontroller.text.trim()} ");
                      addmembrctrl.addpersonaldetails(
                        // address: "f",
                        // emergencycontact: "sds",
                        // emergencyname: "",
                        // homephone: "",
                        // name: "fg",
                        // occupation: "",
                        // phone: "",
                        // postalcode: "",
                        // email: "",

                        name: _fullnamecontroller.text.trim(),
                        phone: _phonecontroller.text.trim(),
                        homephone: _homephonecontroller.text.trim(),
                        email: _emailcontroller.text.trim(),
                        address: _addresscontroller.text.trim(),
                        postalcode: _pincodecontroller.text.trim(),
                        occupation: _occupationcontroller.text.trim(),
                        emergencycontact: _emergencyphonecontroller.text.trim(),
                        emergencyname: _emergencynamecontroller.text.trim(),
                      );
                      widget.callback();
                    } else {
                      if (addmembrctrl.dob == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("DOB field cannot be empty.")));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Add required fields before proceeding")));
                      }
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
        ),
      );
    });
  }
}
