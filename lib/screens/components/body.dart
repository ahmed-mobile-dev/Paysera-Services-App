import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salon_bac/constants.dart';
import 'package:salon_bac/screens/components/rounded_button.dart';
import 'package:salon_bac/screens/welcome/login_screen.dart';
import 'package:salon_bac/screens/welcome/signup_screen.dart';
import 'background.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );
    controller.forward();
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse(
          from: 1,
        );
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size; // Size of the Screen
    return SingleChildScrollView(
      child: background(
        anim: animation.value,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: TypewriterAnimatedTextKit(
              text: ["BIENVENUE", "PAYSERA SERVICES"],
              textStyle: kTextStyle,
            )),
            SizedBox(
              height: 35,
            ),
            SvgPicture.asset(
              'assets/icons/credit-card-payment.svg',
              height: size.height * 0.35,
              color: kPrimaryColor,
            ),
            SizedBox(
              height: 35,
            ),
            RoundedButton(
              text: "CONNECTER",
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
              color: kPrimaryColor,
              textColor: Colors.white,
            ),
            RoundedButton(
              text: "CREER UN COMPTE",
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignupScreen();
                }));
              },
              color: kPrimaryLightColor,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
