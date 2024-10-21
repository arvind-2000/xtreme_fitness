import 'package:flutter/material.dart';

import 'termandcondition.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Column(
          children:[
            SizedBox(height: 100,
            child: Image.asset(''),
            ),

             const TitleandSub(title: "PRIVACY POLICY",subtitle: "At XTREME FITNESS, we respect the concerns of our CLIENTS, about your personal information and value our relationship with you. This Privacy Policy explains the types of personal information we collect, how we use and process personal information and with whom we share personal information.",),
            const SizedBox(height: 20,),

             const TitleandSub(title: "INFORMATION REQUEST",subtitle: "If you request information about our services, or fitness industry-related information, we will ask you to provide personal information and details, such as your name, email address, telephone number, intended use of the relevant services. You may choose to provide additional comments and requests. We will use your details to send you the information you request and may use this information to communicate with you in the future about our services and fitness related matters.",),
            const SizedBox(height: 20,),

             const TitleandSub(title: "FEEDBACK,SURVEYS OR CONTESTS",subtitle: "We may offer you the opportunity to participate in online surveys, solicitations, or contests. Information we request includes contact information (such as e-mail address). Participation in surveys, solicitations, or contests is completely voluntary. Therefore, you have a choice as to whether to disclose any information.",),
            const SizedBox(height: 20,),

             const TitleandSub(title: "COOKIES",subtitle: "We collect certain information by automated means when you visit our Sites, such as how many users visited our Sites and the pages accessed. By collecting this information, we learn how to best tailor our Sites to our visitors. We collect this information through various means such as “cookies.",),
            const SizedBox(height: 20,),
          ]
        )
      ),
    );
  }
}