import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/membership.dart';

import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/memberhistory.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';
import 'package:xtreme_fitness/widgets/imagewidgets.dart';

import '../../../../responsive/responsive.dart';
import '../../../../widgets/titletext.dart';
import '../../../managementdomain/entities.dart/xtremer.dart';

class MemberProfilescreen extends StatefulWidget {
  const MemberProfilescreen({super.key, this.user, this.pagectrl,});
  final Xtremer? user;
  final GetxPageController? pagectrl;

  @override
  State<MemberProfilescreen> createState() => _MemberProfilescreenState();
}

class _MemberProfilescreenState extends State<MemberProfilescreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    if(widget.user!=null){
    Get.find<ManagementController>().getMembershipbyid(widget.user!.XtremerId!);
    }
    } ,);

       
  }

  @override
  Widget build(BuildContext context) {
    
    double size = MediaQuery.sizeOf(context).width;
        
        return GetBuilder<ManagementController>(
          builder: (managectrl) {
            
         
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
               
                children: [
                  //title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const HeadingText("Profile",size: 30,),
                    IconButton(onPressed: (){
                        widget.pagectrl!.changeviewprofile(false);
              
                    }, icon:const Icon(Icons.close))
                  ],
                ),
                const SizedBox(height: 20,),
                  //body for desktop
                  widget.user==null?const Center(child: Text("No User"),) :size<=mobilescreen?Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                                  memberprofile(widget: widget), 
                                  SizedBox(height: 20,),           
                              memberplanwidget(widget: widget), 
                               SizedBox(height: 40,), 
                        ],
                      ),
                    ),
                  ) :Expanded(
                    child: Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                           memberprofile(widget: widget), 
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                       
                                    memberplanwidget(widget: widget), 
                                     SizedBox(height: 40,), 
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
               
                ],
              ),
            );
          }
        );

  }
}

class memberplanwidget extends StatelessWidget {
  const memberplanwidget({
    super.key,
    required this.widget,
  });

  final MemberProfilescreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
              TitleText("Service History"),  
              Container(width: 100,height: 0.7,color: Colors.grey[500],),
              SizedBox(height: 16,),
              MemberServiceHistory(xtremers: widget.user!,)
      ],
    );
  }
}

class memberprofile extends StatelessWidget {
  const memberprofile({
    super.key,
    required this.widget,
  });

  final MemberProfilescreen widget;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagementController>(
      builder: (managectrl) {
        Membership? d  = managectrl.getallMembership.firstWhereOrNull((element) => element.userId==widget.user?.XtremerId,);
        return SizedBox(
          width:MediaQuery.sizeOf(context).width<mobilescreen ?double.maxFinite :300,
          child: CardwithShadow(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child:SizedBox(
                        height: 100,
                        width: 100,
                        child: MemoryImageWidget(id: widget.user!.id)),
                    ),
                    
                    // IconButton(onPressed: (){}, icon: const Icon(Icons.edit,size: 16,))
                  ],
                ),
                      const SizedBox(height: 30,),
                //name details
                    
                 TitleText("${widget.user?.firstName??""} ${widget.user?.surname??""}",size: 16,),
                const SizedBox(height: 20,),
               d?.membershipId!=null?  Text("Membership Id",style: TextStyle(color: Colors.grey[500]),):SizedBox(),
                const SizedBox(height: 5,),
                 d?.membershipId!=null?  Text('${d?.membershipId}',style: TextStyle(fontWeight: FontWeight.bold,),):SizedBox(),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Icon(Icons.phone,size: 12,color: Colors.grey[500]),
                    SizedBox(width: 4,),
                    Text(widget.user?.mobileNumber??"",style: TextStyle(color: Colors.grey[500],fontSize: 16),),
                  ],
                ),
                const SizedBox(height: 20,),
        Text("Address",style: TextStyle(color: Colors.grey[500]),),
                   const SizedBox(height: 5,),
                Text(widget.user?.address??"",style: const TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
               Text("Email",style: TextStyle(color: Colors.grey[500])),
                   const SizedBox(height: 5,),
                Text(widget.user?.email??"",style: const TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 16,),
                 Text("Category",style: TextStyle(color: Colors.grey[500])),
                   const SizedBox(height: 5,),
                Text(widget.user?.category??"",style: const TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 16,),
        
                // widget.user?.category!=null && widget.user!.category!.toLowerCase()=="personal"?CardwithShadow(
                //   onpress: (){},
                  
                  
        
                //   child: Center(child: Text("Edit Trainer"),)):SizedBox()
               
              ],
            )));
      }
    );
  }
}