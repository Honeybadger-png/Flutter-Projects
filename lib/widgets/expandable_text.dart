import 'package:flutter/material.dart';
import 'package:parsley/constants/colors.dart';
import 'package:parsley/constants/dimensions.dart';
import 'package:parsley/widgets/small_text.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({Key? key,required this.text}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeigh = Dimensions.screenHeight/5.63;

  @override
  void initState() {
    super.initState();
    if(widget.text.length>textHeigh){
      firstHalf =widget.text.substring(0, textHeigh.toInt());
      secondHalf = widget.text.substring(textHeigh.toInt()+1, widget.text.length);
    }else{
      firstHalf = widget.text;
      secondHalf = "";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty ? SmallText(color:AppColors.paraColor,size:Dimensions.font16,text: firstHalf):Column(
        children: [
          SmallText(height:1.8,color:AppColors.paraColor,size:Dimensions.font16,text: hiddenText ?(firstHalf+"..."):(firstHalf+secondHalf)),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText=!hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(text: "Show more ",color: AppColors.mainColor,),
                Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up, color: AppColors.mainColor,),
              ],
            ),
          )
        ],

      ),
    );
  }
}
