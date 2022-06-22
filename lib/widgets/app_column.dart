import 'package:food_delivery/utils/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../utils/colors.dart';
import 'big_text.dart';
import 'icon_with_text.dart';

class AppColumn extends StatelessWidget {
  final String text;

  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimension.extraLargeFont,
        ),
        SizedBox(
          height: Dimension.height10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /*  RatingBar.builder(

                                  itemBuilder: (context, _) => Icon(Icons.star),
                                  minRating: 1,
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  }),*/
            RatingBarIndicator(
              itemBuilder: (context, index) => Icon(Icons.star),
              itemCount: 5,
              itemSize: 20,
            ),
            SizedBox(
              width: Dimension.height10,
            ),
            SmallText(text: "4.5"),
            SizedBox(
              width: Dimension.height10,
            ),
            SmallText(text: "22"),
            SizedBox(
              width: Dimension.height10,
            ),
            SmallText(text: "Comments"),
          ],
        ),
        SizedBox(
          height: Dimension.height10,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconAndText(
                  icon: Icons.circle_sharp,
                  iconSize: Dimension.iconSize20,
                  text: "normal",
                  iconColor: AppColors.iconColor1),
              SizedBox(
                width: Dimension.height10,
              ),
              IconAndText(
                  icon: Icons.location_on,
                  iconSize: Dimension.iconSize20,
                  text: "1.5 km",
                  iconColor: AppColors.iconColor1),
              SizedBox(
                width: Dimension.height10,
              ),
              IconAndText(
                  icon: Icons.watch_later_outlined,
                  text: "32 min",
                  iconSize: Dimension.iconSize20,
                  iconColor: AppColors.iconColor2),
            ],

          ),
        ),

      ],
    );
  }
}
