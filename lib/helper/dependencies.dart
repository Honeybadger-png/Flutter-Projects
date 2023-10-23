import 'package:parsley/constants/app_constanst.dart';
import 'package:parsley/controllers/food_controller.dart';
import 'package:parsley/data/api/api_client.dart';
import 'package:get/get.dart';

import 'package:parsley/data/repository/food_repo.dart';

Future<void> init() async{
  //api client
  Get.lazyPut(()=>ApiClient(appBaseUrl:AppConstants.BASE_URL));
  //repos

  Get.lazyPut(() => FoodRepo(apiClient: Get.find()));


  Get.lazyPut(() => FoodController(foodRepo: Get.find()));
}