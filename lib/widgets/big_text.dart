import 'package:flutter/cupertino.dart';
import 'package:food_delivery/utils/dimensions.dart';


class BigText extends StatelessWidget {
  Color? color;  //will pass variable cuz its not a constant
  final String text;
  double size;
  TextOverflow overFlow;  // to make ... when text is long for the screen
  BigText({Key? key,
  this.color = const Color(0xFF332d2b),
  required this.text,
    this.size= 0,
  this.overFlow=TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(color: color,
      fontSize: size==0 ? Dimensions.font20 : size,
      fontWeight: FontWeight.w400),
    );
  }
}
