import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';
class Dimension{
static final double screrenHeight=Get.context!.height;
static final double screenWidth=Get.context!.width;
//========>Food page container
static final double searchContainerHeight=screrenHeight/(screrenHeight/45);
static final double searchContainerWidth=screrenHeight/(screrenHeight/45);

static final double pageMainContainerHeight=screrenHeight/2.64;
static final double  pageViewContainerHeight=screrenHeight/3.84;
static final double textViewContainerHeigt=screrenHeight/7.03;

//============>Icon sizes
static final double  iconSize20=screrenHeight/(screrenHeight/20);
  static final double  iconSize24 =screrenHeight/(screrenHeight/24);
static final double IconSizeLarge=28;


//=====================>Spacing height
static final spacingHeight5=screrenHeight/(screrenHeight/5);
static final double spacingHeight10=screrenHeight/(screrenHeight/10);
static final double spacingHeight15=screrenHeight/(screrenHeight/15);
static final double spacingHeight20=screrenHeight/(screrenHeight/20);
static final double spacingHeight30=screrenHeight/(screrenHeight/30);
static final double spacingHeight45=screrenHeight/(screrenHeight/45);


  // ==============>spacing width
  static final spacingWidth5=screenWidth/(screenWidth/5);
  static final double spacingWidth10=screenWidth/(screenWidth/10);
  static final double spacingWidth15=screenWidth/(screenWidth/15);
  static final double spacingWidth20=screenWidth/(screenWidth/20);
  static final double spacingWidth30=screenWidth/(screenWidth/30);



//================>font size

static final double smallFont=screrenHeight/(screrenHeight/10);
static final double mediumFont=screrenHeight/(screrenHeight/16);
static final double largeFont=screrenHeight/(screrenHeight/20);

//Radius
  static final double radius15=screrenHeight/(screrenHeight/15);
static final double radius20=screrenHeight/(screrenHeight/20);
static final double radius30=screrenHeight/(screrenHeight/30);
//margin padding


}
