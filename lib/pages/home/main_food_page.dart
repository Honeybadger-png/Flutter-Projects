import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parsley/constants/colors.dart';
import 'package:parsley/constants/dimensions.dart';
import 'package:parsley/pages/home/food_page_body.dart';
import 'package:parsley/widgets/big_text.dart';
import 'package:parsley/widgets/small_text.dart';
class MainFoodPage extends StatefulWidget {
  const MainFoodPage();

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  var datetime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: Dimensions.height45,bottom: Dimensions.height15),
            padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    BigText(text: DateFormat().add_MMMMEEEEd().format(datetime), color: AppColors.textColor,),

                  ],
                ),
              ],
            ),
          ),
          Expanded(child: SingleChildScrollView(
            child: FoodPageBody(),
          ),),
        ],
      ),
    );
  }
}
