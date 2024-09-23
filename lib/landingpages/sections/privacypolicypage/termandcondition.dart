import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';
import 'package:xtreme_fitness/widgets/titletext.dart';

class TermAndCondition extends StatelessWidget {
  const TermAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: SingleChildScrollView(
        child:  Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                Get.offAllNamed("/home");
              },
              child: SizedBox(height: 80,width: 80,child: Image.asset('assets/logo1.png'),)),
            HeadingText("Terms & Conditions",size: 30,isbold: true,),
            SizedBox(height: 20,),
            TitleandSub(title: "VALID GYM MEMBERSHIP",subtitle: "Show your membership card at the front desk and scan to get past the Gym entrance gates",),
             SizedBox(height: 20,),
            TitleandSub(title: "STORE YOUR PERSONAL BELONGINGS",subtitle: "Leave your bags, coats and personal belongings in the lockers downstairs.",),
             SizedBox(height: 20,),
            TitleandSub(title: "WEAR SPORTS CLOTHING + CLEAN SPORTS SHOES",subtitle: "Temporarily removal of shoes only for purpose of stretching/foam rolling or deadlifts/squats at the racks.",),
             SizedBox(height: 20,),
            TitleandSub(title: "BRING AND USE YOUR OWN TOWEL",subtitle: "Hygience for yourself and others. Place your towel over the padding of equipment. No sharing of one towel.",),
             SizedBox(height: 20,),
            TitleandSub(title: "FOODS AND DRINKS",subtitle: "No food in the gym.\nOnly sealable water bottles. Cups, cans, or glass bottles are not allowed.",),
             SizedBox(height: 20,),
            TitleandSub(title: "CARE FOR THE FACILITY AND EQUIPMENT",subtitle: "Prevent direct contact of weights with the red floor. Use rubber tiles\nDo not drop dumbbells from a height\nKeep your shoes/feet off the walls and off the leather padding of equipment.",),
  SizedBox(height: 20,),
            TitleandSub(title: "SOCIAL BEHAVIOR AND SHARING EQUIPMENT",subtitle: "Be polite to fellow members and share equipment during busy hours\nReserving multiple work stations for yourself at the same time is not allowed.",),
              SizedBox(height: 20,),
            TitleandSub(title: "STORE TRAINING MATERIALS AFTER USE",subtitle: "Place weights and other materials back where they belong to keep the Gym safe and tidy.",),
              SizedBox(height: 20,),
            TitleandSub(title: "CLEANING CARDIO EQUIPMENT",subtitle: "Wipe off your sweat with spray and a towel.",),
              SizedBox(height: 20,),
            TitleandSub(title: "EXCESSIVE OR UNWANTED BEHAVIOR",subtitle: "Aggressive or annoying behavior such as screaming, yelling, excessive grunting is not allowed.\nPractice of martial arts or exercises that can offend others are not allowed (e.g. wrestling, boxing)",),
              SizedBox(height: 20,),
            TitleandSub(title: "RESPECT THE UM SPORTS STAFF",subtitle: "The staff is knowledgeable and responsible, listen to their advice.",),
              SizedBox(height: 20,),
            TitleandSub(title: "USE OF MOBILE PHONES",subtitle: "Unnecessary long occupation of equipment because of phone use is not allowed\nKeep phone calls outside of the Gym not to distrub others present.\nPictures and filming: Respect other members privacy.\nIt is NOT allowed to capture others without consent",),
              SizedBox(height: 20,),
            TitleandSub(title: "USE OF CHALK",subtitle: "Chalk is only allowed in liquid form and when necessary for barbell exercises at the racks.\nIf you cause chalk marks on the floor or on equipment, clean after use.",),
            SizedBox(height: 20,),
            TitleandSub(title: "GYM ETIQUETTES",subtitle: "Normal footwear must be removed outside & sports shoes must be worn for workouts.\nTowels & Deodorant should be used at all times, for hygiene reasons.\nGetting non-members along is not permitted.\nDo not open the door for anyone.\nDo not block the equipment, please share.\nRerack the weights back in the right place after use.\nDo not drop/throw weights on the floor.\nIt’s a unisex gym, please maintain discipline.",),
            SizedBox(height: 20,),
            TitleandSub(title: "VALID GYM MEMBERSHIP",subtitle: "Show your membership card at the front desk and scan to get past the Gym entrance gates",),
            SizedBox(height: 20,),
            TitleandSub(title: "VALID GYM MEMBERSHIP",subtitle: "Show your membership card at the front desk and scan to get past the Gym entrance gates",),
            SizedBox(height: 20,),
            TitleandSub(title: "VALID GYM MEMBERSHIP",subtitle: "Show your membership card at the front desk and scan to get past the Gym entrance gates",),
            SizedBox(height: 20,),
            TitleandSub(title: "VALID GYM MEMBERSHIP",subtitle: "Show your membership card at the front desk and scan to get past the Gym entrance gates",),
            SizedBox(height: 20,),
            TitleandSub(title: "VALID GYM MEMBERSHIP",subtitle: "Show your membership card at the front desk and scan to get past the Gym entrance gates",),
            SizedBox(height: 20,),
            TitleandSub(title: "VALID GYM MEMBERSHIP",subtitle: "Show your membership card at the front desk and scan to get past the Gym entrance gates",),
          
          ],
        
        ),
      ),
    );
  }
}

class TitleandSub extends StatelessWidget {
  const TitleandSub({
    super.key, required this.title, required this.subtitle,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(title,size: 16,),
        SizedBox(height: 10,),
        Text(subtitle,style: TextStyle(fontSize: 14),),
      ],
    );
  }
}