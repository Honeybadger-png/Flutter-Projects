import 'package:get/get.dart';

class Dimensions{

  //826/ diye düzenlenicek
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight/2.64;
  static double pageViewContainer = screenHeight/3.84;
  static double pageViewTextContainer = screenHeight/7.03;

  //font size
  static double font26 = screenHeight/31.76;
// dynamic height and padding
  static double height10 = screenHeight/84.4;
  static double height15 = screenHeight/56.26;
  static double height20 = screenHeight/42.2;
  static double height30 = screenHeight/28.13;
  static double height40 = screenHeight/20.6;
  static double height45 = screenHeight/18.75;
// dynamic width
  static double width10 = screenWidth/39.3;
  static double width13 = screenWidth/30.2;
  static double width15 = screenWidth/26.2;
  static double width20 = screenWidth/19.65;
  static double width30 = screenWidth/13.1;
  static double width45 = screenWidth/8.73;

  static double font20 = screenHeight/42.2;
  static double font16 = screenHeight/51.5;
  static double font12 = screenHeight/68.8;

// iconSize
  static double iconSize24 = screenHeight/35.17;
  static double iconSize16 = screenHeight/52.75;

  static double radius15 = screenHeight/56.26;
  static double radius20 = screenHeight/42.2;
  static double radius30 = screenHeight/28.13;

  // list view size
  static double listViewImgSize = screenWidth/3.25;
  static double listViewTextContSize = screenWidth/3.9;
  // popular food
static double foodImgSize = screenHeight/2.36;
// bottom height
static double bottomHeightBar = screenHeight/6.88;

// splash screen image
static double splashImg  = screenHeight/3.35;

}