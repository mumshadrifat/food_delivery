import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controller/popular_product_controller/cart_controller.dart';
import 'package:food_delivery/controller/popular_product_controller/recommended_product_controller.dart';
import 'package:food_delivery/models/recommended_product_model.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimens.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text.dart';
import 'package:get/get.dart';

class RecommendedFoodDetails extends StatelessWidget {
  int pageId;

  RecommendedFoodDetails({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];

    Get.find<RecommendedProductController>()
        .initialData(product, Get.find<CartController>());

    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          //controller: controller,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            GetBuilder<RecommendedProductController>(
                builder: (recommendedFood) {
              return SliverAppBar(
                //automatically back button rise false
                automaticallyImplyLeading: false,
                toolbarHeight: Dimension.height30 * 2 + Dimension.height5,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getInitial());
                        },
                        child: AppIcon(
                            icon: Icons.clear, iconSize: Dimension.height20)),
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        AppIcon(
                            icon: Icons.add_shopping_cart_outlined,
                            iconSize: Dimension.iconSize20),
                        recommendedFood.totalQuantity >= 1
                            ? Positioned(
                                top: 0,
                                right: 0,
                                child: Icon(
                                  Icons.circle,
                                  color: AppColors.mainColor,
                                  size: Dimension.height20 - Dimension.height5,
                                ),
                              )
                            : Container(),
                        Positioned(
                            top: 2,
                            right: 4,
                            child: BigText(
                              text: recommendedFood.totalQuantity.toString(),
                              size: Dimension.height10,
                            ))
                      ],
                    ),
                  ],
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(20),
                  child: Container(
                      padding: EdgeInsets.only(
                          top: Dimension.height5, bottom: Dimension.height5),
                      width: double.maxFinite,
                      //margin: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimension.radius20),
                              topLeft: Radius.circular(Dimension.radius20)),
                          color: Colors.white),
                      child: BigText(
                        text: product.name,
                        size: Dimension.extraLargeFont,
                      )),
                ),
                pinned: true,
                backgroundColor: AppColors.yellowColor,
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    AppConstants.BASE_URL + AppConstants.Uploads + product.img,
                    fit: BoxFit.cover,
                    width: double.maxFinite,
                    //color: AppColors.yellowColor,
                  ),
                ),
              );
            }),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(
                    left: Dimension.width20, right: Dimension.width20),
                child: Center(
                  child: ExpandableText(text: product.description),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: GetBuilder<RecommendedProductController>(
            builder: (recommendedProducts) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  color: Colors.white,
                  //margin: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20),
                  padding: EdgeInsets.only(
                      top: Dimension.height10,
                      bottom: Dimension.height10,
                      left: Dimension.width30,
                      right: Dimension.width30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.buttonBackgroundColor,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              recommendedProducts.setQuantity(false);
                            },
                            child: AppIcon(
                              icon: Icons.remove,
                              iconSize: Dimension.iconSize24,
                              backGroundSize: 40,
                              backGroundColor: AppColors.mainColor,
                              iconColor: Colors.white,
                            ),
                          )),
                      BigText(
                        text:
                            "\$${product.price}  *  ${recommendedProducts.cartItems}",
                        size: Dimension.extraLargeFont,
                        color: AppColors.mainBlackColor,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.buttonBackgroundColor,
                          ),
                          child: InkWell(
                            onTap: () {
                              recommendedProducts.setQuantity(true);
                            },
                            child: AppIcon(
                              icon: Icons.add,
                              iconSize: Dimension.iconSize24,
                              backGroundSize: 40,
                              backGroundColor: AppColors.mainColor,
                              iconColor: Colors.white,
                            ),
                          )),
                    ],
                  )),
              Container(
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
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                        size: Dimension.height30,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        recommendedProducts.addItem(product);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            left: Dimension.width20,
                            right: Dimension.width20,
                            top: Dimension.height20,
                            bottom: Dimension.height20),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimension.radius20),
                          color: AppColors.mainColor,
                        ),
                        child: BigText(
                          text: "\$ ${product.price} |  add to cart",
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
