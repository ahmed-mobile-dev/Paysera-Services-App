import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';
class TextFieldOrder extends StatelessWidget {

  final String hint;
  final String title;
  final String iconPath;
  final Function function;

  TextFieldOrder({this.hint, this.title, this.iconPath,this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 30),
      child: TextFormField(
        onChanged: function,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 42,
            vertical: 20,
          ),
          hintText: hint,
          labelText: title,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: kPrimaryColor),
            gapPadding: 10,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: kPrimaryColor),
            gapPadding: 10,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              iconPath,
              height: 28,
              width: 28,
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
