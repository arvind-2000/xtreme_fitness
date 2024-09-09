import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/widgets/canvasimage.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/gridviewwidget.dart';
import 'package:xtreme_fitness/widgets/normaltext.dart';
import 'dart:html';

import '../../widgets/cardborder.dart';
import '../../widgets/cardswithshadow.dart';
import '../../widgets/headingtext.dart';
import '../controllers/getxcontrol.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({
    super.key,
  });

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  PageController _pageController = PageController(initialPage: 0);
  int page = 0;


  void _goToNextPage() {
         setState(() {
          if(page<4){
           page = page+1;
          }
 
    });
      _pageController.animateToPage(page, duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn);
      print(_pageController.page);

  }

  void _goToPreviousPage() {
         setState(() {
          if(page>0){
           page = page-1;
          }else{
            page = 0;
          } 
 
    });
      _pageController.animateToPage(page, duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn);
      print(_pageController.page);

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width;
    return GetBuilder<GetxLandingcontroller>(builder: (managementcontroller) {
      return Row(
        children: [
          MediaQuery.sizeOf(context).width < mobilescreen
              ? const SizedBox(width: 16,)
              : const SizedBox(
                  width: 100,
                ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
         
                Container(
                  height: 300,
                  child: const Center(
                    child: HeadingText(
                      "Gallery",
                      size: 60,
                                   
                      isbold: true,
                    ),
                  ),
                ),




                const HeadingText("Gym Spaces",size: 30,),
                const SizedBox(height: 20,),          
                //  MediaQuery.sizeOf(context).width < mobilescreen
                          GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16
                            ),
                              shrinkWrap: true,
                              itemCount: 8,
                              itemBuilder: (context, index) => CardwithShadow(
                              
                                onpress: () {
                                  Get.dialog(
                                    barrierDismissible: true,
                                    Dialog(
                                      elevation: 2,
                                      child: Stack(
                                      children: [
                                        
                                        Stack(
                                          children: [
                                            Cardonly(
                                              margin: EdgeInsets.zero,
                                              padding: EdgeInsets.zero,
                                              child: SizedBox(
                                                
                                             
                                                child: ImageWidget())),

                                                Positioned(
                                                  right: 0,
                                                  top: 0,
                                                  child: Cardonly(
                                                    padding: EdgeInsets.all(8),
                                                      color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
                                                    child: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close,size: 14,))),
                                                )
                                          ],
                                        ),
                                        // Positioned(
                                        //   right: -1,
                                        //   top: 0,
                                        //   child: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close)))
                                      ],
                                                                        ),
                                    ));
                                },
                                margin: EdgeInsets.zero,
                                  padding: EdgeInsets.zero,
                                  child: ImageWidget()),
                            )
                          // :ConstrainedBox(
                          //   constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width, maxHeight: 600),
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: Stack(
                          //             children: [
                          //               PageView.builder(
                          //                 onPageChanged: (value) => setState(() {
                          //                   page = value;
                          //                 }),
                          //                 controller: _pageController,
                          //                 itemCount: 5,
                          //                 itemBuilder: (context, index) =>
                          //                    Stack(
                          //                       children: [
                          //                         CardwithShadow(
                          //                           margin: EdgeInsets.symmetric(horizontal: 16),
                          //                             padding: EdgeInsets.zero,
                          //                             child: SizedBox(
                          //                               width: double.maxFinite,
                          //                               child: ImageWidget()
                          //                       //         child:Image.network(
                          //                       //            headers: {"Cache-Control": "no-cache"},
                          //                       //   loadingBuilder: (context, child, loadingProgress) => const Center(child: CircularProgressIndicator(),),
                          //                       //   errorBuilder: (context, error, stackTrace) =>  const Center(child: CircularProgressIndicator(),) ,
                          //                       //   "https://wallpaperaccess.com/full/2465431.jpg",
                          //                       //   fit: BoxFit.cover,
                          //                       // ),
                          //                             )),
                          //                                   Positioned(
                          //                    top: 0,
                          //                    left: 0,
                          //                    child:   Padding(
                          //                      padding: const EdgeInsets.all(32.0),
                          //                      child: HeadingText("${index<8?"0":""}${index+1}",size: 40,),
                          //                    ),),
                          //                       ],
                          //                     ),
                          //               ),
                                         
                          //               Positioned(
                          //                   left: 0,
                          //                   top: 0,
                          //                   bottom: 0,
                          //                   child: Center(
                          //                       child:page <= 0?const SizedBox() :IconButton(
                          //                     onPressed: _goToPreviousPage,
                          //                     icon: const Icon(Icons.arrow_left),
                          //                   ))),
                          //               Positioned(
                          //                   right: 0.5,
                          //                   top: 0,
                          //                   bottom: 0,
                          //                   child: Center(
                          //                       child: page>=4?const SizedBox(): IconButton(
                          //                     onPressed: _goToNextPage,
                          //                     icon: const Icon(Icons.arrow_right),
                          //                   ))),
                          //             ],
                          //           ),
                          //   ),
                          // )
              ],
            ),
          ),
          MediaQuery.sizeOf(context).width < mobilescreen
              ? const SizedBox(width: 16,)
              : const SizedBox(
                  width: 100,
                ),
        ],
      );
    });
  }
}
