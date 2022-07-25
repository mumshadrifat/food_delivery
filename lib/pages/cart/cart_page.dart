import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimens.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: Dimension.width20,
              right: Dimension.width20,
              top: Dimension.height45 - Dimension.height5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(RouteHelper.initial);
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconSize: Dimension.iconSize24,
                      iconColor: AppColors.iconColor2,
                    ),
                  ),
                  SizedBox(
                    width: Dimension.width20 * Dimension.height5,
                  ),
                  AppIcon(
                    icon: Icons.home,
                    iconSize: Dimension.iconSize24,
                    iconColor: AppColors.iconColor2,
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart,
                    iconSize: Dimension.iconSize24,
                    iconColor: AppColors.iconColor2,
                  ),
                ],
              )),
          Positioned(
              top: 75,
              left: 20,
              right: 20,
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                color: Colors.red,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => Container(
                    height: 100,
                    margin: EdgeInsets.only(top: 10),
                    width: 120,
                    //color: Colors.black,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image: AssetImage(
                                      'assets/image/food0.png',
                                    )))),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(text: "Bitter Orange Juice",),
                            SmallText(text: 'Spicy'),
                            Row(

                              children: [

                              BigText(text: '\$ 33.0'),
                             SizedBox(width: 80 ,),
                                Row(

                                  children: [
                                    GestureDetector(
                                        child: Icon(Icons.remove ),
                                        onTap: () {
                                          //popularProduct.setQuantity(false);
                                        }),
                                    SizedBox(
                                      width: Dimension.width10,
                                    ),
                                    BigText(text: '0'),
                                    SizedBox(
                                      width: Dimension.width10,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                         // popularProduct.setQuantity(true);
                                        },
                                        child: Icon(Icons.add)),
                                  ],
                                ),
                            ],)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
