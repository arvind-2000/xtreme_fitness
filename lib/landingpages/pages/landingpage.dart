import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';
import 'package:xtreme_fitness/landingpages/pages/footerpage.dart';
import 'package:xtreme_fitness/widgets/card.dart';

import '../../widgets/cardborder.dart';
import '../../widgets/cardswithshadow.dart';
import '../../widgets/gridviewwidget.dart';
import '../../widgets/headingtext.dart';
import 'responsivepages.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<GetxLandingcontroller>(
      builder: (managectrl) {
        return Stack(
          children: [
            Column(
              children: [
                Stack(
                  
                  children: [
                        Positioned(child: SizedBox(
                            height: 1000,
                            width: double.maxFinite,
                          child: Image.asset('assets/backg.jpg',fit: BoxFit.cover,))),
                    ResponsivePages(
                      // screenheight: MediaQuery.sizeOf(context).height,
                      screenheight: 1000,
                      child1: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Center(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           const SizedBox(height: 60,),
                           HeadingText("Your Fitness, Your Way",size:MediaQuery.sizeOf(context).width<mobilescreen?60:80,color: Colors.white,isbold: true,),
                           const SizedBox(height: 60,),
                           RichText(
                            text:  const TextSpan(children: [
                                    TextSpan(text: "Revolutionize Your Workout Experience with Personalised Training\n",style: TextStyle(fontSize: 16,color: Colors.white54),),
                                      // TextSpan(text:"Xtreme Fitness",style:TextStyle(fontSize: MediaQuery.sizeOf(context).width<mobilescreen?30:40,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.secondary,fontFamily: "Montserrat") ,),
                            ]),
                           ),
                             const SizedBox(height: 20,),
                             CardwithShadow(
                              onpress: (){
                                  Get.toNamed("/pricing");

                              },
                              padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 32),
                               color: Theme.of(context).colorScheme.secondary,
                               child:const Text("Get Started",style: TextStyle(color: Colors.white),) ),
                               const SizedBox(height: 60,),

                              SizedBox(
                              
                                child: CardwithShadow(
                                   margin: EdgeInsets.zero,
                                  padding: const EdgeInsets.all(16),
                                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                                  child: Column(
                              
                               
                                crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                
                                    const SizedBox(height: 20,),
                                    const Row(
                                    //  mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                       Icon(Icons.alarm,size: 16,color: Colors.white60,),
                                       SizedBox(width: 6,),
                                        HeadingText("Timing",size: 24,color: Colors.white60,),
                                      ],
                                    ),
                                    const SizedBox(height: 20,),
                                  MediaQuery.sizeOf(context).width<=mobilescreen?  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            HeadingText("Morning",color: Colors.white60,size: 16,),
                                            Text("5:00 AM - 11:00 AM",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                          ],
                                        ),
                                        const SizedBox(width: 10,),
                                        Container(
                                          margin: const EdgeInsets.symmetric(vertical: 8),
                                          width:50,height: 1, color: Colors.white54,),
                                         const SizedBox(width: 10,),
                                        const Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            HeadingText("Evening",color: Colors.white60,size: 16,),
                                            Text("3:00 PM - 8:00 PM",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                          ],
                                        ),
                                      ],
                                    ) :Row(
                                      children: [
                                        const Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            HeadingText("Morning",color: Colors.white60,size: 16,),
                                            Text("5:00 AM - 11:00 AM",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                          ],
                                        ),
                                        const SizedBox(width: 10,),
                                        Column(
                                         mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(width:1,height: 50, color: Colors.white54,),
                                          ],
                                        ),
                                         const SizedBox(width: 10,),
                                        const Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            HeadingText("Evening",color: Colors.white60,size: 16,),
                                            Text("3:00 PM - 8:00 PM",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20,)
                                  ],
                                )),
                              ),
                         ],
                       ),
                     ),
                              ),
                              child2: const SizedBox()
                              
                              ),
                  ],
                ),

                          //service pages
                const SizedBox(height: 40,),
                ResponsivePages(
                  child1: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HeadingText("The Best Programs We\nOffers For You"),
                 
                        const SizedBox(height: 50,),

                        
                        GridViewWidget(
                          
                          size: MediaQuery.sizeOf(context).width, children:managectrl.getallservices.asMap().entries.map((e) => CardwithShadow(
                  onpress: (){},
                  margin:  EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    HeadingText("${e.key<10?"0":""}${e.key+1}",size: 40,),
                    const SizedBox(height: 25,),
                     HeadingText(e.value.name,size: 24,),
                     const SizedBox(height: 20,),
               
                     Expanded(
                       child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           const Text("Xtremer"),
                          RichText(text: TextSpan(children: [  
                            TextSpan(text:"Rs ${e.value.memberPrice}",style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
                            TextSpan(text:"/ ${e.value.durationInMinutes} mins",style: const TextStyle(fontSize: 14,color: Colors.white38),),
                            
                            ],)),
                           const SizedBox(height: 10,),
                      const Text("Non Xtremer"),
                            RichText(text: TextSpan(children: [  
                            TextSpan(text:"Rs ${e.value.nonMemberPrice}",style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
                            TextSpan(text:"/ ${e.value.durationInMinutes} mins",style: const TextStyle(fontSize: 14,color: Colors.white38),),
                            
                            ],)),
                         ],
                       ),
                     ),
               const SizedBox(height: 16,),
                        const CardBorder(
                          margin: EdgeInsets.zero,
                          color: Colors.grey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          Text("Learn More",style: TextStyle(color: Colors.white),),
                          SizedBox(width: 10,),
                          Icon(Icons.arrow_forward,color: Colors.white,size: 14,),
               
                        ],))
                    ],
                  )),).toList(), ),
    const SizedBox(height: 20,),   
                    SizedBox(
                      width: double.maxFinite,
                      child: Cardonly(
                           margin: const EdgeInsets.symmetric(vertical: 16,horizontal: 0),
                        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                         color: Colors.orange,
                        child:MediaQuery.sizeOf(context).width<mobilescreen?Column(
                                        
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(text: 
                                                    const TextSpan(children: [
                                // const TextSpan(text: "Exclusive Offer\n\n",style: TextStyle(color: Colors.white,fontSize: 24)),
                                TextSpan(text: "Exclusive Offer: Free BMI Service for First-time members only.",style: TextStyle(fontSize: 16,color: Colors.black87,fontWeight: FontWeight.bold)),
                                                    
                                                    ])),
                                const SizedBox(height: 16,),
                                                    Cardonly(
                                                        onpress: (){
                                                          Get.toNamed("/signup");
                                                        },
                                                        margin: EdgeInsets.zero,
                                                      color: Theme.of(context).colorScheme.secondary,
                                                      child: const Text("Claim Now",style: TextStyle(color: Colors.white),))
                          ],
                        ) : Row(
                                        
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(text: 
                                                    const TextSpan(children: [
                                // const TextSpan(text: "Exclusive Offer\n\n",style: TextStyle(color: Colors.white,fontSize: 24)),
                                TextSpan(text: "Exclusive Offer: Free BMI Service for First-time members only.",style: TextStyle(fontSize: 16,color: Colors.black87,fontWeight: FontWeight.bold)),
                                                    
                                                    ])),
                      
                                                    Cardonly(
                                                          onpress: (){
                                                          Get.toNamed("/signup");
                                                        },
                                                        margin: EdgeInsets.zero,
                                                      color: Theme.of(context).colorScheme.secondary,
                                                      child: const Text("Claim Now",style: TextStyle(color: Colors.white),))
                          ],
                        )
                        
                        ),
                    ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 60,),
        //plan pages
          
                ResponsivePages(
                  colors: Colors.black54,
                  child1: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         const SizedBox(height: 40,),
                        const HeadingText("Choose The Best Plan",size: 40,isbold: true,),
                        const SizedBox(height: 30,),
                          const Text("Choose a plan that's right for you. Flexible, Simple & no hidden prices",style: TextStyle(color: Colors.white60),),
                         const SizedBox(height: 60,),
                        SizedBox(
                          width: double.maxFinite,
                          height: 500,
                          child: Center(
                            child: ListView(
                                                     
                                shrinkWrap: true,
                            
                                                    // controller: PageController(viewportFraction: 0.3,initialPage: 1),
                                                    
                            scrollDirection: Axis.horizontal,
                                                    
                                                       
                                                   children:managectrl.getallplans.asMap().entries.map((e) =>  SizedBox(
                                                 width: 400,
                             child: CardwithShadow(
                              margin: const EdgeInsets.symmetric(vertical: 32,horizontal: 16),
                              padding: const EdgeInsets.symmetric(vertical: 16,horizontal:32),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                 HeadingText(e.value.category,size: 16,color: Colors.white60,),
                                 const SizedBox(height: 20,),
                                                  
                                 Expanded(
                                   child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                 
                                     children: [
                                       
                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                         children: [
                                           Text("Rs ${e.value.price - (e.value.price * (e.value.discountPercentage/100))}",style: const TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                                           Text("/${e.value.durationInMonths} months")
                                         ],
                                       ),
                                       const SizedBox(height: 30,),
                                        const Text("Price",style: TextStyle(color: Colors.white60,),),
                                                      HeadingText("Rs ${e.value.price - (e.value.price * (e.value.discountPercentage/100))}"  ,size: 24,),
                                                          const SizedBox(height: 10,),
                                                   e.value.discountPercentage<=0? const SizedBox():const Text("Discount",style: TextStyle(color: Colors.white60,),),
                                       e.value.discountPercentage<=0? const SizedBox():Text("${e.value.discountPercentage}%",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                                       const SizedBox(height: 10,),
                                              e.value.discountPercentage<=0? const SizedBox():      const Text("Actual Price",style: TextStyle(color: Colors.white60,),),
                                              e.value.discountPercentage<=0? const SizedBox():         HeadingText("Rs ${e.value.price}"  ,size: 24,),
                                     ],
                                   ),
                                 ),
                                                  
                                    const CardBorder(
                                      margin: EdgeInsets.zero,
                                      color: Colors.grey,
                                      child: Text("Choose Plan",style: TextStyle(color: Colors.white),))
                                ],
                              )),
                                                   ),).toList(), 
                                                   ),
                          ),
                        ),
    const SizedBox(height: 60,),   
       
                      ],
                    ),
                  ),
                ),
          //Footer
          const ContactFooter()
        
              ],
            ),
          ],
        );
      }
    );
  }
}


class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}