import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/home/food_page.dart';
import 'package:food_delivery/utils/colors.dart';
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
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
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
                          size: 20,
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: "City",
                              color: Colors.black,
                            ),
                            Icon(Icons.arrow_drop_down),
                          ],
                        )
                        //BigText(text: "City",color: AppColors.mainBlackColor,size: 20,)
                      ],
                    ),
                    Center(
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.mainColor),
                        child: Icon(Icons.search,
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
