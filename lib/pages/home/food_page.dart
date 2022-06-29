import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery/controller/popular_product_controller/recommended_product_controller.dart';
import 'package:food_delivery/pages/food/popular_food_details.dart';
import 'package:food_delivery/pages/food/recommended_food.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimens.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_with_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../controller/popular_product_controller/popular_product_controller.dart';
import '../../models/popular_product_model.dart';
import '../../widgets/app_column.dart';

class MyFoodPage extends StatefulWidget {
  const MyFoodPage({Key? key}) : super(key: key);

  @override
  State<MyFoodPage> createState() => _MyFoodPageState();
}

class _MyFoodPageState extends State<MyFoodPage> {
  PageController pageController = PageController(viewportFraction: .80);
  var _currantPageValue = 0.0;
  var height = Dimension.pageViewContainerHeight;

  var scaleFactor = 0.9;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currantPageValue = pageController.page!;
        print("current value is" + _currantPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //=========================================================>food items slider view and textview
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? Container(
                  height: Dimension.pageMainContainerHeight,

                  //color: Colors.blue,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProducts.popularProductList.length,
                      itemBuilder: (context, position) {
                        return _builPageItem(position,
                            popularProducts.popularProductList[position]);
                      }),
                )
              : CircularProgressIndicator();
        }),
        //======================================================================>Dots Idicator
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.length.isEqual(0)
                ? 1
                : popularProducts.popularProductList.length,
            position: _currantPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(15.0),
              activeSize: const Size(22.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        SizedBox(
          height: Dimension.height30,
        ),
        //==========================================================================>P0pular category and food pair
        Container(
          margin: EdgeInsets.only(
              left: Dimension.width20, right: Dimension.width20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(
                width: Dimension.width10,
              ),
              BigText(text: "."),
              SizedBox(
                width: Dimension.width10,
              ),
              SmallText(
                text: "Food pairing",
                color: AppColors.mainColor,
              ),
            ],
          ),
        ),
        SizedBox(
          height: Dimension.height30,
        ),

        //=========================================================================>ListView

        GetBuilder<RecommendedProductController>(
          builder: (recommendedProducts) {
            return recommendedProducts.isLoaded
                ? ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        recommendedProducts.recommendedProductList.length,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.getRecommendedFood(index));
                          },
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: Dimension.width20,
                                  right: Dimension.width20,
                                  bottom: Dimension.height10),
                              child: Row(
                                children: [
                                  Container(
                                    height: Dimension.listViewImageHeight,
                                    width: Dimension.listViewImageWidth,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Dimension.radius20),
                                        color: Colors.white12,
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              AppConstants.BASE_URL +
                                                  "/uploads/" +
                                                  recommendedProducts
                                                      .recommendedProductList[
                                                          index]
                                                      .img!

                                              // 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'
                                              ),
                                        )),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          right: Dimension.width20),
                                      padding: EdgeInsets.only(
                                          right: Dimension.width5),
                                      height:
                                          Dimension.listViewTextContainerHeight,

                                      //  margin: EdgeInsets.only(top: Dimension.height20,bottom: Dimension.height20),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(
                                                Dimension.radius15),
                                            topRight: Radius.circular(
                                                Dimension.radius15)),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: Dimension.width10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            BigText(
                                                text: recommendedProducts
                                                    .recommendedProductList[
                                                        index]
                                                    .name),
                                            SizedBox(
                                              height: Dimension.height10,
                                            ),
                                            SmallText(
                                                text:
                                                    "With chinese characterstics "),
                                            SizedBox(
                                              height: Dimension.height10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                IconAndText(
                                                    icon: Icons.circle,
                                                    text: "Normal",
                                                    iconColor:
                                                        AppColors.iconColor1),
                                                IconAndText(
                                                    icon: Icons.location_on,
                                                    text: "1.2 km ",
                                                    iconColor:
                                                        AppColors.iconColor1),
                                                IconAndText(
                                                    icon: Icons
                                                        .watch_later_outlined,
                                                    text: "12 min",
                                                    iconColor:
                                                        AppColors.iconColor2),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ))
                : CircularProgressIndicator(
                    color: AppColors.mainColor,
                  );
          },
        )
      ],
    );
  }

  Widget _builPageItem(
    int position,
    ProductsModel popularProduct,
  ) {
    Matrix4 matrix = new Matrix4.identity();
    if (position == _currantPageValue.floor()) {
      var currentScale = 1 - (_currantPageValue - position) * (1 - scaleFactor);
      var currTrans = height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (position == _currantPageValue.floor() + 1) {
      var currentScale = 0.8;
      var currTrans = height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (position == _currantPageValue.floor() - 1) {
      var currentScale = 0.8;
      var currTrans = height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currentScale = 0.8;
      var currTrans = height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: (){
              Get.toNamed(RouteHelper.getPopularFood(position));
            },
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimension.height10,
                  left: Dimension.width5,
                  right: Dimension.width5),
              height: Dimension.pageViewContainerHeight,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius30),
                  color: position.isEven ? Color(0xFF69c5df) : Color(0xFF667898),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(AppConstants.BASE_URL +
                          "/uploads/" +
                          popularProduct.img!))),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimension.textViewContainerHeigt + Dimension.height10,
              margin: EdgeInsets.only(
                  left: Dimension.width30,
                  right: Dimension.width30,
                  bottom: Dimension.height10),
              padding: EdgeInsets.only(
                left: Dimension.width15,
                top: Dimension.height15,
                right: Dimension.width15,
                bottom: Dimension.height10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    offset: Offset(0, 5),
                    blurRadius: 0.5,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                    blurRadius: 0.8,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                    blurRadius: 0.8,
                  ),
                ],
              ),
              child: AppColumn(text: popularProduct.name!),
            ),
          )
        ],
      ),
    );
  }
}
