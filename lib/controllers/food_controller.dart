import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';
import 'package:parsley/data/repository/authentication_repository/authentication_repository.dart';
import 'package:parsley/data/repository/food_repo.dart';

import 'package:parsley/data/repository/user_repository/user_repository.dart';
import 'package:parsley/models/products_model.dart';
import 'package:parsley/models/user_model.dart';


class FoodController extends GetxController {
  static FoodController get instance => Get.find();
  final _authRepo = Get.put(AuthenticationRepository());
  final userRepo = Get.put(UserRepository());
  final FoodRepo foodRepo;
  FoodController({required this.foodRepo});
  List<dynamic> _foodList = [];
  List<dynamic> get foodList => _foodList;
  final _db = FirebaseFirestore.instance.collection("Users");



  Future<void> getFoodList(String apiSearch,int number) async {

    //final apiSearch=UserModel.fromSnapshot(snapshot as DocumentSnapshot<Map<String, dynamic>>).apiSearch;
    print(number);
    print(apiSearch);
    Response breakfast = await foodRepo.getBreakfastList(apiSearch,number);
    Response dinner = await foodRepo.getDinnerList(apiSearch,number);
    Response snack = await foodRepo.getSnackList(apiSearch,number);
    Response teatime = await foodRepo.getTeatimeList(apiSearch,number);
    print("got products");
    _foodList = [];
    _foodList.addAll(Product.fromJson(breakfast.body).hits);
    _foodList.addAll(Product.fromJson(dinner.body).hits);
    _foodList.addAll(Product.fromJson(snack.body).hits);
    _foodList.addAll(Product.fromJson(teatime.body).hits);
    update();

  }
}
