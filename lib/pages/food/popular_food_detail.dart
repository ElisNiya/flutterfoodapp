import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,  //scaffold has also a color, to make it blend use this
        body: Stack(
          children: [
            //Image
            Positioned(
              left: 0,
              right: 0,
              child:
            Container(
              width: double.maxFinite,
                height: Dimensions.popularFoodSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                      "assets/image/food0.png"
                    )
                  )
                ),

            ),
            ),
            //icons on header
            Positioned(
              top: Dimensions.height45,
                left: Dimensions.width20,
                right: Dimensions.width20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIcon(icon: Icons.arrow_back_ios),
                    AppIcon(icon: Icons.shopping_cart_outlined)

                  ]
                )
            ),
            //introduction of the food
            Positioned(
                left: 0,
                right: 0,
                bottom:0,
                top: Dimensions.popularFoodImgSize -20,  // so that the white box goes up and we see the border
                child: Container(
                  padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight:Radius.circular( Dimensions.radius20),
                        topLeft: Radius.circular(Dimensions.radius20),
                    ),
                    color: Colors.white
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(text:"Meal of the day"),
                      SizedBox(height: Dimensions.height20,),
                      BigText(text: "Ingredients"),
                      SizedBox(height: Dimensions.height20,),
                      Expanded(
                          child: SingleChildScrollView(  // doesn't work alone in a column needs to be wrapped in a widget
                              child: ExpandableTextWidget(text: "In eu mauris dapibus, blandit augue vel, vestibulum nibh. Sed condimentum auctor nibh, nec consequat nibh ultricies sit amet. Integer tempor velit vel diam tincidunt, vitae consectetur sapien ullamcorper. Sed sit amet suscipit erat, at rutrum neque. Maecenas eu congue ex. Maecenas purus quam, rhoncus nec leo sit amet, dignissim vestibulum turpis. Integer cursus dignissim tortor nec euismod. Integer aliquam quis nibh et lacinia. Fusce ut tortor porttitor, ullamcorper risus non, porta lorem. Cras accumsan erat a magna pulvinar auctor. Duis pretium dolor nunc, a viverra nulla malesuada in. Pellentesque ullamcorper risus non, porta lorem. Cras accumsan erat a magna pulv volutpat fringilla lacinia. Etiam ut scelerisque augue. In eu mauris dapibus, blandit augue vel, vestibulum nibh.  Duis pretium dolor nunc, a viverra nulla malesuada in.  ullamcorper, turpis elit facilisis libero, quis fermentum lectus quam sit amet ligula. Vestibulum mattis lectus nec neque feugiat pellentesque nec id purus. Suspendisse nec urna ac velit aliquet consectetur."))),
                    ]
                  )

            ),
            ),
            //expandable text widget

          ]
        ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30, right: Dimensions.width20, left: Dimensions.width20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20*2),
                topRight: Radius.circular(Dimensions.radius20*2),
          ),
        ),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Container(
               padding: EdgeInsets.all(Dimensions.height20),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(Dimensions.radius15),
                 color: Colors.white,
               ),
               child: Row(
                 children: [
                   Icon(Icons.remove, color: AppColors.signColor,),
                   SizedBox(width: Dimensions.width10/2,),
                   BigText(text: "0"),
                   SizedBox(width: Dimensions.width10/2,),
                   Icon(Icons.add, color: AppColors.signColor,)
                 ]
               )
             ),
             Container(
                 padding: EdgeInsets.all(Dimensions.height20),
                 child: BigText(text:"\$10| Add to cart", color: Colors.white),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(Dimensions.radius15),
                 color: AppColors.mainColor
               )
             )
           ],
         )
      ),
    );
  }
}
