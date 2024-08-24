import 'package:flutter/material.dart';
import 'package:xtreme_fitness/authentifeatures/widgets/textformwidget.dart';
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
                      const Text("All Members",style: TextStyle(fontSize: 20,),),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: TextFieldWidget(
                          hint: "Search by id, name or phone", controller:_searchcontroller,validator: (){},icon: const Icon(Icons.search)),
                      ),
                      const SizedBox(width: 10,),
                            SizedBox(
                              height: 40,
                              child: DropdownMenu(
                         
                              hintText: "index 1",
                                                        menuStyle: MenuStyle(backgroundColor: WidgetStateColor.resolveWith((states) => Colors.white,)),
                              onSelected: (index){
                                 
                              },  
                              dropdownMenuEntries: List.generate(10, (index) => index,).map((e)=>DropdownMenuEntry(value: e, label: "index $e",style: ButtonStyle(
                                backgroundColor: WidgetStateColor.resolveWith((states) => Colors.white,)
                              ))).toList()),
                            ),
                      
                      const Expanded(child: Row(
                          children: [
                    
                          ],

                      )),
                        Cardonly(
                          onpress: (){},
                          color: Theme.of(context).colorScheme.secondary,child: Text("Search",style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),),)
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text("Name",style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)),
                      Expanded(child: Text("phone",style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold))),
                      Expanded(child: Text("Start",style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold))),
                      Expanded(child: Text("End",style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold))),
                      Expanded(child: Text("Membership",style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold))),
                      Expanded(child: Text("Actions",style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold))),
                     
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
                            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                            Expanded(child: Text("Tom",style:TextStyle(fontSize: 14),)),
                            Expanded(child: Text("0986535415",style:TextStyle(fontSize: 14))),
                            Expanded(child: Text("4/5/2024",style:TextStyle(fontSize: 14))),
                            Expanded(child: Text("4/5/2024",style:TextStyle(fontSize: 14))),
                            Expanded(child: Text("Personal",style:TextStyle(fontSize: 14))),
                            Expanded(child: CardBorder(
                              onpress: (){},
                              child: Text("Renewal",style:TextStyle(fontSize: 14)))),
                                              
                                                  ],),
                          ),
                                                   Divider(
                    color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
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