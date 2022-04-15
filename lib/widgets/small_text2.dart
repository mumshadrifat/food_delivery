
import 'dart:ui';
import 'package:food_delivery/utils/dimens.dart';
import 'package:flutter/cupertino.dart';

class SmallText2 extends StatelessWidget {
  Color? color;
  String text;
  double size;
  double height;

  SmallText2(
      {Key? key,
        this.color=const Color(0xFF332d2b),
        required this.text,
        this.size = 16,
        this.height=1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize:size,
        fontFamily:'Roboto' ,
        fontWeight: FontWeight.w400,
        height: height,
        color: color,
      ),
    );
  }
}