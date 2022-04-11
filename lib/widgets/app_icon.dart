import 'package:flutter/cupertino.dart';

class  AppIcon extends StatelessWidget {
    final IconData icon;
    final Color iconColor;
    final double iconSize;
    final Color backGroundColor;
    final double backGroundSize;

    AppIcon({Key? key,required this.icon,this.iconColor=const Color(0xFF756d54),this.backGroundColor=const Color(0xFFfcf4e4), this.backGroundSize=40,required this.iconSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: backGroundSize,
      width: backGroundSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(backGroundSize/2),
        color: backGroundColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
