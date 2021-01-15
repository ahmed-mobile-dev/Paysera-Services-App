import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class background_3 extends StatelessWidget {
  final Widget child;
  final double anim;
  final bool showProgress;
  background_3({this.child,this.anim,this.showProgress});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showProgress,
        child: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                    child: Image.asset(
                      "assets/images/signup_top.png",
                      width: anim * size.width * 0.35,
                    )),
                Positioned(child: Image.asset("assets/images/main_bottom.png",
                  width: anim * size.width * 0.3,
                ),
                  bottom: 0,
                ),
                child

              ],
            ),
          ),
        ),
      ),
    );
  }
}
