import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/widgets/canvasimage.dart';
import 'package:xtreme_fitness/widgets/gridviewwidget.dart';
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
                const SizedBox(
                  height: 50,
                ),
                const HeadingText(
                  "Gallery",
                  size: 60,
               
                  isbold: true,
                ),
                const SizedBox(
                  height: 50,
                ),
                 MediaQuery.sizeOf(context).width < mobilescreen
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (context, index) => SizedBox(
                                width: double.maxFinite,
                                child: Stack(
                                                             
                                  children: [
                                  
                                 
                                    CardwithShadow(
                                      margin: const EdgeInsets.symmetric(vertical: 16),
                                        padding: EdgeInsets.zero,
                                        child: SizedBox(
                                          height: 300,
                                          width: double.maxFinite,
                                          child: Image.asset(
                                            // loadingBuilder: (context, child, loadingProgress) => Center(child: CircularProgressIndicator(color: Colors.white54,),),
                                            "assets/backg.jpg",
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                                     Positioned(
                                       top: 0,
                                       left: 0,
                                       child:   Padding(
                                         padding: const EdgeInsets.all(32.0),
                                         child: HeadingText("${index<8?"0":""}${index+1}",size: 40,),
                                       ),)
                                  ],
                                ),
                              ),
                            )
                          :Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1500, maxHeight: 600),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                              children: [
                                PageView.builder(
                                  onPageChanged: (value) => setState(() {
                                    page = value;
                                  }),
                                  controller: _pageController,
                                  itemCount: 5,
                                  itemBuilder: (context, index) =>
                                     Stack(
                                        children: [
                                          CardwithShadow(
                                              padding: EdgeInsets.zero,
                                              child: SizedBox(
                                                width: double.maxFinite,
                                                child: Image.network("http://wallpaperaccess.com/full/2465431.jpg",width: 100,height: 100,headers:{'Access-Control-Allow-Origin': '*',},)
                                        //         child:Image.network(
                                        //            headers: {"Cache-Control": "no-cache"},
                                        //   loadingBuilder: (context, child, loadingProgress) => const Center(child: CircularProgressIndicator(),),
                                        //   errorBuilder: (context, error, stackTrace) =>  const Center(child: CircularProgressIndicator(),) ,
                                        //   "https://wallpaperaccess.com/full/2465431.jpg",
                                        //   fit: BoxFit.cover,
                                        // ),
                                              )),
                                                    Positioned(
                                     top: 0,
                                     left: 0,
                                     child:   Padding(
                                       padding: const EdgeInsets.all(32.0),
                                       child: HeadingText("${index<8?"0":""}${index+1}",size: 40,),
                                     ),),
                                        ],
                                      ),
                                ),
                                 
                                Positioned(
                                    left: 0,
                                    top: 0,
                                    bottom: 0,
                                    child: Center(
                                        child:page <= 0?const SizedBox() :IconButton(
                                      onPressed: _goToPreviousPage,
                                      icon: const Icon(Icons.arrow_left),
                                    ))),
                                Positioned(
                                    right: 0.5,
                                    top: 0,
                                    bottom: 0,
                                    child: Center(
                                        child: page>=4?const SizedBox(): IconButton(
                                      onPressed: _goToNextPage,
                                      icon: const Icon(Icons.arrow_right),
                                    ))),
                              ],
                            ),
                    ),
                  ),
                )
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
