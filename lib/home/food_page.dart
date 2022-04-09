import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimens.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_with_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

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
        Container(
          height: Dimension.pageMainContainerHeight,

          //color: Colors.blue,
          child: PageView.builder(
              controller: pageController,
              itemCount: 4,
              itemBuilder: (context, position) {
                return _builPageItem(position);
              }),
        ),
        DotsIndicator(
          dotsCount: 4,
          position: _currantPageValue,

          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(15.0),
            activeSize: const Size(22.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }

  Widget _builPageItem(int position) {
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
          Container(
            margin: EdgeInsets.only( top:Dimension.spacingHeight10, bottom:Dimension.spacingHeight10,left: Dimension.spacingWidth5,right: Dimension.spacingWidth5),
            height: Dimension.pageViewContainerHeight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius30),
                color: position.isEven ? Color(0xFF69c5df) : Color(0xFF667898),
                image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "assets/image/food15.jpeg",
                    ))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height:Dimension.textViewContainerHeigt,
              margin: EdgeInsets.only(left:Dimension.spacingWidth30, right:Dimension.spacingWidth30 ,bottom:Dimension.spacingHeight10),
              padding: EdgeInsets.only(left: Dimension.spacingWidth15, top: Dimension.spacingHeight15, right:Dimension.spacingWidth15,bottom: Dimension.spacingHeight5),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  BigText(text: "Chinese Side"),
                  SizedBox(
                    height: Dimension.spacingHeight10,
                  ),
                  Row(
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
                        width: Dimension.spacingHeight10,
                      ),
                      SmallText(text: "4.5"),
                      SizedBox(
                        width: Dimension.spacingHeight10,
                      ),
                      SmallText(text: "22"),
                      SizedBox(
                        width: Dimension.spacingHeight10,
                      ),
                      SmallText(text: "Comments"),
                    ],
                  ),
                 Expanded(child: SizedBox()),
                  Row(
                    children: [
                      IconAndText(
                          icon: Icons.circle_sharp,
                          iconSize:Dimension.iconSize20,
                          text: "normal",
                          iconColor: AppColors.iconColor1),

                      SizedBox(
                        width:Dimension.spacingHeight10,
                      ),
                      IconAndText(
                          icon: Icons.location_on,
                          iconSize: Dimension.iconSize20,
                          text: "1.5 km",
                          iconColor: AppColors.iconColor1),
                      SizedBox(
                        width:Dimension.spacingHeight10,
                      ),
                      IconAndText(
                          icon: Icons.watch_later_outlined,
                          text: "32 min",
                          iconSize: Dimension.iconSize20,
                          iconColor: AppColors.iconColor2),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
