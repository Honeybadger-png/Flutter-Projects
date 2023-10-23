
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:parsley/constants/colors.dart';

import 'package:parsley/controllers/food_controller.dart';
import 'package:parsley/data/repository/authentication_repository/authentication_repository.dart';

import 'package:parsley/routes/route_helper.dart';
import 'package:parsley/widgets/app_column.dart';

import 'package:parsley/constants/dimensions.dart';
import 'package:get/get.dart';

import 'package:flutter/cupertino.dart';
import 'package:parsley/models/products_model.dart';
import 'package:flutter/cupertino.dart';


import 'package:http/http.dart' as http;

final _authRepo = Get.put(AuthenticationRepository());

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  PageController menuController = PageController(viewportFraction: 0.85);

  var _currPageValue = 1.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;


  List menuItems = ["Breakfast", "Lunch", "Snacks", "TeaTime"];



  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }


  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  // getApiData() async{
  //   var response = await http.get(Uri.parse(AppConstants.BASE_URL+AppConstants.BREAKFAST_URI));
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider section
        GetBuilder<FoodController>(builder: (popularProducts) {
          // wrap container with popularProducts.isLoaded?Container():CircularProgressIndicator(maincolor)
          return Container(
            padding: EdgeInsets.only(top: Dimensions.height30),
            height: Dimensions.pageView*1.5,
            child: PageView.builder(
                controller: pageController,
                itemCount: popularProducts.foodList.length,
                itemBuilder: (context, position) {
                  return _buildPageItem(position,popularProducts.foodList[position]);
                }),
          );
        }),
        DotsIndicator(dotsCount: 4,position: _currPageValue,decorator: DotsDecorator(
          activeColor: AppColors.mainColor,
          size: Size.square(9.0),
          activeSize: Size(18.0,9.0),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radius20))
        ),),
      ],
    );
  }

  Widget _buildPageItem(int index, Hits foodList) {
    // Matrix4 matrix = new Matrix4.identity();
    // if (index == _currPageValue.floor()) {
    //   var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
    //   var currTrans = _height * (1 - currScale / 2);
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1)
    //     ..setTranslationRaw(0, currTrans, 0);
    // } else if (index == _currPageValue.floor() + 1) {
    //   var currScale =
    //       _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
    //   var currTrans = _height * (1 - currScale / 2);
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1);
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1)
    //     ..setTranslationRaw(0, currTrans, 0);
    // } else if (index == _currPageValue.floor() - 1) {
    //   var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
    //   var currTrans = _height * (1 - currScale / 2);
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1);
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1)
    //     ..setTranslationRaw(0, currTrans, 0);
    // } else {
    //   var currScale = 0.8;
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1)
    //     ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    // }
    return Stack(
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(RouteHelper.getFood(index));
              },
              child: Container(
                height: Dimensions.pageViewContainer*1.2,
                margin: EdgeInsets.only(
                    left: Dimensions.height10,
                    right: Dimensions.height10,
                    top: Dimensions.height10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: index.isEven ? Colors.red : Colors.yellow,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(foodList.recipe!.image.toString()))),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer*1.4,
            margin: EdgeInsets.only(
                left: Dimensions.height30,
                right: Dimensions.height30,
                bottom: Dimensions.height30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5))
              ],
            ),
            child: Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  left: Dimensions.height15,
                  right: Dimensions.height15),
              margin: EdgeInsets.only(bottom: Dimensions.height15),
              // changing text with popularProduct.name!
              child: AppColumn(
                label: foodList.recipe!.label.toString(),
                KCALquantityLabel: foodList.recipe!.totalNutrients!.eNERCKCAL!.label.toString(),
                KCALquantity: foodList.recipe!.totalNutrients!.eNERCKCAL!.quantity!.toInt(),
                KCALunit: foodList.recipe!.totalNutrients!.eNERCKCAL!.unit.toString(),
                totaltime: foodList.recipe!.totalTime!.toInt().toString(),
                mealtype: foodList.recipe!.mealType![0],
                CarbsquantityLabel: foodList.recipe!.totalNutrients!.cA!.label.toString(),
                Carbsquantity:foodList.recipe!.totalNutrients!.cA!.quantity!.toInt(),
                Carbsunit:foodList.recipe!.totalNutrients!.cA!.unit.toString(),
                FatquantityLabel:foodList.recipe!.totalNutrients!.fAT!.label.toString(),
                Fatquantity:foodList.recipe!.totalNutrients!.fAT!.quantity!.toInt(),
                Fatunit:foodList.recipe!.totalNutrients!.fAT!.unit.toString(),
                ProteinquantityLabel:foodList.recipe!.totalNutrients!.pROCNT!.label.toString(),
                Proteinquantity: foodList.recipe!.totalNutrients!.pROCNT!.quantity!.toInt(),
                Proteinunit: foodList.recipe!.totalNutrients!.pROCNT!.unit.toString(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
