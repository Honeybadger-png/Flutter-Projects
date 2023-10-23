import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:parsley/auth/sign_in_page.dart';
import 'package:parsley/data/repository/authentication_repository/authentication_repository.dart';
import 'package:parsley/data/repository/user_repository/user_repository.dart';
import 'package:parsley/pages/home/home_page.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  // email,password,name
  late Rx<User?> _user;

  FirebaseAuth auth = FirebaseAuth.instance;
  final userRepo = Get.put(UserRepository());





  void register(String email, password) async{
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password,);
  }
  void login(String email, password) async{
    AuthenticationRepository.instance.loginWithEmailAndPassword(email, password);
  }
  Future<void>createUser(UserModel user,String email,password) async{
    await userRepo.createUser(user);
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password,);
  }

}
