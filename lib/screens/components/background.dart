

import 'package:flutter/material.dart';
class background extends StatelessWidget {
  final Widget child;
  final double anim;
  background({this.child,this.anim});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size ;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            child: Image.asset(
              "assets/images/main_top.png",
              width: anim * 150,
            ),
            left: 0,
            top: 0,
          ),
          Positioned(child: Image.asset("assets/images/main_bottom.png",
            width: anim * 50,
          ),
            bottom: 0,
          ),
          child,
        ],
      ),

    );
  }
}
