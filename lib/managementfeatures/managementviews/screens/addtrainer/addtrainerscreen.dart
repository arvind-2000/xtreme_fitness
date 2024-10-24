import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/trainerentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/dashboard.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/nodatascreen.dart/nodatascreen.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/profilescreens/traineeprofilescreen.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/scaffolds.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/textformwidget.dart';

import '../../../../config/const.dart';
import '../../../../widgets/cardborder.dart';
import '../../../../widgets/headingtext.dart';
import '../../../../widgets/normaltext.dart';
import '../../../../widgets/titletext.dart';
import '../../widgets/dialogswidget.dart';

class AddTrainerScreen extends StatefulWidget {
  const AddTrainerScreen({super.key});

  @override
  State<AddTrainerScreen> createState() => _AddTrainerScreenState();
}

class _AddTrainerScreenState extends State<AddTrainerScreen> {
  final GlobalKey<FormState> _globalkey = GlobalKey<FormState>();
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _fullnamecontroller = TextEditingController();
  final TextEditingController _limitcontroller = TextEditingController();
 
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmpasswordcontroller =
      TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();
  TimeOfDay startdate = TimeOfDay(hour: 6, minute: 0);
  TimeOfDay enddate = TimeOfDay(hour: 10, minute: 0);
  bool istrainer = false;
  void addTrainer() {
    setState(() {
      if (istrainer) {
        istrainer = false;
      } else {
        istrainer = true;
      }
    });
  }

  bool isactive = true;

  void changeIsActive() {
    setState(() {
      isactive = !isactive;
    });
  }

