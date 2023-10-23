import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parsley/pages/add/add_to_plan.dart';
import 'package:parsley/pages/food/recommended_food_details.dart';
import 'package:parsley/pages/home/home_page.dart';
import 'package:parsley/pages/home/main_food_page.dart';
import 'package:parsley/pages/food/food_detail.dart';
import 'package:parsley/pages/splash/splash_page.dart';


class RouteHelper {
  static const String initial = "/";
  static const String food = "/food-detail";
  static const String recommendedFood = "/recommended-food";
  static const String addPage = "/add-page";
  static const String splashScreen ="/splash-screen";


  static String getSplashScreen()=>'$splashScreen';
  static String getInitial()=>'$initial';
  static String getFood(int pageId)=>'$food?pageId=$pageId';
  static String getRecommendedFood()=>'$recommendedFood';
  static String getAddPage()=>'$addPage';

  static List<GetPage> routes = [

    GetPage(name: splashScreen, page: ()=> SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),

    GetPage(name: food, page: () {
      var pageId=Get.parameters['pageId'];
      return FoodDetail(pageId: int.parse(pageId!));
    },
      transition: Transition.circularReveal
    ),

    GetPage(name: recommendedFood, page: () {
      return RecommendedFoodDetail();
    },
        transition: Transition.circularReveal
    ),
    GetPage(name: addPage, page: (){
      return AddPage();
    },
      transition: Transition.fadeIn
    )
  ];
}
