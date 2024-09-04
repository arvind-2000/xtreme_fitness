import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/user.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

class TraineeProfile extends StatelessWidget {
  const TraineeProfile({super.key, this.user});
  final User? user;
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.sizeOf(context).width;
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
                      pagectrl.changeviewprofile();
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
                : Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                            width: 300,
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
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.edit,
                                              size: 16,
                                            ))
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
                                          "Phone : ",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          user!.phone,
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
                                          user!.roleid.rolename,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Row(
                                      children: [
                                        Text(
                                          "Address : ",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Shfjhfjfh",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Row(
                                      children: [
                                        Text(
                                          "Email : ",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "adudada@gmail.com",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(
                                      height: 16,
                                    ),
                                    CardwithShadow(
                                        padding: const EdgeInsets.all(10),
                                        color: Colors.blue[300],
                                        child: const Center(
                                          child: Text("Change Password"),
                                        ))
                                  ],
                                ))),
                        Expanded(
                            child: CardwithShadow(
                                color: Colors.transparent,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const HeadingText("No. of Trainees (5)"),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Expanded(
                                      child: GridView.builder(
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
                                            childAspectRatio:
                                                size < 500 ? 1 : 4.5 / 5.2,
                                          ),
                                          shrinkWrap: true,
                                          itemCount: 5,
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
                                                    const Row(
                                                      children: [
                                                        Text("Name : "),
                                                        Text(
                                                          "Rahuls",
                                                          style: TextStyle(
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
                                                    const Row(
                                                      children: [
                                                        Text("Phone : "),
                                                        Text("467567268"),
                                                      ],
                                                    ),

                                                    const SizedBox(
                                                      height: 16,
                                                    ),
                                                    //time schedule
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          CardwithShadow(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .secondary,
                                                              child:
                                                                  const FittedBox(
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .alarm,
                                                                          size:
                                                                              14,
                                                                          color:
                                                                              Colors.grey,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              6,
                                                                        ),
                                                                        Text(
                                                                          "Schedule Time",
                                                                          style:
                                                                              TextStyle(color: Colors.white),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Text(
                                                                      "5 pm - 8pm",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              Colors.white),
                                                                    )
                                                                  ],
                                                                ),
                                                              )),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ));
                                          }),
                                    )
                                  ],
                                ))),
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
}
