import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:xtreme_fitness/authentifeatures/widgets/textformwidget.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/cardborder.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';

import '../../../widgets/headingtext.dart';

class RenewalScreen extends StatefulWidget {
  const RenewalScreen({super.key});

  @override
  State<RenewalScreen> createState() => _RenewalScreenState();
}

class _RenewalScreenState extends State<RenewalScreen> {
  final TextEditingController _searchcontroller = TextEditingController();

  @override
  void dispose() {
      _searchcontroller.dispose();
    super.dispose();

  }
  List<String> d = ["All Members","Personal","General"];
  List<String> renewlist = ["Renewal","Edit","View"];
  int pos = 0;
  int renewalpos  = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
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
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    
                    children: [
                      // const Text("All Members",style: TextStyle(fontSize: 20,),),

                        SizedBox(
                              height: 40,
                              child: CardBorder(
                                margin: EdgeInsets.zero,
                                padding: const EdgeInsets.only(left: 16,right: 8),
                                child: DropdownButton(
                                  underline:const SizedBox(),
                                  value: pos,
                                  items:d.asMap().entries.map((e) => DropdownMenuItem(value: e.key,child: Text(e.value),)).toList(), onChanged:(value) {
                                  setState(() {
          
                                     pos = value!;  
          
                                  });
                                },),
                              )
                            ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: TextFieldWidget(
                          hint: "Search by id, name or phone", controller:_searchcontroller,validator: (){},icon: const Icon(Icons.search)),
                      ),
                      const SizedBox(width: 10,),
                          
                      
                      const Expanded(child: Row(
                          children: [
                    
                          ],
          
                      )),
                        // Cardonly(
                        //   onpress: (){},
                        //   color: Theme.of(context).colorScheme.secondary,child: Text("Search",style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),),)
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(child: Text("Name",style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)),
                      const Expanded(child: Text("phone",style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold))),
                      const Expanded(child: Text("Start",style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold))),
                     MediaQuery.sizeOf(context).width<=mobilescreen?const SizedBox(): const Expanded(child: Text("End",style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold))),
                       MediaQuery.sizeOf(context).width<=mobilescreen?const SizedBox():const Expanded(child: Text("Membership",style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold))),
                      const Expanded(child: Text("Actions",style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold))),
                    ],
                  ),
                ),
                Divider(
                  color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                  height: 1,
                ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.black38,
                                    ),
                                    SizedBox(width: 10,),
                                    Text("Tom",style:TextStyle(fontSize: 14),),
                                  ],
                                ),
                                   MediaQuery.sizeOf(context).width<=mobilescreen?Cardonly(
                                      margin: EdgeInsets.only(top: 4),
                                      padding: EdgeInsets.symmetric(vertical: 4,horizontal: 16),
                                      color: Colors.green[200],
                                      child: Text("Personal",style: TextStyle(fontSize: 10),)):SizedBox()
                              ],
                            )),
                            Expanded(child: Text("0986535415",style:TextStyle(fontSize: 14))),
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("4/5/2024",style:TextStyle(fontSize: 14)),
                                const SizedBox(height: 5,),
                                MediaQuery.sizeOf(context).width<=mobilescreen?const Text("4/5/2024",style:TextStyle(fontSize: 14)):const SizedBox()
                              ],
                            )),
                            MediaQuery.sizeOf(context).width<=mobilescreen?const SizedBox():const Expanded(child: Text("4/5/2024",style:TextStyle(fontSize: 14))),
                           MediaQuery.sizeOf(context).width<=mobilescreen?const SizedBox():const Expanded(child: Text("Personal",style:TextStyle(fontSize: 14))),
                            Expanded(child:MediaQuery.sizeOf(context).width<=mobilescreen?SizedBox(
                              height: 30,
                              child: CardBorder(
                                  margin: EdgeInsets.zero,
                                  padding: const EdgeInsets.only(left: 16,right: 8),
                                  child: DropdownButton(
                                    underline:const SizedBox(),
                                    value: renewalpos,
                                    items:renewlist.asMap().entries.map((e) => DropdownMenuItem(value: e.key,child: Text(e.value,style: TextStyle(fontSize: 10),),)).toList(), onChanged:(value) {
                                    setState(() {       
                                       renewalpos = value!;  
                              
                                    });
                                  },),
                                ),
                            ):Row(
                              children: [
                                CardBorder(
                                  margin: EdgeInsets.zero,
                                  onpress: (){},
                                  child: const Text("Renewal",style:TextStyle(fontSize: 14))),
                                  const SizedBox(width: 5,),
                                  IconButton(onPressed: (){}, icon: const Icon(Icons.edit,size: 14,))
                              ],
                            )),
                                              
                                                  ],),
                          ),
                                                   Divider(
                    color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.2),
                    height: 1,
                                          ),
                        ],
                      ),itemCount: 15,),
                  )
              ],
            ),
          ),
        ),
                const SizedBox(height: 40,)
      ],
    );
  }
}