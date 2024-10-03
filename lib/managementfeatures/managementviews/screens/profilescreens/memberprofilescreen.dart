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
                        widget.pagectrl!.changeviewprofile();
              
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
                              children: [
                                        // memberprofile(widget: widget), 
                                        SizedBox(height: 20,),           
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
                
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth:600),
                child: SizedBox(
                  width: double.maxFinite,
                  child: CardwithShadow(
                         margin: const EdgeInsets.only(right: 16),
                    child: Column(
                    children: [
                      const Text("Plan"),
                      const SizedBox(height: 16,),
                      Text(widget.user!.category!=null?"${widget.user!.category}":""),
                      const SizedBox(height: 16,),
                                      
                    ],
                  )),
                ),
              ),
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
          width: 300,
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
                    
                const Text("Name"),
                const SizedBox(height: 10,),
                 Text("${widget.user?.firstName??""} ${widget.user?.surname??""}",style: const TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
                  const Text("Membership Id"),
                const SizedBox(height: 10,),
                 Text('${d?.membershipId}',style: const TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
                const Text("Phone"),
                   const SizedBox(height: 10,),
                Text(widget.user?.mobileNumber??"",style: const TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
                const Text("Designation"),
                   const SizedBox(height: 10,),
                const Text("Member",style: TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
                const Text("Address"),
                   const SizedBox(height: 10,),
                Text(widget.user?.address??"",style: const TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
                const Text("Email"),
                   const SizedBox(height: 10,),
                Text(widget.user?.email??"",style: const TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 16,),
                const Text("Category"),
                   const SizedBox(height: 10,),
                Text(widget.user?.category??"",style: const TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 16,),
        
                widget.user?.category!=null && widget.user!.category!.toLowerCase()=="personal"?CardwithShadow(
                  onpress: (){},
                  
                  
        
                  child: Center(child: Text("Edit Trainer"),)):SizedBox()
               
              ],
            )));
      }
    );
  }
}