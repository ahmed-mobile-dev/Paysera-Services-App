import 'package:flutter/material.dart';

class Background_2 extends StatelessWidget {
  final Widget child;
  final double anim;
  Background_2({this.child,this.anim});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            child: Image.asset("assets/images/main_top.png"),
            width: anim * size.width * 0.35,
          ),
          Positioned(
            child: Image.asset("assets/images/login_bottom.png"),
            width: anim * size.width * 0.35,
            bottom: 0,
            right: 0,
          ),
          child,
        ],
      ),
    );
  }
}
