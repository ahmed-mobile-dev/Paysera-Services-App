import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salon_bac/screens/components/background_3.dart';
import 'package:salon_bac/constants.dart';
import 'package:salon_bac/screens/components/container_textfield.dart';
import 'package:salon_bac/screens/components/reusable_login.dart';
import 'package:salon_bac/screens/components/rounded_button.dart';
import 'package:salon_bac/screens/home/home_1.dart';
import 'package:salon_bac/screens/welcome/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with SingleTickerProviderStateMixin {
  final _auth = FirebaseAuth.instance;
  String email;
  bool showProgress = false;
  String Password;
  String confirmPassword;
  bool isScure = true;
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
    Size size = MediaQuery.of(context).size;
    return background_3(
      showProgress: showProgress,
      anim: animation.value,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(
          //   height: 15,
          // ),
          Center(
              child: TypewriterAnimatedTextKit(
            text: ["CREER UN COMPTE"],
            textStyle: kTextStyle,
          )),
          // SizedBox(
          //   height: 15,
          // ),
          SvgPicture.asset(
            "assets/icons/debit-card.svg",
            height: size.height * 0.25,
          ),
          // SizedBox(
          //   height: 10,
          // ),
          ContainerTextField(
            type: TextInputType.emailAddress,
            isScure: false,
            text: "Email",
            icon: Icon(
              Icons.email,
              color: kPrimaryColor,
            ),
            onChanged: (value) {
              email = value;
            },
          ),
          Stack(
            children: [
              ContainerTextField(
                type: TextInputType.visiblePassword,
                isScure: isScure,
                text: "Mot de passe",
                icon: Icon(
                  Icons.lock,
                  color: kPrimaryColor,
                ),
                onChanged: (value) {
                  Password = value;
                },
                // suffixIcon: Icon(Icons.visibility),
              ),
              Positioned(
                child:  IconButton(
                icon: isScure? Icon(
                      Icons.visibility,
                      color: kPrimaryColor,
                    ) : Icon(
                Icons.visibility_off,
                color: kPrimaryColor,
              ) ,
                    onPressed: () {
                      setState(() {
                        isScure = !isScure;
                      });
                    }),
                right: 5,
                bottom: 16,
              )
            ],
          ),
          Stack(
            children: [
              ContainerTextField(
                type: TextInputType.visiblePassword,
                isScure: true,
                text: "Confirmer le mot de passe",
                icon: Icon(
                  Icons.lock,
                  color: kPrimaryColor,
                ),
                onChanged: (value) {
                  confirmPassword = value;
                },
                // suffixIcon: Icon(Icons.visibility),
              ),
            ],
          ),
          // SizedBox(
          //   height: 15,
          // ),
          RoundedButton(
            text: "CONNECTER",
            press: () async {
              // print(email);
              // print(Password);
              try {
                if (Password == confirmPassword) {
                  setState(() {
                    showProgress = true;
                  });

                  final NewUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: Password);
                  if (NewUser != null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomeScreen();
                    }));
                  }
                  setState(() {
                    showProgress = false;
                  });
                } else {
                  Toast.show("Not identical password", context,
                      duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                }
              } catch (e) {
                setState(() {
                  showProgress = false;
                });
                Toast.show(e.toString(), context,
                    duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
              }
            },
            color: kPrimaryColor,
            textColor: Colors.white,
          ),
          // SizedBox(
          //   height: 9,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Vous avez deja un compte ? ",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 15,
                  letterSpacing: 1,
                ),
              ),
              GestureDetector(
                child: Text(
                  "Connecter",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontSize: 17),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));
                },
              ),
            ],
          ),
          SizedBox(
            height: 9,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  thickness: 2,
                  color: Color(0xFFD9D9D9),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "OR",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              // SizedBox(
              //   width: 10,
              // ),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  thickness: 2,
                  color: Color(0xFFD9D9D9),
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: 10,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ReusableLogin(
                path: "assets/icons/facebook.svg",
                onTap: () {
                  //login with facebook
                },
              ),
              SizedBox(
                width: 5,
              ),
              ReusableLogin(
                path: "assets/icons/google-plus.svg",
                onTap: () {
                  // login with google
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
