import 'package:flutter/material.dart';
import 'package:parsley/constants/dimensions.dart';
import 'package:parsley/widgets/app_icon.dart';
import 'package:parsley/widgets/big_text.dart';

class AccountWidget extends StatelessWidget {
  appIcon AppIcon;
  BigText bigText;
  AccountWidget({Key? key, required this.AppIcon, required this.bigText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: Dimensions.width20,
          top: Dimensions.width10,
          bottom: Dimensions.width10),
      child: Row(
        children: [
          AppIcon,
          SizedBox(width: Dimensions.width20,),
          bigText
        ],
      ),
      decoration: BoxDecoration(color: Colors.white,boxShadow: [
        BoxShadow(
          blurRadius: 1,
          offset: Offset(0, 2),
          color: Colors.grey.withOpacity(0.2)
        )
      ]),
    );
  }
}
