import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery/utils/dimens.dart';
import 'package:food_delivery/widgets/app_icon.dart';

import '../../utils/colors.dart';
import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_with_text.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            //=======================================>Image view
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimension.popularPageImageHeight,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    "assets/image/burger.jpg",
                  ),
                  fit: BoxFit.cover,
                )),
              ),
            ),
            //========================================>Icon of back button and cart
            Positioned(
                top: Dimension.height30,
                left: Dimension.width20,
                right: Dimension.width20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppIcon(
                        icon: Icons.arrow_back_ios,
                        iconSize: Dimension.iconSize16),
                    AppIcon(
                        icon: Icons.add_shopping_cart_outlined,
                        iconSize: Dimension.iconSize16),
                  ],
                )),
            //========================================>Introduction
            Positioned(
                left: 0,
                right: 0,
                top: Dimension.popularPageImageHeight - 30,
                child: Container(
                  height: Dimension.popularTextContainerHeight,
                  width: 370,
                  padding: EdgeInsets.only(
                      left: Dimension.width20,
                      right: Dimension.width20,
                      top: Dimension.height30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimension.height20),
                        topLeft: Radius.circular(Dimension.height20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: Dimension.height100,
                        width: double.maxFinite,
                        //margin: EdgeInsets.only(right: Dimension.width20),
                        child: AppColumn(text: "Burger"),
                      ),
                      SizedBox(
                        height: Dimension.height30,
                      ),
                      BigText(text: "Introduction"),

                    ],
                  ),
                ))
          ],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height30,bottom: Dimension.height30),
          height: Dimension.bottomBarHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft:Radius.circular(Dimension.radius20*2) ,topRight:Radius.circular(Dimension.radius20*2) ),
            color: AppColors.buttonBackgroundColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(

                padding: EdgeInsets.only(left:Dimension.width20,right:Dimension.width20,top: Dimension.height20,bottom: Dimension.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius20),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.remove),
                    BigText(text: "0"),
                    Icon(Icons.add),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left:Dimension.width20,right:Dimension.width20,top: Dimension.height20,bottom: Dimension.height20),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius20),
                  color: AppColors.mainColor,
                ),
                child: BigText(text: "\$ 10 |  add to cart",),
              )
            ],
          ),
        ),
      ),
    );
  }
}
