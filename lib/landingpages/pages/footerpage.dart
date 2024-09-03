
import 'package:flutter/material.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/landingpages/pages/responsivepages.dart';

import '../../widgets/headingtext.dart';

class ContactFooter extends StatelessWidget {
  const ContactFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsivePages(
          colors: Colors.black45,
      screenheight: 400,
      child1: Container(
      
     
        child: Column(
          children: [
            SizedBox(height: 40,),
          MediaQuery.sizeOf(context).width<mobilescreen?Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Company",style: TextStyle(fontSize: 20,color: Colors.white),),
                    SizedBox(height: 40,),
                    Text("About Us",style: TextStyle(fontSize: 16,color: Colors.white60),),
                    SizedBox(height: 10,),
                          Text("Why Us",style: TextStyle(fontSize: 16,color: Colors.white60),),
                    SizedBox(height: 10,),
              
                     Text("Partnership",style: TextStyle(fontSize: 16,color: Colors.white60),),
                    SizedBox(height: 10,),
               
               
          
                  ],
                ),
              const SizedBox(height: 60,),
                       const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Services",style: TextStyle(fontSize: 20,color: Colors.white),),
                    SizedBox(height: 40,),
                    Text("BMI",style: TextStyle(fontSize: 16,color: Colors.white60),),
                    SizedBox(height: 10,),
                          Text("Steam Bath",style: TextStyle(fontSize: 16,color: Colors.white60),),
                    SizedBox(height: 10,),
                     Text("Massage Chair",style: TextStyle(fontSize: 16,color: Colors.white60),),
                    SizedBox(height: 10,),
               
               
          
                  ],
                ),
               const SizedBox(height: 60,),
                       Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Help",style: TextStyle(fontSize: 20,color: Colors.white),),
                    SizedBox(height: 40,),
                    Text("Account",style: TextStyle(fontSize: 16,color: Colors.white60),),
                    SizedBox(height: 10,),
                          Text("Support Center",style: TextStyle(fontSize: 16,color: Colors.white60),),
                    SizedBox(height: 10,),
                     Text("Privacy Policy",style: TextStyle(fontSize: 16,color: Colors.white60),),
                    SizedBox(height: 10,),
               
               
          
                  ],
                ),
                  SizedBox(height: 60,),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Contact Us",style: TextStyle(fontSize: 20,color: Colors.white),),
                    SizedBox(height: 40,),
                    Row(
                      children: [
                        Icon(Icons.phone,size: 16,color: Theme.of(context).colorScheme.secondary),
                        SizedBox(width: 10,),
                        Text("+91 12345467890",style: TextStyle(fontSize: 16,color: Colors.white60),),
                      ],
                    ),
                    SizedBox(height: 10,),
                       Row(
                      children: [
                        Icon(Icons.email,size: 16,color: Theme.of(context).colorScheme.secondary),
                        SizedBox(width: 10,),
                        Text("noreply@support.xtreme.com",style: TextStyle(fontSize: 16,color: Colors.white60),),
                      ],
                    ),
                    SizedBox(height: 10,),
                         Row(
                      children: [
                        Icon(Icons.location_on,size: 16,color: Theme.of(context).colorScheme.secondary),
                        SizedBox(width: 10,),
                        Text("Mantripukhri, 795002",style: TextStyle(fontSize: 16,color: Colors.white60),),
                      ],
                    ),
                    SizedBox(height: 10,),
               
               
          
                  ],
                ),
                 SizedBox(height: 60,),
              ],
            ) :Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Company",style: TextStyle(fontSize: 20,color: Colors.white),),
                    SizedBox(height: 40,),
                    Text("About Us",style: TextStyle(fontSize: 16,color: Colors.white60),),
                    SizedBox(height: 10,),
                          Text("Why Us",style: TextStyle(fontSize: 16,color: Colors.white60),),
                    SizedBox(height: 10,),
              
                     Text("Partnership",style: TextStyle(fontSize: 16,color: Colors.white60),),
                    SizedBox(height: 10,),
               
               
          
                  ],
                ),
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Services",style: TextStyle(fontSize: 20,color: Colors.white),),
                    SizedBox(height: 40,),
                    Text("BMI",style: TextStyle(fontSize: 16,color: Colors.white60),),
                    SizedBox(height: 10,),
                          Text("Steam Bath",style: TextStyle(fontSize: 16,color: Colors.white60),),
                    SizedBox(height: 10,),
                     Text("Massage Chair",style: TextStyle(fontSize: 16,color: Colors.white60),),
                    SizedBox(height: 10,),
               
               
          
                  ],
                ),
                       Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Help",style: TextStyle(fontSize: 20,color: Colors.white),),
                    SizedBox(height: 40,),
                    Text("Account",style: TextStyle(fontSize: 16,color: Colors.white60),),
                    SizedBox(height: 10,),
                          Text("Support Center",style: TextStyle(fontSize: 16,color: Colors.white60),),
                    SizedBox(height: 10,),
                     Text("Privacy Policy",style: TextStyle(fontSize: 16,color: Colors.white60),),
                    SizedBox(height: 10,),
               
               
          
                  ],
                ),
          
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Contact Us",style: TextStyle(fontSize: 20,color: Colors.white),),
                    SizedBox(height: 40,),
                    Row(
                      children: [
                        Icon(Icons.phone,size: 16,color: Theme.of(context).colorScheme.secondary),
                        SizedBox(width: 10,),
                        Text("+91 12345467890",style: TextStyle(fontSize: 16,color: Colors.white60),),
                      ],
                    ),
                    SizedBox(height: 10,),
                       Row(
                      children: [
                        Icon(Icons.email,size: 16,color: Theme.of(context).colorScheme.secondary),
                        SizedBox(width: 10,),
                        Text("noreply@support.xtreme.com",style: TextStyle(fontSize: 16,color: Colors.white60),),
                      ],
                    ),
                    SizedBox(height: 10,),
                         Row(
                      children: [
                        Icon(Icons.location_on,size: 16,color: Theme.of(context).colorScheme.secondary),
                        SizedBox(width: 10,),
                        Text("Mantripukhri, 795002",style: TextStyle(fontSize: 16,color: Colors.white60),),
                      ],
                    ),
                    SizedBox(height: 10,),
               
               
          
                  ],
                ),
              ],
            ),
             SizedBox(height: 60,),
            Divider(height: 1,
            color: Colors.white60),
            SizedBox(
      
            child: MediaQuery.sizeOf(context).width<=mobilescreen? Column(
              

            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 70,
                      width: 70,
                      child: Image.asset("assets/logo1.png")),
                    // const SizedBox(width: 10,),
                    // const HeadingText("Xtreme",size: 20)
                  ],
                ),
              ),
              const SizedBox(width: 50,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   IconButton(onPressed: (){}, icon: Icon(Icons.facebook)),
                    SizedBox(width: 30,),
                    IconButton(onPressed: (){}, icon: Icon(Icons.facebook)),
                    SizedBox(width: 30,),
                     IconButton(onPressed: (){}, icon: Icon(Icons.facebook)),
                  ],
                ),
              ),
            ],
          ): Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 70,
                      width: 70,
                      child: Image.asset("assets/logo1.png")),
                    const SizedBox(width: 10,),
                    const HeadingText("Xtreme",size: 20)
                  ],
                ),
              ),
              const SizedBox(width: 50,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  children: [
                   IconButton(onPressed: (){}, icon: Icon(Icons.facebook)),
                    SizedBox(width: 30,),
                    IconButton(onPressed: (){}, icon: Icon(Icons.facebook)),
                    SizedBox(width: 30,),
                     IconButton(onPressed: (){}, icon: Icon(Icons.facebook)),
                  ],
                ),
              ),
            ],
          ),)
          ],
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[800],
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Contact Info
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Call us at: ',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                '1-800-123-4567',
                style: TextStyle(color: Colors.blueAccent, fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Email us at: ',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                'support@example.com',
                style: TextStyle(color: Colors.blueAccent, fontSize: 16),
              ),
              SizedBox(height: 16),
            ],
          ),
          
          // Support Links
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Text('Chat with us live', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(width: 16),
              TextButton(
                onPressed: () {},
                child: Text('Visit our Help Center', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(width: 16),
              TextButton(
                onPressed: () {},
                child: Text('Give us your feedback', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          
          // Social Media Links
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.facebook, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.facebook, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.face, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          
          // Additional Info
          SizedBox(height: 16),
          Text(
            'Support Hours: Mon-Fri, 9 AM - 6 PM EST',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          SizedBox(height: 8),
          Text(
            'For accessibility support, please call 1-800-ACCESS',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          SizedBox(height: 8),
          Text(
            'Our Office: 1234 Elm Street, Suite 100, City, State, ZIP',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          
          // Legal Links
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Text('Terms of Service', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(width: 16),
              TextButton(
                onPressed: () {},
                child: Text('Privacy Policy', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}