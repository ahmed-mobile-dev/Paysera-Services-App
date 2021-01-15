import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class reusable_card extends StatelessWidget {
  final String text;
  final String ImagePath;
  final Color color;
  final Function onPressed;
  reusable_card({this.text, this.ImagePath,this.color,this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(

              ImagePath,
              color: color,
              height: 75,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(

                  color: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
