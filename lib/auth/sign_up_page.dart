import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parsley/constants/colors.dart';
import 'package:parsley/constants/dimensions.dart';
import 'package:parsley/controllers/auth_controller.dart';
import 'package:parsley/widgets/app_text_field.dart';
import 'package:parsley/widgets/big_text.dart';

import '../models/user_model.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var dietController = TextEditingController();
  List<String>? selectedDiet = [];
  List<String>? distinctDiets = [];
  String selectedDietValue = "balanced";
  String selectedDietDummy = "selected diet types";
  List<String>? selectedHealth = [];
  List<String>? distintcHealths=[];
  String selectedHealthValue= "alcohol-free";
  String selectdeHealthDummy="Selected health types";
  List<String>? selectedCuisine = [];
  List<String>? distinctCuisines = [];
  String selectedCuisineValue = "Mediterranean";
  String selectedCuisineDummy = "Selected cuisine types";
  String cuisinePart = "";
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
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());

    var signUpImages = [
      "g.png",
    ];
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),
            Container(
              height: Dimensions.screenHeight * 0.25,
              child: Center(
                child: CircleAvatar(
                  radius: Dimensions.radius20 * 4,
                  backgroundImage: AssetImage("assets/images/parsley.png"),
                ),
              ),
            ),
            AppTextField(
                readOnly: false,
                icon: Icons.email,
                hintText: "Email",
                textController: emailController),
            SizedBox(
              height: Dimensions.height20,
            ),
            AppTextField(
                readOnly: false,
                icon: Icons.password_sharp,
                hintText: "Password",
                textController: passwordController),
            SizedBox(
              height: Dimensions.height20,
            ),
            AppTextField(
                readOnly: false,
                icon: Icons.person,
                hintText: "Name",
                textController: nameController),
            SizedBox(
              height: Dimensions.height20,
            ),
            AppTextField(
                readOnly: false,
                icon: Icons.phone,
                hintText: "Phone",
                textController: phoneController),
            SizedBox(
              height: Dimensions.height20,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: Dimensions.width20),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                    child: DropdownButtonFormField(
                      value: selectedDietValue,
                      onChanged: (value) {
                        setState((){
                          selectedDietValue = value.toString();
                          print(selectedDietValue);
                        });
                      },
                      items: diet.map((e) {
                        return DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        );
                      }).toList(),

                      icon: Icon(
                        Icons.arrow_drop_down_circle,
                        color: AppColors.mainColor,
                      ),
                      decoration: InputDecoration(
                          labelText: "Diet types",
                        prefixIcon: Icon(
                          Icons.emoji_food_beverage,
                          color: AppColors.mainColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Dimensions.radius30)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                    child: DropdownButtonFormField(
                      onChanged: (value) {

                      },
                      items: distinctDiets?.map((e) {
                        return DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        );
                      }).toList(),

                      icon: Icon(
                        Icons.arrow_drop_down_circle,
                        color: AppColors.mainColor,
                      ),
                      decoration: InputDecoration(
                        labelText: "You Can see the selected types",
                        prefixIcon: Icon(
                          Icons.emoji_food_beverage,
                          color: AppColors.mainColor,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Dimensions.radius30)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedDiet?.clear();
                              distinctDiets?.clear();
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                top: Dimensions.height20,
                                bottom: Dimensions.height20,
                                left: Dimensions.width20,
                                right: Dimensions.width20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                              color: AppColors.mainColor,
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.clear)
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedDiet?.add(selectedDietValue);
                              distinctDiets = selectedDiet?.toSet().toList();
                              print(distinctDiets.toString());
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                top: Dimensions.height20,
                                bottom: Dimensions.height20,
                                left: Dimensions.width20,
                                right: Dimensions.width20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                              color: AppColors.mainColor,
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.add)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: Dimensions.width20),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                    child: DropdownButtonFormField(
                      value: selectedHealthValue,
                      onChanged: (value) {
                        setState((){
                          selectedHealthValue = value.toString();
                          print(selectedHealthValue);
                        });
                      },
                      items: health.map((e) {
                        return DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        );
                      }).toList(),

                      icon: Icon(
                        Icons.arrow_drop_down_circle,
                        color: AppColors.mainColor,
                      ),
                      decoration: InputDecoration(
                        labelText: "Health types",
                        prefixIcon: Icon(
                          Icons.emoji_food_beverage,
                          color: AppColors.mainColor,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Dimensions.radius30)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                    child: DropdownButtonFormField(
                      onChanged: (value) {

                      },
                      items: distintcHealths?.map((e) {
                        return DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        );
                      }).toList(),

                      icon: Icon(
                        Icons.arrow_drop_down_circle,
                        color: AppColors.mainColor,
                      ),
                      decoration: InputDecoration(
                        labelText: "You Can see the selected Health types",
                        prefixIcon: Icon(
                          Icons.emoji_food_beverage,
                          color: AppColors.mainColor,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Dimensions.radius30)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedHealth?.clear();
                              distintcHealths?.clear();
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                top: Dimensions.height20,
                                bottom: Dimensions.height20,
                                left: Dimensions.width20,
                                right: Dimensions.width20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                              color: AppColors.mainColor,
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.clear)
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedHealth?.add(selectedHealthValue);
                              distintcHealths = selectedHealth?.toSet().toList();
                              print(distintcHealths.toString());
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                top: Dimensions.height20,
                                bottom: Dimensions.height20,
                                left: Dimensions.width20,
                                right: Dimensions.width20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                              color: AppColors.mainColor,
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.add)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: Dimensions.width20),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                    child: DropdownButtonFormField(
                      value: selectedCuisineValue,
                      onChanged: (value) {
                        setState((){
                          selectedCuisineValue = value.toString();
                          print(selectedCuisineValue);
                        });
                      },
                      items: cuisineType.map((e) {
                        return DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        );
                      }).toList(),

                      icon: Icon(
                        Icons.arrow_drop_down_circle,
                        color: AppColors.mainColor,
                      ),
                      decoration: InputDecoration(
                        labelText: "Cuisine types",
                        prefixIcon: Icon(
                          Icons.emoji_food_beverage,
                          color: AppColors.mainColor,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Dimensions.radius30)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                    child: DropdownButtonFormField(
                      onChanged: (value) {

                      },
                      items: distinctCuisines?.map((e) {
                        return DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        );
                      }).toList(),

                      icon: Icon(
                        Icons.arrow_drop_down_circle,
                        color: AppColors.mainColor,
                      ),
                      decoration: InputDecoration(
                        labelText: "You Can see the selected Cuisine types",
                        prefixIcon: Icon(
                          Icons.emoji_food_beverage,
                          color: AppColors.mainColor,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Dimensions.radius30)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedCuisine?.clear();
                              distinctCuisines?.clear();
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                top: Dimensions.height20,
                                bottom: Dimensions.height20,
                                left: Dimensions.width20,
                                right: Dimensions.width20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                              color: AppColors.mainColor,
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.clear)
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedCuisine?.add(selectedCuisineValue);
                              distinctCuisines = selectedCuisine?.toSet().toList();
                              print(distinctCuisines.toString());
                              print(cuisinePart);
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                top: Dimensions.height20,
                                bottom: Dimensions.height20,
                                left: Dimensions.width20,
                                right: Dimensions.width20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                              color: AppColors.mainColor,
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.add)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),

            SizedBox(
              height: Dimensions.height20,
            ),

            GestureDetector(
              onTap: () {
                distinctCuisines?.forEach((element) {
                  cuisinePart = cuisineSearch + element;
                });
                distinctDiets?.forEach((element) {
                  dietPart = dietSearch + element;
                });
                distintcHealths?.forEach((element) {
                  healthPart = healthSearch + element;
                });
                final user = UserModel(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                  fullName: nameController.text.trim(),
                  phoneNo: phoneController.text.trim(),
                  diet: distinctDiets,
                  cuisineType: distinctCuisines,
                  health: distintcHealths,
                  apiSearch: apiSearch + cuisinePart+dietPart+healthPart,

                );
                controller.createUser(user, emailController.text.trim(),
                    passwordController.text.trim());
              },
              child: Container(
                width: Dimensions.screenWidth / 2,
                height: Dimensions.screenHeight / 13,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: AppColors.mainColor),
                child: Center(
                    child: BigText(
                      text: "Sign Up",
                      size: Dimensions.font20 + Dimensions.font20 / 2,
                      color: Colors.white,
                    )),
              ),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            RichText(
                text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.back(),
                    text: "Have an account already?",
                    style: TextStyle(
                        color: Colors.white, fontSize: Dimensions.font20))),
          ],
        ),
      ),
    );
  }
}



