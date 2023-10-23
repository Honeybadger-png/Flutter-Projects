import 'package:flutter/material.dart';
import 'package:parsley/constants/colors.dart';
import 'package:parsley/constants/dimensions.dart';

class appIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundcolor;
  final Color iconColor;
  final double size;
  final double iconSize;
  const appIcon(
      {Key? key,
      required this.icon,
      this.backgroundcolor = const Color(0xFFfcf4e4),
      this.iconColor = const Color(0xFF756d54),
        this.iconSize = 16,
      this.size = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundcolor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize
      ),
    );
  }
}
