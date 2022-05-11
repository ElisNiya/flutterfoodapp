import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;

  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandableTextWidgetState createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText= true;  // hide the overflow
  double textBoxHeight = Dimensions.screenHeight/5.63;  // ca 100px

  @override
  void initState(){   //to check the text length
    super.initState();
    if(widget.text.length > textBoxHeight){
      firstHalf = widget.text.substring(0, textBoxHeight.toInt());  //the shown text- starts from 0 and cuts up to textBoxHeight
      secondHalf = widget.text.substring(textBoxHeight.toInt() +1, widget.text.length); //the hidden text
    } else {
      firstHalf = widget.text;
      secondHalf=""; //have to initialize it if it is "late" variable
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(color: AppColors.paraColor,size:Dimensions.font16,text:firstHalf):Column(
        children: [
          SmallText(height:1.8, color: AppColors.paraColor, size:Dimensions.font16, text: hiddenText ? (firstHalf+"..."): (firstHalf+ secondHalf)),
          InkWell(
            onTap:(){
          setState(() {
            hiddenText = !hiddenText;
          });
            },
            child: Row(
    children:[
      SmallText(text:"Show more", color: AppColors.mainColor),
      Icon(hiddenText?Icons.arrow_drop_down : Icons.arrow_drop_up, color: AppColors.mainColor)
            ]
            ),
          )
        ]
      )
    );
  }
}
