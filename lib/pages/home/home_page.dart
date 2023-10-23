import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:parsley/auth/sign_up_page.dart';
import 'package:parsley/constants/colors.dart';
import 'package:parsley/models/products_model.dart';
import 'package:parsley/pages/account/account_page.dart';
import 'package:parsley/pages/chat/chat_page.dart';
import 'package:parsley/pages/home/main_food_page.dart';
import 'package:parsley/pages/nutrition/nutrition_page.dart';
import 'package:parsley/widgets/big_text.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../controllers/food_controller.dart';
import '../../data/repository/authentication_repository/authentication_repository.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  late PersistentTabController _controller;



  List pages = [
    MainFoodPage(),
    ChatPage(),
    AccountPage(),
  ];

  void onTapNav(int index){


    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _controller = PersistentTabController(initialIndex: 0);

  }

  List<Widget> _buildScreens() {
    return [
      MainFoodPage(),
      NutritionPage(),
      Container(
        child: Center(child: Text("Next page")),
      ),
      Container(
        child: Center(child: Text("Next page")),
      ),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        currentIndex: _selectedIndex,
        onTap: onTapNav,
        items: [
          BottomNavigationBarItem(
            label: "home",
            icon: Icon(
              Icons.home,

            ),
          ),
          BottomNavigationBarItem(
            label: "chat",
            icon: Icon(Icons.message),
          ),
          BottomNavigationBarItem(
            label: "settings",
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }

}
