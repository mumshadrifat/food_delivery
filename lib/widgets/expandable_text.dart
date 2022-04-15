import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimens.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:food_delivery/widgets/small_text2.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;
    bool hiddenText = true;
   double textHeight = Dimension.height100+30 ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt()+20);
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText2(text: firstHalf,color: AppColors.paraColor,)
          : Column(
              children: [
                SmallText2(color: AppColors.paraColor,
                    text:hiddenText?firstHalf+".....": firstHalf+secondHalf),
                GestureDetector(
                  onTap: (){

                    setState(() {
                      if(hiddenText==true){
                        hiddenText=false;
                      }
                      else{
                        hiddenText=true;
                      }
                    });
                  },
                  child: Row(
                    children: [
                      SmallText2(color:AppColors.paraColor,text: "See more"),
                      Icon(hiddenText?
                        Icons.arrow_drop_down:Icons.arrow_drop_up,color: AppColors.mainColor,
                      ),

                    ],
                  ),
                )
              ],
            ),
    );
  }
}