  String timing = 'morning';
  TrainerEntity? _user;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.sizeOf(context).width;
    return GetBuilder<GetxPageController>(builder: (pagectrl) {
      return GetBuilder<ManagementController>(builder: (managectrl) {
        return pagectrl.viewprofile && _user != null
            ? TraineeProfile(
                user: _user,
              )
            : Row(
                children: [
                  istrainer
                      ? Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const HeadingText(
                                      "Add Trainer",
                                      size: 30,
                                    ),
                                    CardBorder(
                                        onpress: addTrainer,
                                        margin:
                                            const EdgeInsets.only(right: 32),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 16),
                                        child: const Row(
                                          children: [
                                            Icon(
                                              Icons.person,
                                              size: 14,
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),
                                            Text("View Trainer")
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: ConstrainedBox(
                                    constraints:
                                        const BoxConstraints(maxWidth: 500),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Form(
                                          key: _globalkey,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                               SizedBox(
                        height: 100,
                        width: 100,
                        child: CardwithShadow(
                            padding: EdgeInsets.zero,
                            onpress: () {
                              // addmemberctrl.pickImage();
                            },
                            child: const Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Center(
                                          child:
                                              Icon(Icons.add_a_photo_outlined),
                                        ),
                                      )),
                      ),
                      const SizedBox(height: 10,),
                                              TextFieldWidget(
                                                  hint: "Full Name",
                                                  controller:
                                                      _fullnamecontroller),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              const Text("Choose Timing",style: TextStyle(color:Colors.grey,fontSize: 14),),
                                              const SizedBox(height:5),
                                            Row(children:[
                                                Expanded(
                                                  child:CardwithShadow(
                                                    onpress: (){
                                                 showTimePicker(
                                                      
                                                         builder: (context, child) {
                                   
                                    return Theme(
                                        data: ThemeData(
                                            colorScheme: ColorScheme.dark(
                                                primary: Colors.blue[200]!,secondary: Colors.grey),
                                            buttonTheme: const ButtonThemeData(
                                                buttonColor: Colors.white)),
                                        child: child!);
                                  },
                                                      context: context, initialTime: TimeOfDay(hour: 6, minute:0)).then((value) {
                                                     
                                                
                                                             if(value!=null){
                                                              setState(() {
                                                                startdate = value;
                                                              });
                                                          
                                                        }
                                                    
                                                  
                                                      },);
                                                    },
                                                    child: Text('${startdate.hourOfPeriod} ${startdate.period.name} ')),),
                                                    SizedBox(width: 6,),
                                               Expanded(
                                                  child:CardwithShadow(
                                                       onpress: (){
                                                     showTimePicker(
                                                              builder: (context, child) {
                                    return Theme(
                                        data: ThemeData(
                                            colorScheme: ColorScheme.dark(
                                                primary: Colors.blue[200]!),
                                            buttonTheme: const ButtonThemeData(
                                                buttonColor: Colors.white)),
                                        child: child!);
                                  },   
                                                      context: context, initialTime: TimeOfDay(hour: 6, minute:0)).then((value){
        
                                                
                                                             if(value!=null){
                                                              setState(() {
                                                                enddate = value;
                                                              });
                                                          
                                                        }
                                                    
                                                      });
                                                    },
                                                    child: Text("${enddate.hourOfPeriod} ${enddate.period.name}")),),
                                              ]),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                       
                                             const Text("No. of maximum persons per session",style: TextStyle(color:Colors.grey,fontSize: 14),),
                                              TextFieldWidget(
                                                showhint: false,
                                                  hint: "Trainee Limit",
                                                  controller:
                                                      _limitcontroller),
                                                      SizedBox(height: 20,),
                                              CardwithShadow(
                                                  color: Colors.green[300],
                                                  onpress: () {
                                                    if (_globalkey.currentState!
                                                        .validate()) {
                                                      TrainerEntity addtrainer =
                                                          TrainerEntity(
                                                        isActive: true,
                                                        id: Random()
                                                            .nextInt(100),
                                                        name:
                                                            _fullnamecontroller
                                                                .text,
                                                        designation: "Trainer",
                                                        timing: '${startdate}-${enddate} ',
                                                        maxlimit: _limitcontroller.text
                                                      );

                                                      showDialog(
                                                        context: context,
                                                        builder: (context) =>
                                                            PageDialog(
                                                                no: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                yes: () async {
                                                                  //        String v = await managementctrl.addplan(plan);
                                                                  // widget.onpress();
                                                                  managectrl
                                                                      .addTrainer(
                                                                          addtrainer);
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                          const SnackBar(
                                                                    content: Text(
                                                                        "Added new Trainer"),
                                                                    duration:
                                                                        Durations
                                                                            .extralong1,
                                                                  ));
                                                                  _fullnamecontroller
                                                                      .clear();
                                                                  _confirmpasswordcontroller
                                                                      .clear();
                                                                  _passwordcontroller
                                                                      .clear();
                                                                  _usernamecontroller
                                                                      .clear();
                                                                  _phonecontroller
                                                                      .clear();
                                                                  addTrainer();
                                                                  Navigator.pop(
                                                                      context);
                                                                },
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
                                                                        const TitleText(
                                                                            "Add Trainer"),
                                                                        IconButton(
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            icon:
                                                                                const Icon(Icons.close))
                                                                      ],
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    const Text(
                                                                      "Trainer Name",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14),
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Text(
                                                                      addtrainer
                                                                          .name,
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          16,
                                                                    ),
                                                                    const Text(
                                                                      "Designation",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14),
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Text(
                                                                      addtrainer
                                                                          .designation
                                                                          .toString(),
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          16,
                                                                    ),
                                                                    const Text(
                                                                      "Timing",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14),
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Text(
                                                                      addtrainer
                                                                          .timing,
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Expanded(
                                                                            child: CardwithShadow(
                                                                                color: Theme.of(context).colorScheme.error.withOpacity(0.6),
                                                                                margin: const EdgeInsets.all(16),
                                                                                child: const Text(
                                                                                  "Check Trainer details before Adding?\nPress OK to confirm",
                                                                                  textAlign: TextAlign.center,
                                                                                )))
                                                                      ],
                                                                    )
                                                                  ],
                                                                )),
                                                      );
                                                    }
                                                  },
                                                  child: const Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      NavTiles(
                                                        icon: Icons.add,
                                                        title: "Add Trainer",
                                                      ),
                                                    ],
                                                  ))
                                            ],
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              )
                            ],
                          ),
                        )
                      : Expanded(
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const HeadingText(
                                    "Trainer List",
                                    size: 30,
                                  ),
                                  CardBorder(
                                      onpress: addTrainer,
                                      margin: const EdgeInsets.only(right: 32),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 16),
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.add,
                                            size: 14,
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Text("Add Trainer")
                                        ],
                                      ))
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            managectrl.authctrl.ismember ||
                                    managectrl.getallstaff.isEmpty
                                ? const SizedBox()
                                : Row(
                                    children: [
                                      Cardonly(
                                          onpress: changeIsActive,
                                          child: NormalText(
                                            text: "Active",
                                            color: isactive
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .secondary
                                                : null,
                                          )),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Cardonly(
                                          onpress: changeIsActive,
                                          child: NormalText(
                                            text: "Disable",
                                            color: !isactive
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .secondary
                                                : null,
                                          )),
                                    ],
                                  ),
                            managectrl.getalltrainer.isEmpty
                                ? const Expanded(
                                    child: NodataScreen(
                                        title: "No Trainers",
                                        desc: "No trainers to show"),
                                  )
                                : Expanded(
                                    child: GridView(
                                        shrinkWrap: true,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: size < 500
                                                    ? 1
                                                    : size < mobilescreen
                                                        ? 2
                                                        : size > mobilescreen &&
                                                                size < 1200
                                                            ? 3
                                                            : 4,
                                                mainAxisSpacing: 10,
                                                mainAxisExtent: 350
                                                // childAspectRatio: size < 500
                                                //     ? 1
                                                //     : size > 1500
                                                //         ? 3 / 3.3
                                                //         : 3 / 4.2,
                                                ),
                                        children: managectrl.getalltrainer
                                            .where(
                                                (e) => e.isActive == isactive)
                                            .map((e) => CardwithShadow(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8,
                                                        horizontal: 16),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          CardwithShadow(
                                                              onpress: () {
                                                                _fullnamecontroller
                                                                        .text =
                                                                    e.name;
                                                                setState(() {
                                                                  timing =
                                                                      e.timing;
                                                                });
                                                                Get.dialog(
                                                                    Dialog(
                                                                  backgroundColor: Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .primary,
                                                                  child:
                                                                      CardwithShadow(
                                                                    color: Colors
                                                                            .grey[
                                                                        900],
                                                                    margin:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    child:
                                                                        AddEditTrainer(
                                                                      trainer:
                                                                          e,
                                                                    ),
                                                                  ),
                                                                ));
                                                              },
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8),
                                                              child: const Icon(
                                                                Icons.edit,
                                                                color: Colors
                                                                    .white,
                                                                size: 12,
                                                              )),
                                                          const SizedBox(
                                                            width: 6,
                                                          ),
                                                        ]),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        CircleAvatar(
                                                          backgroundColor:
                                                              Colors.grey[100],
                                                          child: const Icon(
                                                            Icons.person,
                                                            size: 30,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        TitleText(
                                                          e.name.toString(),
                                                          size: size <
                                                                  mobilescreen
                                                              ? 18
                                                              : null,
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              e.designation,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                          .grey[
                                                                      500]),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 6,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text("Timing : ",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                            .grey[
                                                                        500])),
                                                            Text(e.timing,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                            .grey[
                                                                        500])),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 16,
                                                        ),
                                                        CardBorder(
                                                            onpress: () {
                                                              pagectrl
                                                                  .changeviewprofile(
                                                                      true);
                                                              _user = e;
                                                            },
                                                            color: const Color
                                                                .fromARGB(255,
                                                                175, 210, 238),
                                                            child: const Text(
                                                                "View"))
                                                      ],
                                                    ),
                                                  ],
                                                )))
                                            .toList()),
                                  )
                          ],
                        ))
                ],
              );
      });
    });
  }
}

