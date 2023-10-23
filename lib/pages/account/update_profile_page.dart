import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:parsley/constants/dimensions.dart';
import 'package:parsley/constants/colors.dart';
import 'package:parsley/controllers/auth_controller.dart';
import 'package:parsley/controllers/profile_controller.dart';
import 'package:parsley/models/user_model.dart';
import 'package:parsley/widgets/account_widget.dart';
import 'package:parsley/widgets/app_icon.dart';
import 'package:parsley/widgets/big_text.dart';

import '../../widgets/app_text_field.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({Key? key}) : super(key: key);

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final controller = Get.put(ProfileController());
  String selectedDietValue = "balanced";
  List<String>? selectedDiet = [];
  List<String>? newDiet = [];
  List<String>? distinctDiets = [];
  String selectedDietDummy = "selected diet types";
  List<String>? selectedHealth = [];
  List<String>? distintcHealths = [];
  String selectedHealthValue = "alcohol-free";
  String selectdeHealthDummy = "Selected health types";
  List<String>? selectedCuisine = [];
  List<String>? distinctCuisines = [];
  String selectedCuisineValue = "Mediterranean";
  String selectedCuisineDummy = "Selected cuisine types";
  Future? userDataFuture;
  String cuisinePart ="";
  String dietPart = "";
  String healthPart = "";
  String cuisineSearch = "&cuisineType=";
  String dietSearch = "&diet=";
  String healthSearch = "&health=";
  String apiSearch = "";
  List<String> diet = [
    "balanced",
    "high-fiber",
    "high-protein",
    "low-carb",
    "low-fat",
    "low-sodium"
  ];

  List<String> health = [
    "alcohol-cocktail",
    "alcohol-free",
    "celery-free",
    "crustacean-free",
    "dairy-free",
    "DASH",
    "egg-free",
    "fish-free",
    "foodmap-free",
    "gluten-free",
    "immuno-supportive",
    "keto-friendly",
    "kidney-friendly",
    "kosher",
    "low-fat-abs",
    "low-potassium",
    "low-sugar",
    "lupine-free",
    "Mediterranean",
    "mollusk-free",
    "mustard-free",
    "no-oil-added",
    "paleo",
    "peanut-free",
    "pescatarian",
    "pork-free",
    "red-mear-free",
    "sesame-free",
    "shellfish-free",
    "soy-free",
    "sugar-conscious",
    "sulfite-free",
    "tree-nut-free",
    "vegan",
    "vegetarian",
    "wheat-free"
  ];

  List<String> cuisineType = [
    "American",
    "Asian",
    "British",
    "Caribbean",
    "Central Europe",
    "Chinese",
    "Eastern Europe",
    "French",
    "Indian",
    "Italian",
    "Japanese",
    "Kosher",
    "Mediterranean",
    "Mexican",
    "Middle Eastern",
    "Nordic",
    "South American",
    "South East Asian",
  ];
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      distinctCuisines?.forEach((element) {
        cuisinePart = cuisineSearch + element;
        print(cuisinePart);
      });
      distinctDiets?.forEach((element) {
        dietPart = dietSearch + element;
        print(dietPart);
      });
      distintcHealths?.forEach((element) {
        healthPart = healthSearch + element;
        print(healthPart);
      });
    });
    super.initState();
    userDataFuture = controller.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(LineAwesomeIcons.angle_left),
        ),
        title: BigText(
          text: "Profile",
          size: Dimensions.font12 * 2,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: FutureBuilder<dynamic>(
          future: userDataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                UserModel userData = snapshot.data as UserModel;
                final email = TextEditingController(text: userData.email);
                final password = TextEditingController(text: userData.password);
                final phoneNo = TextEditingController(text: userData.phoneNo);
                final fullName = TextEditingController(text: userData.fullName);
                selectedDiet = userData.diet;
                return Column(
                  children: [
                    SizedBox(
                      height: Dimensions.screenHeight * 0.05,
                    ),
                    Container(
                      height: Dimensions.screenHeight * 0.25,
                      child: Center(
                        child: CircleAvatar(
                          radius: Dimensions.radius20 * 4,
                          backgroundImage:
                              AssetImage("assets/images/parsley.png"),
                        ),
                      ),
                    ),
                    AppTextField(
                        readOnly: true,
                        icon: Icons.email,
                        hintText: userData.email,
                        textController: email),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    AppTextField(
                        readOnly: true,
                        icon: Icons.email,
                        hintText: userData.password,
                        textController: password),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    AppTextField(
                        readOnly: true,
                        icon: Icons.email,
                        hintText: userData.fullName,
                        textController: fullName),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    AppTextField(
                        readOnly: true,
                        icon: Icons.email,
                        hintText: userData.phoneNo,
                        textController: phoneNo),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return Center(
                  child: Text('Something went wrong'),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
