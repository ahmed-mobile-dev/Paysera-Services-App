import 'package:flutter/material.dart';

import '../../constants.dart';

class ContainerTextField extends StatelessWidget {
  final String text;
  final bool isScure;
  final Icon icon;
  final ValueChanged<String> onChanged;
  final Icon suffixIcon;
  final TextInputType type;
  ContainerTextField({this.text,this.icon,this.onChanged,this.suffixIcon,this.isScure,this.type});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: kPrimaryLightColor),
      child: TextField(
        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
        keyboardType: type,
        obscureText: isScure,
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: "$text",
            icon: icon,
            border: InputBorder.none,
        suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