class AddEditTrainer extends StatefulWidget {
  const AddEditTrainer({
    super.key,
    required this.trainer,
  });

  final TrainerEntity trainer;

  @override
  State<AddEditTrainer> createState() => _AddEditTrainerState();
}

class _AddEditTrainerState extends State<AddEditTrainer> {
  String timing = "morning";
  bool _isactive = false;
  final GlobalKey<FormState> _formkey = GlobalKey();
  final TextEditingController fullnamecontroller = TextEditingController();
  final TextEditingController _limitcontroller = TextEditingController();
  TimeOfDay startdate = TimeOfDay(hour: 6, minute: 0);
  TimeOfDay enddate = TimeOfDay(hour: 10, minute: 0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int startdatess = int.tryParse(widget.trainer.timing.split('-')[0])??0;
    int enddates = int.tryParse(widget.trainer.timing.split('-')[1])??0;
    startdate = TimeOfDay(hour: startdatess, minute: 0);
    enddate = TimeOfDay(hour: enddates, minute: 0);
    _isactive = widget.trainer.isActive;
    fullnamecontroller.text = widget.trainer.name;
  }
  @override
  void dispose() {
  
    // TODO: implement dispose
    super.dispose();
    fullnamecontroller.dispose();
 _limitcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagementController>(builder: (managectrl) {
      return SizedBox(
        height: 600,
        width: 500,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeadingText(
                    "Edit Trainer",
                    size: 30,
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFieldWidget(
                                hint: "Full Name",
                                controller: fullnamecontroller),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Choose Timing"),
                                const SizedBox(
                                  height: 6,
                                ),
                                    Row(children:[
                                                Expanded(
                                                  child:CardwithShadow(
                                                    onpress: (){
                                                 showTimePicker(
                                                      
                                                         builder: (context, child) {
                                   
                                    return Theme(
                                        data: ThemeData(
                                            colorScheme: ColorScheme.dark(
                                                primary: Colors.blue[200]!,secondary: Colors.grey),
                                            buttonTheme: const ButtonThemeData(
                                                buttonColor: Colors.white)),
                                        child: child!);
                                  },
                                                      context: context, initialTime: TimeOfDay(hour: 6, minute:0)).then((value) {
                                                     
                                                
                                                             if(value!=null){
                                                              setState(() {
                                                                startdate = value;
                                                              });
                                                          
                                                        }
                                                    
                                                  
                                                      },);
                                                    },
                                                    child: Text('${startdate.hourOfPeriod} ${startdate.period.name} ')),),
                                                    SizedBox(width: 6,),
                                               Expanded(
                                                  child:CardwithShadow(
                                                       onpress: (){
                                                     showTimePicker(
                                                              builder: (context, child) {
                                    return Theme(
                                        data: ThemeData(
                                            colorScheme: ColorScheme.dark(
                                                primary: Colors.blue[200]!),
                                            buttonTheme: const ButtonThemeData(
                                                buttonColor: Colors.white)),
                                        child: child!);
                                  },   
                                                      context: context, initialTime: TimeOfDay(hour: 6, minute:0)).then((value){
        
                                                
                                                             if(value!=null){
                                                              setState(() {
                                                                enddate = value;
                                                              });
                                                          
                                                        }
                                                    
                                                      });
                                                    },
                                                    child: Text("${enddate.hourOfPeriod} ${enddate.period.name}")),),
                                              ]),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                       
                                             const Text("No. of maximum persons per session",style: TextStyle(color:Colors.grey,fontSize: 14),),
                                              TextFieldWidget(
                                                showhint: false,
                                                  hint: "Trainee Limit",
                                                  controller:
                                                      _limitcontroller),
                                                      SizedBox(height: 20,),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            _isactive
                                ? const Text("Trainer Active")
                                : const Text("Trainer Disabled"),
                            Switch(
                              activeColor: Colors.blue,
                              hoverColor: Colors.blue.withOpacity(0.5),
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey[300],
                              value: _isactive,
                              onChanged: (value) {
                                setState(() {
                                  _isactive = value;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        )),
                  ),
                ),
              ),
              CardwithShadow(
                  color: Colors.green[300],
                  onpress: () {
                    if (_formkey.currentState!.validate()) {
                      Navigator.pop(context);

                      TrainerEntity trainerss = TrainerEntity(
                          id: widget.trainer.id,
                          name: widget.trainer.name,
                          designation: widget.trainer.designation,
                          timing: timing,
                          maxlimit: widget.trainer.maxlimit,
                          isActive: _isactive);
                      showDialog(
                        context: context,
                        builder: (context) => PageDialog(
                            no: () {
                              Navigator.pop(context);
                            },
                            yes: () async {
                              String v =
                                  await managectrl.edittrainer(trainerss);
                              CustomSnackbar( v);

                              fullnamecontroller.clear();

                              Navigator.pop(context);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const TitleText("Edit Trainer"),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(Icons.close))
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                 SizedBox(
                        height: 100,
                        width: 100,
                        child: CardwithShadow(
                            padding: EdgeInsets.zero,
                            onpress: () {
                              // addmemberctrl.pickImage();
                            },
                            child:  const Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Center(
                                          child:
                                              Icon(Icons.add_a_photo_outlined),
                                        ),
                                      )),
                      ),
                                const Text(
                                  "Trainer Name",
                                  style: TextStyle(fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.trainer.name,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                const Text(
                                  "Designation",
                                  style: TextStyle(fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.trainer.designation.toString(),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                const Text(
                                  "Timing",
                                  style: TextStyle(fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.trainer.timing,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: CardwithShadow(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .error
                                                .withOpacity(0.6),
                                            margin: const EdgeInsets.all(16),
                                            child: const Text(
                                              "Check Trainer details before Editing?\nPress Yes to confirm",
                                              textAlign: TextAlign.center,
                                            )))
                                  ],
                                )
                              ],
                            )),
                      );
                    }
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NavTiles(
                        icon: Icons.add,
                        title: "Edit Trainer",
                      ),
                    ],
                  ))
              // const SizedBox(
              //   height: 40,
              // )
            ],
          ),
        ),
      );
    });
  }
}
