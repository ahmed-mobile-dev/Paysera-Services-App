import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salon_bac/constants.dart';
import 'package:salon_bac/screens/home/order_card_form.dart';

class BodyOrderCard extends StatefulWidget {
  @override
  _BodyOrderCardState createState() => _BodyOrderCardState();
}

class _BodyOrderCardState extends State<BodyOrderCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.35,),
                height: size.height * 0.6,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: size.height * 0.5 * 0.15,
                      ),
                      Text(
                        "Banque",
                        style: TextStyle(fontSize: 17, color: Colors.grey[700]),
                      ),
                      Text(
                        "PaySera",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          "Demande carte Visa Paysera à un prix spécial à 3500DA seulement (toutes charges comprises)  Offre Spécial Une Carte paysera a 3500DA",
                          textAlign: TextAlign.center,
                          style: TextStyle(height: 2,fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        width: size.width *0.8,
                        child: FlatButton(
                          padding: EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: kPrimaryColor,
                          onPressed: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context){
                             return OrderCardForm();
                           }));
                          },
                          child: Text(
                            "Commander maintenant".toUpperCase(),
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 5,)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Commander une carte visa",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "Paysera",
                      style: Theme.of(context).textTheme.headline2.copyWith(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                    ),
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Prix",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              "3500 Da",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(
                                    color: Colors.white,
                                    fontSize: 40,
                                  ),
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          "assets/icons/credit-card2.svg",
                          height: size.height * 0.2,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
