import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salon_bac/screens/components/reusable_card.dart';
import 'package:salon_bac/screens/home/order_card.dart';
import '../../constants.dart';
import 'my_clipper.dart';

class BodyHomeScreen extends StatefulWidget {
  @override
  _BodyHomeScreenState createState() => _BodyHomeScreenState();
}

class _BodyHomeScreenState extends State<BodyHomeScreen> {
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    final LoggedInUser = await _auth.currentUser;
    if (LoggedInUser != null) {
       // Do somethings
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.grey[300],
        child: Stack(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: size.height * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [kPrimaryColor, kPrimaryLightColor]),
                ),
                child: Center(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      SafeArea(
                        child: Text(
                          'Paysera Services'.toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              fontFamily: 'IndieFlower',
                              letterSpacing: 4,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "Avez vous une carte visa PaySera ?\nCommander une ! Qu'est ce que vous attendez ?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 16,
                                letterSpacing: 2)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GridView.count(
              padding: EdgeInsets.only(
                  left: 20, right: 20, bottom: 20, top: size.height * 0.25),
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                reusable_card(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return OrderCard();
                    }));
                  },
                  ImagePath: "assets/icons/card.svg",
                  text: "Commander une carte",
                ),
                reusable_card(
                  ImagePath: "assets/icons/add.svg",
                  text: "Charger la carte",
                ),
                reusable_card(
                  ImagePath: "assets/icons/payment-method.svg",
                  text: "Euro PaySera a vendre",
                ),
                reusable_card(
                  ImagePath: "assets/icons/netflix.svg",
                  text: "Acheter Netflix",
                ),
                reusable_card(
                  ImagePath: "assets/icons/manette.svg",
                  text: "La recharge des jeux",
                ),
                reusable_card(
                  ImagePath: "assets/icons/placeholder.svg",
                  text: "Infos",
                ),
              ],
            ),
            Positioned(
                right: 0,
                top: size.height * 0.018,
              child: SafeArea(
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: (){
                    _auth.signOut();
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
