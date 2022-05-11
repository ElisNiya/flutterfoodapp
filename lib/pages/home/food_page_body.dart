import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/get.dart';

import '../../widgets/big_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue= 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;


  @override // to cancel out default
  void initState(){
    super.initState();
        pageController.addListener(() {
          setState(() {
            _currPageValue= pageController.page!;
          });
        });
  }

  @override
  void dispose(){
    pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       //slider section
        GetBuilder<PopularProductController>(builder:(popularProducts){
          return Container(
            height: Dimensions.PageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: 5,
                itemBuilder: (context, position){
                  return _buildPageItem(position);
                }),
          );

        }),
        //dots slider
        new DotsIndicator(
        dotsCount: 5,
        position: _currPageValue,
        decorator: DotsDecorator(
        activeColor: AppColors.mainColor,
        size: const Size.square(9.0),
        activeSize: const Size(18.0, 9.0),
        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        //Popular meals text
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom:3),
                child: BigText(text: ".", color: Colors.black26),
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom:2),
                child: SmallText(text: "Food pairing",),
              )
            ],
          ),
        ),
        // Column list of Food
         ListView.builder(   // list should be wrapped in container with size - needed from parent column at first and can be deleted after done
          physics: NeverScrollableScrollPhysics(),   //so that entire screen is scrollable, not only the column list
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
                margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
                child: Row(
                    children: [
                      Container(
                          width: Dimensions.listViewImgSize,
                          height: Dimensions.listViewImgSize,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                              color:Colors.white38,
                              image: DecorationImage(
                                  image: AssetImage(
                                    "assets/image/food0.png",
                                  )
                              )
                          )
                      ),

                      Expanded(
                        child: Container(
                            height: Dimensions.listViewTextContSize,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.radius20),
                                bottomRight: Radius.circular(Dimensions.radius20),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                                padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center
                                    ,
                                    children: [
                                      BigText(text:"Nutritious fruit meal in China"),
                                      SizedBox(height: Dimensions.height10,),
                                      SmallText(text: "With a pinch of summer",),
                                      SizedBox(height: Dimensions.height10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconAndTextWidget(
                                            icon: Icons.circle_sharp,
                                            text: "Normal",
                                            iconColor: AppColors.iconColor1,
                                          ),
                                          IconAndTextWidget(
                                            icon: Icons.location_on,
                                            text: "1.7km",
                                            iconColor: AppColors.mainColor,
                                          ),
                                          IconAndTextWidget(
                                            icon: Icons.access_time_rounded,
                                            text: "Normal",
                                            iconColor: AppColors.iconColor2,
                                          ),
                                        ],
                                      ),

                                    ]
                                )
                            )
                        ),
                      ),

                    ]
                )
            );
          },
        ),

      ],
    );
  }

  Widget _buildPageItem(int index){
    Matrix4 matrix = new Matrix4.identity();
    if(index== _currPageValue.floor()){
      var currScale= 1-(_currPageValue - index)*(1- _scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);    //x,y,z pass the currScale to the matrix
    }else if(index == _currPageValue.floor() +1){  //the one on the right
      var currScale = _scaleFactor + (_currPageValue - index + 1) * (1-_scaleFactor);  //0.8 + 1-2+1 (0) *
      var currTrans = _height*(1-currScale)/2;  //  220* 1-0.8/2 (1/10)
      matrix = Matrix4.diagonal3Values(1, currScale, 1);    //x,y,z pass the currScale to the matrix
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);    //x,y,z pass the currScale to the matrix

    }else if(index == _currPageValue.floor() -1){  //the one on the right
      var currScale= 1-(_currPageValue - index)*(1- _scaleFactor);
      var currTrans = _height*(1-currScale)/2;  //  220* 1-0.8/2 (1/10)
      matrix = Matrix4.diagonal3Values(1, currScale, 1);    //x,y,z pass the currScale to the matrix
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);    //x,y,z pass the currScale to the matrix

    }else {
      var currScale=0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);    //x,y,z pass the currScale to the matrix

    }
    
    return Transform(
      transform: matrix,  // to pass on the 0.8 change transformation of img on left and right
      child: Stack(
        children: [
          Container(   //child container takes all the space of the parent container if not put in stack
          height: Dimensions.pageViewContainer,
          margin: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    "assets/image/food0.png"
                )
            ),
          ),
        ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(   //child container takes all the space of the parent container if not put in stack
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),  //-5,-5 -will be on top and left
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),  //-5,-5 -will be on top and left
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),  //-5,-5 -will be on top and left
                  )
                ]

              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15, left: 15, right: 15),
                child: AppColumn(text:"Meal of the day"),
              )
            ),
          ),

        ]
      ),
    );
  }
}
