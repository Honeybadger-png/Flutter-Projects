import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async{
    await _db.collection("Users").add(user.toJson()).whenComplete(() => Get.snackbar(
        "Succes", "You account has been created.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green)).catchError((error,stackTrace){
          Get.snackbar("Error", "Something went wrong",snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.redAccent.withOpacity(0.1),colorText: Colors.red);
          print(error.toString());
    });
  }

  getUserDetails(String email) async{
    final snapshot = await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<void> updateUserRecord(UserModel user) async{
    await _db.collection("Users").doc(user.id).update(user.toJson());
  }
}