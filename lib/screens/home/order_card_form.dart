import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salon_bac/constants.dart';
import 'package:salon_bac/screens/components/rounded_button.dart';
import 'package:salon_bac/screens/components/text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderCardForm extends StatefulWidget {
  @override
  _OrderCardFormState createState() => _OrderCardFormState();
}

class _OrderCardFormState extends State<OrderCardForm> {
  final _firestore = Firestore.instance;
  String number;
  String adress;
  String FullName;
  // void getCommands() async {
  //   final commandes = await _firestore.collection("commandes").getDocuments();
  //   for(var commande in commandes.documents){
  //     print(commande.data());
  //   }
  // }
  void getCommandsStream() async {
   await for(var commandes in _firestore.collection("commandes").snapshots()){
     for(var commande in commandes.documents){
       print(commande.data());
     }
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: SvgPicture.asset(
              "assets/icons/back.svg",
              color: Colors.black,
              width: size.width * 0.07,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          IconButton(
              icon: SvgPicture.asset(
                "assets/icons/shopping-bag.svg",
                color: Colors.black,
                width: size.width * 0.07,
              ),
              onPressed: () {
                getCommandsStream();
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SafeArea(
                    child: Text(
                      "Valider La commande",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.black,
                        fontFamily: 'CardoRegular',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Text(
                    "Carte Visa PaySera",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SvgPicture.asset(
                      "assets/icons/label.svg",
                      height: size.height * 0.2,
                      color: Colors.black,
                    ),
                  ),
                  Form(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        TextFieldOrder(
                          function: (value){
                            number = value;
                          },
                          hint: "Enter your number",
                          iconPath: "assets/icons/call.svg",
                          title: "Number",
                        ),
                        TextFieldOrder(
                          function: (value){
                            adress = value;
                          },
                          hint: "Enter your adress",
                          iconPath: "assets/icons/home.svg",
                          title: "Adress",
                        ),
                        TextFieldOrder(
                          function: (value){
                            FullName = value;
                          },
                          hint: "Enter your full name",
                          iconPath: "assets/icons/identification.svg",
                          title: "Full name",
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        RoundedButton(
                          text: "Confirmer la commande",
                          color: kPrimaryColor,
                          press: () {
                           _firestore.collection("commandes").add({
                             'number': number,
                             'adress' : adress,
                             'fullname' : FullName,
                           });
                          },
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
