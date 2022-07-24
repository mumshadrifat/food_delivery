import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery/controller/popular_product_controller/cart_controller.dart';
import 'package:food_delivery/controller/popular_product_controller/popular_product_controller.dart';
import 'package:food_delivery/pages/home/food_page.dart';
import 'package:food_delivery/pages/home/home_page.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/dimens.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/expandable_text.dart';

import '../../utils/colors.dart';
import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_with_text.dart';
import '../../widgets/small_text.dart';
import 'package:get/get.dart';

class PopularFoodDetails extends StatelessWidget {
  int pageId;

  PopularFoodDetails({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initialData(product, Get.find<CartController>());

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
                    image: NetworkImage(
                      AppConstants.BASE_URL + "/uploads/" + product.img!,
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
                      GestureDetector(
                        onTap: () {
                          Get.to(MyHomePage());
                        },
                        child: AppIcon(
                            icon: Icons.arrow_back_ios,
                            iconSize: Dimension.iconSize20),
                      ),
                      GetBuilder<PopularProductController>(
                          builder: (controller) {
                        return Stack(
                          alignment: Alignment.topRight,
                          children: [
                            AppIcon(
                                icon: Icons.add_shopping_cart_outlined,
                                iconSize: Dimension.iconSize20),
                            controller.totalQuantity >= 1
                                ? Positioned(top:0,right: 0,child:Icon(Icons.circle,color:AppColors.mainColor ,size:Dimension.height20-Dimension.height5,),)
                                : Container(),
                            Positioned(
                              top:2,
                                right: 4,
                                child:BigText(
                              text: controller.totalQuantity.toString(),
                              size: Dimension.height10,
                            ))
                          ],
                        );
                      })
                    ],
                  )),
              //========================================>Introduction
              Positioned(
                  left: 0,
                  right: 0,
                  top: Dimension.popularPageImageHeight - 30,
                  bottom: 0,
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
                          child: AppColumn(text: product.name),
                        ),
                        SizedBox(
                          height: Dimension.height30,
                        ),
                        BigText(text: "Introduction"),
                        SizedBox(
                          height: Dimension.height20,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: ExpandableText(text: product.description)),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
          bottomNavigationBar:
              GetBuilder<PopularProductController>(builder: (popularProduct) {
            return Container(
              padding: EdgeInsets.only(
                  left: Dimension.width20,
                  right: Dimension.width20,
                  top: Dimension.height30,
                  bottom: Dimension.height30),
              height: Dimension.bottomBarHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimension.radius20 * 2),
                    topRight: Radius.circular(Dimension.radius20 * 2)),
                color: AppColors.buttonBackgroundColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: Dimension.width20,
                        right: Dimension.width20,
                        top: Dimension.height20,
                        bottom: Dimension.height20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radius20),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            child: Icon(Icons.remove),
                            onTap: () {
                              popularProduct.setQuantity(false);
                            }),
                        SizedBox(
                          width: Dimension.width10,
                        ),
                        BigText(text: popularProduct.cartItems.toString()),
                        SizedBox(
                          width: Dimension.width10,
                        ),
                        GestureDetector(
                            onTap: () {
                              popularProduct.setQuantity(true);
                            },
                            child: Icon(Icons.add)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      popularProduct.addItem(product);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: Dimension.width20,
                          right: Dimension.width20,
                          top: Dimension.height20,
                          bottom: Dimension.height20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimension.radius20),
                        color: AppColors.mainColor,
                      ),
                      child: BigText(
                        text: "\$ ${product.price} |  add to cart",
                      ),
                    ),
                  )
                ],
              ),
            );
          })),
    );
  }
}
