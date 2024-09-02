import 'package:flutter/material.dart';

class CardBorderHover extends StatefulWidget {
  const CardBorderHover({super.key, this.padding, this.margin, required this.child, this.onpress, this.color});
final EdgeInsets? padding;
final EdgeInsets? margin;
final Widget child;
final VoidCallback? onpress;
final Color? color;

  @override
  State<CardBorderHover> createState() => _CardBorderHoverState();
}
class _CardBorderHoverState extends State<CardBorderHover>{
 Offset pos = Offset(0, 0);
 bool hovers = false;

  @override
  void initState() {
    super.initState();


  }
 
  @override
  Widget build(BuildContext context) {
  
    return MouseRegion(
      onHover: (event) {
          setState(() {
            pos = event.delta;
         
          });
      },

      onEnter: (event) {
        setState(() {
          hovers = true;
        });
      },

      onExit: (event) {
        setState(() {
            hovers = false;
        });
      
      },
      child: LayoutBuilder(
        builder: (context,c) {
          // print("check left:${(MediaQuery.sizeOf(context).width - c.maxWidth)} - ${pos.dx} =   ${pos.dx - (MediaQuery.sizeOf(context).width - c.maxWidth)/2 }");
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    
                    // margin:const EdgeInsets.symmetric(horizontal: 16),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)),
                      border: Border(
                          top: BorderSide(
                             width: 1,
                           color:widget.color??Theme.of(context).colorScheme.onSecondary.withOpacity(0.3),
                          ),
                                 right: BorderSide(
                             width: 1,
                           color:widget.color??Theme.of(context).colorScheme.onSecondary.withOpacity(0.3),
                          ),
                                 left: BorderSide(
                             width: 1,
                           color:widget.color??Theme.of(context).colorScheme.onSecondary.withOpacity(0.3),
                          )
                      ),
                  //     gradient: LinearGradient(
                  //   // center: Alignment.center,
                  //   // startAngle: 0.0,
                  //   // endAngle: 3.14,
                  //   begin: Alignment.bottomRight,
                  //   end: Alignment.topLeft,
                  //   colors: [Theme.of(context).colorScheme.secondary.withOpacity(0.5), Theme.of(context).colorScheme.primary],
                  //   stops: const [0.0, 0.9],
                  // ),
                    ),
            
                  ),
                ),
            
              Positioned(
                  left:pos.dx,
                  top: pos.dy,
                  bottom: 0,
                  right: 0,
                  // left:(pos.dx - (MediaQuery.sizeOf(context).width - c.maxWidth)/2)-30,
                  // bottom:pos.dy - (MediaQuery.sizeOf(context).width - c.maxHeight),
                  // left:pos.dx%(MediaQuery.sizeOf(context).width - c.maxWidth)/2,
                    //  top:pos.dy - (MediaQuery.sizeOf(context).width - c.maxHeight),
                  child: AnimatedOpacity(
                    opacity: hovers?1:0,
            
                    duration: Durations.extralong1,
                    child: Container(
                      height: c.maxHeight/1.5,
                      width: c.maxWidth/1.5,
                      decoration: BoxDecoration(
                      
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                                  center: Alignment.center,
                                  radius: 0.6,
                                  colors: [Colors.red.withOpacity(0.2), Colors.transparent],
                                ),
                      ),
                    ),
                  )),
                       Positioned(
                  // left:pos.dx,
                  // top: pos.dy,
                  bottom: -3,
                  right: -3,
                  // left:(pos.dx - (MediaQuery.sizeOf(context).width - c.maxWidth)/2)-30,
                  // bottom:pos.dy - (MediaQuery.sizeOf(context).width - c.maxHeight),
                  // left:pos.dx%(MediaQuery.sizeOf(context).width - c.maxWidth)/2,
                    //  top:pos.dy - (MediaQuery.sizeOf(context).width - c.maxHeight),
                  child: AnimatedOpacity(
                    opacity: hovers?1:0,
            
                    duration: Durations.extralong1,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                      
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                                  center: Alignment.center,
                                  radius: 0.6,
                                  colors: [Colors.red.withOpacity(0.2), Colors.transparent],
                                ),
                      ),
                    ),
                  )),
                  Positioned.fill(child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                            onTap: widget.onpress,
                      child: Padding(
                        padding: widget.padding??const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                        child: widget.child,
                      )),)
              ],
            ),
          );
        }
      ),
    );
  }
}