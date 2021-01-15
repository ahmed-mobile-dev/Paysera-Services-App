import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salon_bac/constants.dart';
import 'package:salon_bac/screens/components/backgroud_2.dart';
import 'package:salon_bac/screens/components/container_textfield.dart';
import 'package:salon_bac/screens/components/rounded_button.dart';
import 'package:salon_bac/screens/home/home_1.dart';
import 'package:salon_bac/screens/welcome/signup_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>  with SingleTickerProviderStateMixin  {
  final _auth = FirebaseAuth.instance;
  String email;
  String Password;
  bool Progress = false;
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
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: Progress,
        child: SingleChildScrollView(
          child: Background_2(
            anim: animation.value,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: TypewriterAnimatedTextKit(
                  text: ["CONNECTER"],
                  textStyle: kTextStyle,
                )),
                SizedBox(height: 30,),
                SvgPicture.asset(
                  "assets/icons/credit-card.svg",
                  height: size.height * 0.30,
                ),
                SizedBox(height: 30,),
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
                      child: IconButton(
                          icon: isScure? Icon(
                            Icons.visibility,
                            color: kPrimaryColor,
                          ) : Icon(
                            Icons.visibility_off,
                            color: kPrimaryColor,
                          ),
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
                SizedBox(height: 20,),
                RoundedButton(
                  text: "CONNECTER",
                  press: () async {
                    try{
                      setState(() {
                        Progress = true;
                      });
                      final User =  await _auth.signInWithEmailAndPassword(email: email, password: Password);
                      setState(() {
                        Progress = false;
                      });
                      if (User != null){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return HomeScreen();
                        }));
                      }
                    }
                    catch(e){
                      setState(() {
                        Progress = false;
                      });
                      Toast.show(e.toString(), context,
                          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                    }

                  },
                  color: kPrimaryColor,
                  textColor: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Vous n'avez pas un compte ? ",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 15,
                          letterSpacing: 1,
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        "Creer un compte",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            fontSize: 17),
                      ),
                      onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context){
                         return SignupScreen();
                       }));
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
