import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:parsley/data/repository/authentication_repository/authentication_repository.dart';
import 'package:parsley/data/repository/food_repo.dart';
import 'package:parsley/data/api/api_client.dart';
import 'package:parsley/data/repository/user_repository/user_repository.dart';
import 'package:parsley/models/products_model.dart';

import '../models/user_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserData() {
    final email = _authRepo.firebaseUser?.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }

}
