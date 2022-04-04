import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';

class MyFoodPage extends StatefulWidget {
  const MyFoodPage({Key? key}) : super(key: key);

  @override
  State<MyFoodPage> createState() => _MyFoodPageState();
}

class _MyFoodPageState extends State<MyFoodPage> {
  PageController pageController = PageController(viewportFraction: 1.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 285,
      width: 350,
      //color: Colors.blue,
      margin: EdgeInsets.only(right: 5),
      child: PageView.builder(
          controller: pageController,
          itemCount: 4,
          itemBuilder: (context, position) {
            return _builPageItem(position);
          }),
    );
  }

  Widget _builPageItem(int position) {
    return Stack(
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
                    "assets/image/food0.png",
                  ))),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            width: 330,
            margin: EdgeInsets.only(left: 40, right: 40, bottom: 15),
            padding: EdgeInsets.only(left: 15, top: 15),
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
                    Wrap(
                      children: [
                        Icon(
                          Icons.star,
                          size: 15,
                          color: AppColors.mainColor,
                        ),
                        Icon(
                          Icons.star,
                          size: 15,
                          color: AppColors.mainColor,
                        ),
                        Icon(
                          Icons.star,
                          size: 15,
                          color: AppColors.mainColor,
                        ),
                        Icon(
                          Icons.star,
                          size: 15,
                          color: AppColors.mainColor,
                        ),
                        Icon(
                          Icons.star,
                          size: 15,
                          color: AppColors.mainColor,
                        ),

                        // List.generate(5, (index) {return Icon(Icons.star,color: AppColors.mainColor,size: 15,)})
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
