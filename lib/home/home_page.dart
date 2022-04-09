import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/home/food_page.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimens.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    print("height of this phone is"+MediaQuery.of(context).size.height.toString());
    print("screen height"+Dimension.pageViewContainerHeight.toString());
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Container(
            //color: Colors.blue,
            margin: EdgeInsets.only(top: Dimension.spacingHeight20,bottom: Dimension.spacingHeight15),
            padding: EdgeInsets.only(left: Dimension.spacingWidth20,right: Dimension.spacingWidth20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                          text: "Bangladesh",
                          color: AppColors.mainColor,
                          size: Dimension.largeFont,
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: "City",
                              //color:AppColors.mainColor,
                            ),
                            Icon(Icons.arrow_drop_down),
                          ],
                        )
                        //BigText(text: "City",color: AppColors.mainBlackColor,size: 20,)
                      ],
                    ),
                    Center(
                      child: Container(
                        height: Dimension.searchContainerHeight,
                        width: Dimension.searchContainerWidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimension.radius15),
                            color: AppColors.mainColor),
                        child: Icon(Icons.search,size: Dimension.iconSize24,
                            color: AppColors.buttonBackgroundColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          MyFoodPage(),
        ],
      )),
    );
  }
}
