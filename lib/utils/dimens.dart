import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';
class Dimension{
static final double screenHeight=Get.context!.height;
static final double screenWidth=Get.context!.width;
//========>Food page container
static final double searchContainerHeight=screenHeight/(screenHeight/45);
static final double searchContainerWidth=screenHeight/(screenHeight/45);

static final double pageMainContainerHeight=screenHeight/2.64;
static final double  pageViewContainerHeight=screenHeight/3.84;
static final double textViewContainerHeigt=screenHeight/7.03;

//============>Icon sizes
static final double  iconSize20=screenHeight/(screenHeight/20);
  static final double  iconSize24 =screenHeight/(screenHeight/24);
static final double IconSizeLarge=28;


//=====================>Spacing height
static final double height5=screenHeight/(screenHeight/5);
static final double height10=screenHeight/(screenHeight/10);
static final double height15=screenHeight/(screenHeight/15);
static final double height20=screenHeight/(screenHeight/20);
static final double height30=screenHeight/(screenHeight/30);
static final double height45=screenHeight/(screenHeight/45);


  // ==============>spacing width
  static final double width5=screenWidth/(screenWidth/5);
  static final double width10=screenWidth/(screenWidth/10);
  static final double width15=screenWidth/(screenWidth/15);
  static final double width20=screenWidth/(screenWidth/20);
  static final double width30=screenWidth/(screenWidth/30);



//================>font size

static final double smallFont=screenHeight/(screenHeight/10);
static final double mediumFont=screenHeight/(screenHeight/16);
static final double largeFont=screenHeight/(screenHeight/20);

//Radius
  static final double radius15=screenHeight/(screenHeight/15);
static final double radius20=screenHeight/(screenHeight/20);
static final double radius30=screenHeight/(screenHeight/30);
//Listview size
static final double listViewImageHeight=screenHeight/(screenHeight/110);
static final double listViewImageWidth=screenWidth/(screenWidth/110);
static final double listViewTextContainerHeight=screenHeight/(screenHeight/90);



}
