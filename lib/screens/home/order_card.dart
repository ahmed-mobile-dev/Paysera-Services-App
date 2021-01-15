import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salon_bac/constants.dart';
import 'package:salon_bac/screens/components/body_order_card.dart';



class OrderCard extends StatefulWidget {
  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar:buildAppBar(context),
      body: BodyOrderCard(),

    );
  }

  AppBar buildAppBar(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: IconButton(icon: SvgPicture.asset("assets/icons/back.svg",
        color: Colors.white,
        width: size.width * 0.07,
      ),
          onPressed: (){
            Navigator.pop(context);
          }),
      actions: [
        IconButton(icon: SvgPicture.asset("assets/icons/shopping-bag.svg"
          ,color: Colors.white,
          width: size.width * 0.07,
        ), onPressed: () {

          }
        ),
      ],
    );
  }
}


