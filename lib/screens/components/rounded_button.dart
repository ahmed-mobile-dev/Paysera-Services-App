import 'package:flutter/material.dart';


class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color;
  final Color textColor;
  RoundedButton({this.text, this.press,this.color,this.textColor});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: FlatButton(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          onPressed: press,
          child: Text(
            "$text",
            style: TextStyle(color: textColor, fontSize: 17,fontWeight: FontWeight.bold,letterSpacing: 2),
          ),
          color: color,
        ),
      ),
    );
  }
}
