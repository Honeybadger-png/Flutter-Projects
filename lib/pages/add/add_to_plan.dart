import 'package:flutter/material.dart';
import 'package:parsley/constants/colors.dart';
import 'package:parsley/constants/dimensions.dart';
import 'package:parsley/routes/route_helper.dart';
import 'package:parsley/widgets/app_icon.dart';
import 'package:parsley/widgets/big_text.dart';
import 'package:parsley/widgets/small_text.dart';
import 'package:get/get.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: Dimensions.width20,
            top: Dimensions.height20 * 3,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundcolor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
                SizedBox(
                  width: Dimensions.width20 * 5,
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: appIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundcolor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                appIcon(
                  icon: Icons.add_box_rounded,
                  iconColor: Colors.white,
                  backgroundcolor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimensions.height20 * 5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height15),
              child: MediaQuery.removePadding(
                context: context,
                removeTop:true ,
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (_, index) {
                      return Container(
                        width: double.maxFinite,
                        height: Dimensions.height20 * 5,
                        child: Row(
                          children: [
                            Container(
                              width: Dimensions.width20*5,
                              height: Dimensions.height20*5,
                              margin: EdgeInsets.only(bottom: Dimensions.height10),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    "assets/images/food.jpg"
                                  )
                                ),
                                borderRadius: BorderRadius.circular(Dimensions.radius20),
                                color: Colors.white
                              ),
                            ),
                            SizedBox(width: Dimensions.width10,),
                            Expanded(child: Container(
                              height: Dimensions.height20*5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  BigText(text: "Bitter Orange Juice",color: Colors.black54,),
                                  SmallText(text: "54 calori"),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigText(text: "\$ 10.0 gr protein",color: Colors.redAccent,),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: Dimensions.height10,
                                            bottom: Dimensions.height10,
                                            left: Dimensions.width10,
                                            right: Dimensions.width10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.remove,
                                              color: AppColors.signColor,
                                            ),
                                            SizedBox(
                                              width: Dimensions.width10 / 2,
                                            ),
                                            BigText(text: "1"),
                                            SizedBox(
                                              width: Dimensions.width10 / 2,
                                            ),
                                            Icon(
                                              Icons.add,
                                              color: AppColors.signColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ))
                          ],
                        ),
                      );
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
