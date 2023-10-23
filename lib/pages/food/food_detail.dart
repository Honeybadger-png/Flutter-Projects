import 'package:flutter/material.dart';
import 'package:parsley/constants/dimensions.dart';
import 'package:parsley/controllers/food_controller.dart';
import 'package:parsley/controllers/profile_controller.dart';
import 'package:parsley/models/products_model.dart';
import 'package:parsley/pages/home/main_food_page.dart';
import 'package:parsley/widgets/app_column.dart';
import 'package:parsley/widgets/big_text.dart';
import 'package:parsley/widgets/expandable_text.dart';
import 'package:parsley/widgets/small_text.dart';
import 'package:parsley/widgets/app_icon.dart';
import 'package:parsley/widgets/icon_and_text_widget.dart';
import 'package:parsley/constants/colors.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../routes/route_helper.dart';


class FoodDetail extends StatelessWidget {
  int pageId;
  final controller = Get.put(ProfileController());
  FoodDetail({Key? key,required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Hits product = Get.find<FoodController>().foodList[pageId];
    List<String>? ingredientsLine = product.recipe!.ingredientLines;
    print("page is id "+pageId.toString());
    print(Dimensions.screenHeight);
    print("product name is"+product.recipe!.label!);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.foodImgSize,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(product.recipe!.image.toString()))),
            ),
          ),
          // icon widgets
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: appIcon(
                    icon: Icons.arrow_back_ios,
                  ),
                ),
                appIcon(
                  icon: Icons.add,
                )
              ],
            ),
          ),
          // introduction food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.foodImgSize - 45,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(
                    label: product.recipe!.label.toString(),
                    KCALquantityLabel: product.recipe!.totalNutrients!.eNERCKCAL!.label.toString(),
                    KCALquantity: product.recipe!.totalNutrients!.eNERCKCAL!.quantity!.toInt(),
                    KCALunit: product.recipe!.totalNutrients!.eNERCKCAL!.unit.toString(),
                    totaltime: product.recipe!.totalTime!.toInt().toString(),
                    mealtype: product.recipe!.mealType![0],
                    CarbsquantityLabel: product.recipe!.totalNutrients!.cA!.label.toString(),
                    Carbsquantity:product.recipe!.totalNutrients!.cA!.quantity!.toInt(),
                    Carbsunit:product.recipe!.totalNutrients!.cA!.unit.toString(),
                    FatquantityLabel:product.recipe!.totalNutrients!.fAT!.label.toString(),
                    Fatquantity:product.recipe!.totalNutrients!.fAT!.quantity!.toInt(),
                    Fatunit:product.recipe!.totalNutrients!.fAT!.unit.toString(),
                    ProteinquantityLabel:product.recipe!.totalNutrients!.pROCNT!.label.toString(),
                    Proteinquantity: product.recipe!.totalNutrients!.pROCNT!.quantity!.toInt(),
                    Proteinunit: product.recipe!.totalNutrients!.pROCNT!.unit.toString(),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(text: "Link To Recipe"),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                          child: ExpandableText(
                              text:ingredientsLine.toString()))),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
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
            SingleChildScrollView(
              child: GestureDetector(
                  onTap: () async{
                    final url = Uri.parse(product.recipe!.url.toString());
                    await launchUrl(url);
                  },
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: BigText(text:"Link To Recipe")
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




