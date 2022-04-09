import 'package:flutter/cupertino.dart';
import 'package:food_delivery/utils/dimens.dart';

class BigText extends StatelessWidget {
  Color? color;
  String text;
  double size;
  TextOverflow overflow;

   BigText(
      {Key? key,
      this.color=const Color(0xFF332d2b),
      required this.text,
      this.size = 20,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        fontSize: Dimension.largeFont,
        fontFamily:'Roboto' ,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}
