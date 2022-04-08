import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery/utils/colors.dart';
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
  var height = 220;

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
    return Container(
      height: 285,

      //color: Colors.blue,
      child: PageView.builder(
          controller: pageController,
          itemCount: 4,
          itemBuilder: (context, position) {
            return _builPageItem(position);
          }),
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
            margin: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
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
              height: 120,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
              padding: EdgeInsets.only(left: 15, top: 15, right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Chinese Side"),
                  SizedBox(
                    height: 10,
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
                        width: 10,
                      ),
                      SmallText(text: "4.5"),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(text: "22"),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(text: "Comments"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      IconAndText(
                          icon: Icons.circle_sharp,
                          text: "normal",
                          iconColor: AppColors.iconColor1),
                      SizedBox(
                        width: 10,
                      ),
                      IconAndText(
                          icon: Icons.location_on,
                          text: "1.5 km",
                          iconColor: AppColors.iconColor1),
                      SizedBox(
                        width: 10,
                      ),
                      IconAndText(
                          icon: Icons.watch_later_outlined,
                          text: "32 min",
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
