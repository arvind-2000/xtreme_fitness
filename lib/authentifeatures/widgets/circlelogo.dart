import 'package:flutter/material.dart';


class CircleLogo extends StatelessWidget {
  const CircleLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
          width: 200,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.red[400],
    
    ),
    child: Stack(
      children: [


                              Positioned(
          left: 100,
          top: 60,
          child: Star(),
        ),
                              Positioned(
          right: 30,
          top: 30,
          child:  Container(height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.white60,
            shape: BoxShape.circle
          ),
          ),
        ),



        Positioned(
          left: 50,
          top: 50,
          child: Container(height: 30,
          width: 30,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle
          ),
          ),
        ),
                Positioned(
          left: 65,
          top: 60,
          child: Container(height: 20,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle
          ),
          ),
        ),

                  Positioned(
          left: 35,
          top: 60,
          child: Container(height: 20,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle
          ),
          ),
        )
      ],
    ),
    );
  }
}

class Star extends StatelessWidget {
  const Star({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(height: 5,
    width: 5,
    decoration: BoxDecoration(
      color: Colors.white60,
      shape: BoxShape.circle
    ),
    );
  }
}
