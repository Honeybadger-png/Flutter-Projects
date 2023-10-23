import 'package:flutter/material.dart';
import 'package:parsley/constants/dimensions.dart';
import 'package:parsley/widgets/big_text.dart';
import 'package:intl/intl.dart';
import 'package:parsley/constants/colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class NutritionPage extends StatefulWidget {
  const NutritionPage({Key? key}) : super(key: key);

  @override
  State<NutritionPage> createState() => _NutritionPageState();
}

class _NutritionPageState extends State<NutritionPage> {
  var datetime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.height10 / 2),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(
                                  text: DateFormat()
                                      .add_MMMMEEEEd()
                                      .format(datetime),
                                  color: AppColors.textColor,
                                ),
                              ],
                            ),
                            Container(
                              child: IconButton(
                                icon: Icon(Icons.calendar_month),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Dimensions.width10),
                          child: Container(
                            height: Dimensions.height40 * 5,
                            padding: EdgeInsets.symmetric(
                                vertical: Dimensions.width10,
                                horizontal: Dimensions.height20),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius15),
                                color: AppColors.mainColor),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: CircularPercentIndicator(
                                          radius: Dimensions.radius20 * 4,
                                          lineWidth: Dimensions.width10,
                                          animation: true,
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                          progressColor: Colors.white,
                                          percent: 0.7,
                                          center: Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Container(
                                              height: double.infinity,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  color: Colors.purple,
                                                  shape: BoxShape.circle),
                                              padding: EdgeInsets.all(8),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.deepPurple),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text("Remaining"),
                                                    Text(
                                                      "1,112",
                                                      style: TextStyle(
                                                          fontSize: Dimensions
                                                              .font16),
                                                    ),
                                                    Text("kcal")
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: Dimensions.width20,
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Carbs",
                                              style: TextStyle(
                                                  fontSize: Dimensions.font16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            LinearPercentIndicator(
                                              padding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.white.withOpacity(0.2),
                                              progressColor: Colors.white,
                                              percent: 14 / 323,
                                            ),
                                            Text(
                                              "14/323g",
                                              style: TextStyle(
                                                  fontSize: Dimensions.font12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Proteins",
                                              style: TextStyle(
                                                  fontSize: Dimensions.font16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            LinearPercentIndicator(
                                              padding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.white.withOpacity(0.2),
                                              progressColor: Colors.white,
                                              percent: 14 / 129,
                                            ),
                                            Text(
                                              "14/129",
                                              style: TextStyle(
                                                  fontSize: Dimensions.font12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Fat",
                                              style: TextStyle(
                                                  fontSize: Dimensions.font16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            LinearPercentIndicator(
                                              padding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.white.withOpacity(0.2),
                                              progressColor: Colors.white,
                                              percent: 14 / 104,
                                            ),
                                            Text(
                                              "14/104g",
                                              style: TextStyle(
                                                  fontSize: Dimensions.font12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.height10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  BigText(text: "Calories"),
                                  BigText(text: "271,4"),
                                  BigText(text: "2727")
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
