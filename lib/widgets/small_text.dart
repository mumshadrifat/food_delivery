import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  Color? color;
  String text;
  double size;
  double height;
  TextOverflow overflow;


  SmallText(
      {Key? key,
        this.color=const Color(0xFF332d2b),
        required this.text,
        this.size = 12,
        this.height=1.2,
        this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
          fontSize: size,
          fontFamily:'Roboto' ,
          fontWeight: FontWeight.w400,
          height: height,
      ),
    );
  }
}
