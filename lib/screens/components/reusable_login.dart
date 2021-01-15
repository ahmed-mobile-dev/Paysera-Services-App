import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salon_bac/constants.dart';

class ReusableLogin extends StatelessWidget {
  final String path;
  final Function onTap;
  ReusableLogin({this.path,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(shape: BoxShape.circle,
          border: Border.all(color:Color(0xFFD9D9D9),width: 3),
        ),
        child: SvgPicture.asset(path,height: 22,width: 22,color: kPrimaryColor,),
      ),
    );
  }
}