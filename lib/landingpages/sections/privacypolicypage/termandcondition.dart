import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';
import 'package:xtreme_fitness/widgets/titletext.dart';

class TermAndCondition extends StatelessWidget {
  const TermAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:  Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 200,width: double.maxFinite,child: Image.asset('assets/policy.jpg',fit: BoxFit.cover),),
          const SizedBox(height: 20,),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: const Padding(
                padding: EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    TitleandSub(title: "MEMBERSHIP TERMS AND CONDITIONS",subtitle: "I agree to abide by the rules of conduct, behavior, dress code, equipment usage and use of services that are displayed within this Gym and that have been provided to me.\nI agree that the membership fees are not refundable and I agree and understand that non-usage of the gym does not allow early termination of this agreement nor does it warrant a refund of any type.\nXtreme Fitness may at their discretion block access or terminate any membership agreement without notice for any non-compliance of this agreement or any behavior or action that they deem inappropriate.\nI understand members are not permitted to bring children into the gym, nor are they permitted to leave children unattended in the area at any time and that Xtreme Fitness accepts no responsibility for children either bought into the gym or left in the gym by a parent or a guardian.\nI fully understand I'm solely responsible for any damage that I may cause to Xtreme Fitness its facilities, services, products, or equipment if such damage is caused by my willful act and/or negligence.\nI am fully aware that all Xtreme Fitness is equipped with Video Surveillance technology which is constantly recording for the security of the gym and that the Video Surveillance can be remotely viewed at any time by the gym authority and/or security provider.\nI agree and recognize that I have read the New Member Information document.\nI fully understand and agree to abide by all the terms & conditions, policies and instructions contained within.\nI am aware that a personal access card is not refundable and if lost a new card must be purchased from the gym authority at additional cost.\nI fully understand and accept that open locker racks are provided for my use as an additional service and that Xtreme Fitness is not responsible for any loss or damage to my property when using the gym or the lockers, including my mobile phone, wallet, headphone, bag or other.\nParking vehicle is subject to availability, members are required to follow building as well as traffic rules for Parking.\nXtreme Fitness is not responsible for any damage or tow of your personal vehicle.\n",),
                    SizedBox(height: 20,),
                    TitleandSub(title: "TERMS AND CONDITIONS OF PERSONAL TRAINING",subtitle: "Consult your physician or other health care professional before starting Personal Training sessions to determine if it is right for your needs.\nDo not start a Personal Training and/or nutrition program if your physician or health care provider advises against it.\nThe results, if any from Personal Training and/or nutrition programs may vary from person to person.\nFurther, engaging in any Exercise, Fitness, Personal Training or Nutrition program involves risks of injury.\nIf you choose to follow any of Xtreme Fitness’s Personal Training programs or nutrition recommendations you acknowledge this and agree not to hold Xtreme Fitness responsible for any injuries or damages you may incur.\nWe believe that for most people following our Personal Training programs and methods will lead to their desired results, all exercise programs depend on the individual.\nResults will be affected by the effort and commitment of the individual, however in some circumstances even where an individual follows our program they may not achieve the desired results.\nWe, therefore provide no warranties of any kind, express or implied.\nAny Personal Plan will have been prepared based on information provided by you.\nYou are responsible for the accuracy of any information that you provide to us.\nYou are responsible for informing us of any health issues or medical conditions when asking us to prepare a Personal Plan.\nPersonal Training is optional and its fees are over and above the gym fees.\nPersonal training sessions will be valid only till the gym membership is valid.\nMember needs to renew his/her membership to avail rest of personal training session.\nIn case of the absence of your personal trainer, the client can request the manager to assign a stand-by trainer of the same level for a few sessions.\nThese sessions will be counted as personal training sessions.\nIn case the personal trainer assigned to you leaves the job or is not able to attend your training, Xtreme Fitness will assign you a new trainer of the same level for the remaining sessions.\n",),
                    SizedBox(height: 20,),
                    TitleandSub(title: "TERMS AND CONDITIONS OF WEBSITE",subtitle: "The content of the pages of this website is for your general information and use only.\nAll content is subject to change without notice.\nXtreme Fitness nor any third parties provide any warranty or guarantee as to the accuracy, timeliness, performance, completeness or suitability of the information and materials found on this website.\nYour use of any information or materials on this website is entirely at your own risk, for which Xtreme Fitness shall not be liable.\nIt shall be your own responsibility to ensure that any products, services or information available through this website meet your specific requirements.\nUnauthorized use of this website may give rise to a claim for damages and/or be a criminal offense.\n",),
                    SizedBox(height: 20,),
                    TitleandSub(title: "OUR RESPONSE",subtitle: "You can submit any complaints via our email. Please include all the details relating to your complaint. We will do all that is reasonably and practicably possible to assess the merits of the complaint and respond within a reasonable timeframe.",),
                    SizedBox(height: 20,),
                    TitleandSub(title: "TIME OF RESPONSE",subtitle: "We have a 48 hours response time policy. We will make sure that someone from our team will reply to your email/quire within 48 hours.",),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          ),
         
        
        ],
      
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
        const SizedBox(height: 10,),
        Text(subtitle,style: TextStyle(fontSize: 14,color:Colors.grey[400]),),
      ],
    );
  }
}