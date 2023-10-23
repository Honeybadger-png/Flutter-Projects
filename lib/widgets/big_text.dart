import 'package:flutter/material.dart';
import 'package:parsley/constants/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  BigText({
    Key? key,
    this.color = const Color(0xFF00ff00),
    required this.text,
    this.size = 20,
    this.overflow = TextOverflow.ellipsis
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size==0?Dimensions.font20:size,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto'
      ),
    );
  }
}
