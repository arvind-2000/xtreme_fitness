import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/trainerentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

import '../../../../widgets/titletext.dart';



class TraineeProfile extends StatelessWidget {
  const TraineeProfile({super.key, this.user});
  final TrainerEntity? user;
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.sizeOf(context).width;
    return GetBuilder<ManagementController>(
      
      builder: (managectrl) {
        if(user!=null){

        managectrl.getAllTraineess(user!.id!);
        }


        return GetBuilder<GetxPageController>(builder: (pagectrl) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                //title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const HeadingText(
                      "Profile",
                      size: 30,
                    ),
                    IconButton(
                        onPressed: () {
                          pagectrl.changeviewprofile(false);
                        },
                        icon: const Icon(Icons.close))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                //body for desktop
                user == null
                    ? const Center(
                        child: Text("No User"),
                      )
                    :size<=mobilescreen?Expanded(child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TrainerProfile(user: user),
                          SizedBox(height: 10,),
                              TrainerList(),
                        ],
                      ),
                    )) :Expanded(
                        child: Row(
                          children: [
                            TrainerProfile(user: user),
                            TrainerList(),
                          ],
                        ),
                      ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          );
        });
      }
    );
  }
}

class TrainerList extends StatelessWidget {
  const TrainerList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagementController>(
      builder: (managectrl) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadingText("Trainees List"),
            const SizedBox(
              height: 20,
            ),
            managectrl.getallTrainee.isEmpty?Column(children:[TitleText("No Trainees to show")])  : Expanded(
              flex:MediaQuery.sizeOf(context).width<=mobilescreen?0:1,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth:500),
                child: ListView.builder(
                  physics: MediaQuery.sizeOf(context).width<=mobilescreen?NeverScrollableScrollPhysics():null,
                    // gridDelegate:
                    //     SliverGridDelegateWithMaxCrossAxisExtent(
                             
                    //   mainAxisSpacing: 10,
                    //   childAspectRatio:MediaQuery.sizeOf(context).width<=mobilescreen?4/3:4/3, maxCrossAxisExtent:MediaQuery.sizeOf(context).width<=mobilescreen?500:300,
                    // ),
                    shrinkWrap: true,
                    itemCount: managectrl.getallTrainee.length,
               
                    itemBuilder: (c, i) {
                      return CardwithShadow(
                          margin:
                              const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              //name
                              Row(
                                children: [
                                  Icon(Icons.person,size:14,color:Colors.grey[400]),
                                  SizedBox(width:5),
                                  Text(
                                    managectrl.getallTrainee[i].firstName??"",
                                  
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight:
                                            FontWeight
                                                .bold),
                                  ),
                                ],
                              ),
                        
                              const SizedBox(
                                height: 16,
                              ),
                        
                              //phone
                              Row(
                                children: [
                                  Icon(Icons.phone,size:14,color:Colors.grey[400]),
                                  SizedBox(width:5),
                                  Text(
                                    managectrl.getallTrainee[i].mobileNumber??"",
                                  
                                  style:TextStyle(color:Colors.grey[400])),
                                ],
                              ),
                        
                              const SizedBox(
                                height: 16,
                              ),
                              //time schedule
                              // SizedBox(
                              //   width: double.maxFinite,
                              //   child: CardwithShadow(
                                  
                              //       color: Theme.of(
                              //               context)
                              //           .colorScheme
                              //           .secondary,
                              //       child:
                              //            Column(
                              //              crossAxisAlignment: CrossAxisAlignment.start,
                              //              mainAxisAlignment:
                              //                  MainAxisAlignment
                              //                      .start,
                              //              children: [
                              //                const Row(
                              //                  children: [
                              //                    Icon(
                              //                      Icons
                              //                          .alarm,
                              //                      size:
                              //                          14,
                              //                      color:
                              //                          Colors.grey,
                              //                    ),
                              //                    SizedBox(
                              //                      width:
                              //                          6,
                              //                    ),
                              //                    Text(
                              //                      "Schedule Time",
                              //                      style:
                              //                          TextStyle(color: Colors.white),
                              //                    ),
                              //                  ],
                              //                ),
                              //                const SizedBox(
                              //                  height:
                              //                      10,
                              //                ),
                              //                Text(
                              //                  managectrl.getallTrainee[i].preferTiming??"morning",
                              //                  style: const TextStyle(
                              //                      fontWeight: FontWeight
                              //                          .bold,
                              //                      color:
                              //                          Colors.white),
                              //                )
                              //              ],
                              //            )),
                              // )
                            ],
                          ));
                    }),
              ),
            )
          ],
        );
      }
    );
  }
}

class TrainerProfile extends StatelessWidget {
  const TrainerProfile({
    super.key,
    required this.user,
  });

  final TrainerEntity? user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width:MediaQuery.sizeOf(context).width<=mobilescreen?double.maxFinite:300,
        child: CardwithShadow(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: const SizedBox(
                          height: 100,
                          width: 100,
                          child: Center(
                              child: Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 35,
                          ))),
                    ),
               
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                //name details
            
                Row(
                  children: [
                    const Text(
                      "Name : ",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      user!.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
    
           
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      "Designation : ",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      user!.designation,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
            
                const SizedBox(
                  height: 20,
                ),
                 Row(
                  children: [
                    const Text(
                      "Timing : ",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      user!.timing,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
            
                const SizedBox(
                  height: 16,
                ),
              ],
            )));
  }
}
