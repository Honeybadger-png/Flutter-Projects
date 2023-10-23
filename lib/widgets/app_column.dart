import 'package:flutter/material.dart';
import 'package:parsley/constants/colors.dart';
import 'package:parsley/constants/dimensions.dart';
import 'package:parsley/widgets/big_text.dart';
import 'package:parsley/widgets/icon_and_text_widget.dart';
import 'package:parsley/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String label;
  final String totaltime,mealtype;
  final int KCALquantity;
  final int Fatquantity;
  final int Carbsquantity;
  final int Proteinquantity;
  final String KCALquantityLabel;
  final String FatquantityLabel;
  final String CarbsquantityLabel;
  final String ProteinquantityLabel;
  final String KCALunit;
  final String Fatunit;
  final String Carbsunit;
  final String Proteinunit;

  const AppColumn({Key? key,required this.label,required this.totaltime, required this.mealtype, required this.KCALquantity, required this.Fatquantity, required this.Carbsquantity, required this.Proteinquantity, required this.KCALquantityLabel, required this.FatquantityLabel, required this.CarbsquantityLabel, required this.ProteinquantityLabel, required this.KCALunit, required this.Fatunit, required this.Carbsunit, required this.Proteinunit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: label, size: Dimensions.font26,),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmallText(text: mealtype, size: Dimensions.font16,),
            SizedBox(
              width: 10,
            ),
            SmallText(text: KCALquantityLabel+""+KCALquantity.toString()+KCALunit, size: Dimensions.font16,),
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmallText(text: FatquantityLabel+""+Fatquantity.toString()+Fatunit),
            SizedBox(
              width: 10,
            ),
            SmallText(text: CarbsquantityLabel+""+Carbsquantity.toString()+Carbsunit),
            SizedBox(
              width: 10,
            ),
            SmallText(text: ProteinquantityLabel+""+Proteinquantity.toString()+Proteinunit),
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: AppColors.iconColor1),

            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: totaltime+"min",
                iconColor: AppColors.iconColor2),
          ],
        )
      ],
    );
  }
}
