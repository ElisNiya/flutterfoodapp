import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     body: CustomScrollView(
        slivers: [
           SliverAppBar(
             toolbarHeight:70, //so that the icons don't get smudged
             title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon:Icons.shopping_cart_outlined)
       ],
     ),
             bottom:PreferredSize( //to create a nav bar on bottom that is pinned 
               preferredSize: Size.fromHeight(20),
               child: Container(
                 color: Colors.white,
                 child: Center(child: BigText(size: Dimensions.font26,text:"Meal of the day")),
                 width:double.maxFinite,
                 padding: EdgeInsets.only(top:5, bottom:10),
               ),
             ),
             pinned: true, //to pin the img on scrolling so that its always visible
             backgroundColor: AppColors.yellowColor,
             expandedHeight: 300, //to see the img and be able to scroll the text expand it
           flexibleSpace: FlexibleSpaceBar(
               background: Image.asset("assets/image/food0.png",
               width:double.maxFinite,
               fit: BoxFit.cover,),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                margin:EdgeInsets.only(left:Dimensions.width20, right:Dimensions.width20),
                child: ExpandableTextWidget(
                      text:"In eu mauris dapibus, blandit augue vel, vestibulum nibh. Sed condimentum auctor nibh, nec consequat nibh ultricies sit amet. Integer tempor velit vel diam tincidunt, vitae consectetur sapien ullamcorper. Sed sit amet suscipit erat, at rutrum neque. Maecenas eu congue ex. Maecenas purus quam, rhoncus nec leo sit amet, dignissim vestibulum turpis. Integer cursus dignissim tortor nec euismod. Integer aliquam quis nibh et lacinia. Fusce ut tortor porttitor, ullamcorper risus non, porta lorem. Cras accumsan erat a magna pulvinar auctor. Duis pretium dolor nunc, a viverra nulla malesuada in. Pellentesque ullamcorper risus non, porta lorem. Cras accumsan erat a magna pulv volutpat fringilla lacinia. Etiam ut scelerisque augue. In eu mauris dapibus, blandit augue vel, vestibulum nibh.  Duis pretium dolor nunc, a viverra nulla malesuada in.  ullamcorper, turpis elit facilisis libero, quis fermentum lectus quam sit amet ligula. Vestibulum mattis lectus nec neque feugiat pellentesque nec id purus. Suspendisse nec urna ac velit aliquet consectetur."
                ),
                ),
              ],
            )
          )
        ],   // scroller disappears slowly
      ),
      bottomNavigationBar: Column( //not in a container so we have to use mainAxisSize to be visible
        mainAxisSize:MainAxisSize.min,
        children: [
          Container(
            padding:EdgeInsets.only(left: Dimensions.width20*2.5, right: Dimensions.width20*2.5, top:Dimensions.height10,bottom: Dimensions.height20),
            child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(iconSize: Dimensions.iconSize24, iconColor:Colors.white, backgroundColor: AppColors.mainColor,icon: Icons.remove),
                  BigText(text: "\$12.88 " + " X " " 0 ", color: AppColors.mainBlackColor, size: Dimensions.font26),
                  AppIcon(iconSize: Dimensions.iconSize24, iconColor:Colors.white, backgroundColor: AppColors.mainColor,icon:Icons.add),
                ]
              )
          ),
          Container(
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
                      child: Icon(Icons.favorite,
                        color: AppColors.mainColor),
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

        ],
      ),
    );
  }
}
