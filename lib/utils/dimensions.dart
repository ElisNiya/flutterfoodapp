import 'package:get/get.dart';

class Dimensions{
  static double screenHeight = Get.context!.height;  //to get access to height
  static double screenWidth = Get.context!.width;
//big container
  static double PageView = screenHeight/2.64;   //844/320

  static double pageViewContainer = screenHeight/3.84;   //device height / element size 844/220
  static double pageViewTextContainer = screenHeight/7.03;   //844/120

//dynamic height
  static double height10 = screenHeight/ 84.4;
  static double height15 = screenHeight/ 56.27;
  static double height20 = screenHeight/ 42.2;
  static double height30 = screenHeight/ 28.13;
  static double height45 = screenHeight/ 18.76;


//dynamic width
  static double width10 = screenHeight/ 84.4;
  static double width15 = screenHeight/ 56.27;
  static double width20 = screenHeight/ 42.2;
  static double width30 = screenHeight/ 28.13;
  static double width45 = screenHeight/ 18.76;

// font
  static double font16 = screenHeight/52.75;
  static double font20 = screenHeight/42.2;
  static double font26 = screenHeight/32.46;

//radius on the box-border
  static double radius15 = screenHeight/ 56.27;
  static double radius20 = screenHeight/ 42.2;
  static double radius30 = screenHeight/ 28.13;

// icons
  static double iconSize24 = screenHeight/ 35.17;   //844/24
  static double iconSize16 = screenHeight/ 52.75;   //844/24


//list view size
  static double listViewImgSize = screenWidth/ 3.25;
  static double listViewTextContSize = screenWidth/3.9;

  //popular food
  static double popularFoodSize = screenHeight/2.41;   // 250
  static double popularFoodImgSize = screenHeight/2.41;   // 250

// bottom height
static double bottomHeightBar = screenHeight/7.03;
}