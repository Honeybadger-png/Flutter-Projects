import 'dart:math';

import 'package:flutter/material.dart';
import 'package:parsley/constants/colors.dart';
import 'package:parsley/constants/dimensions.dart';
import 'package:parsley/routes/route_helper.dart';
import 'package:parsley/widgets/app_icon.dart';
import 'package:parsley/widgets/big_text.dart';
import 'package:parsley/widgets/expandable_text.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteHelper.getInitial());
                },
                child: appIcon(icon: Icons.clear),
              ),
              appIcon(icon: Icons.add_circle_rounded),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Container(
              child: Center(
                  child: BigText(
                text: "Chinese Side",
                size: Dimensions.font20,
              )),
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 5, bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20))),
            ),
          ),
          pinned: true,
          backgroundColor: AppColors.yellowColor,
          expandedHeight: 300,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              "assets/images/food.jpg",
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
            child: Column(
          children: [
            Container(
              child: ExpandableText(
                  text:
                      "Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions (cheeky easy sub below),fresh coriander/ cilantro, then par boiled, added salads to make it healthyChicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions (cheeky easy sub below),fresh coriander/ cilantro, then par boiled, added salads to make it healthyChicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions (cheeky easy sub below),fresh coriander/ cilantro, then par boiled, added salads to make it healthyChicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions (cheeky easy sub below),fresh coriander/ cilantro, then par boiled, added salads to make it healthyChicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions (cheeky easy sub below),fresh coriander/ cilantro, then par boiled, added salads to make it healthyChicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions (cheeky easy sub below),fresh coriander/ cilantro, then par boiled, added salads to make it healthyChicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions (cheeky easy sub below),fresh coriander/ cilantro, then par boiled, added salads to make it healthyChicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions (cheeky easy sub below),fresh coriander/ cilantro, then par boiled, added salads to make it healthyChicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions (cheeky easy sub below),fresh coriander/ cilantro, then par boiled, added salads to make it healthyChicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions (cheeky easy sub below),fresh coriander/ cilantro, then par boiled, added salads to make it healthyChicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions (cheeky easy sub below),fresh coriander/ cilantro, then par boiled, added salads to make it healthy"),
              margin: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
            )
          ],
        )),
      ]),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimensions.width20 * 2.5,
                right: Dimensions.width20 * 2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundcolor: AppColors.mainColor,
                    icon: Icons.remove),
                BigText(
                  text: "1",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                appIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundcolor: AppColors.mainColor,
                    icon: Icons.add)
              ],
            ),
          ),
          Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.height20,
                right: Dimensions.height20),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20 * 2),
                  topRight: Radius.circular(Dimensions.radius20 * 2),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height20,
                        bottom: Dimensions.height20,
                        left: Dimensions.width20,
                        right: Dimensions.width20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    )),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                  child: Row(
                    children: [
                      BigText(
                        text: "Add to plan",
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
