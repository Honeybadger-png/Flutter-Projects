import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parsley/constants/dimensions.dart';
import 'package:parsley/controllers/food_controller.dart';
import 'package:parsley/routes/route_helper.dart';

import '../../data/repository/authentication_repository/authentication_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(scale:animation,child: Center(child: Image.asset("assets/images/logo.png",width: Dimensions.splashImg,),)),
          Center(child: Image.asset("assets/images/logo.png",width: Dimensions.splashImg,),),
        ],
      ),
    );
  }
}
