import 'package:flutter/material.dart';
import 'package:parsley/constants/dimensions.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({Key? key, required this.text, required this.sender}) : super(key: key);

  final String text;
  final String sender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 16.0),
          child: CircleAvatar(child: Text(sender[0]),),
        ),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(sender, style: Theme.of(context).textTheme.subtitle1,),
            Container(
              margin: EdgeInsets.only(top: Dimensions.height10/2),
              child: Text(text),
            )
          ],
        ))
      ],
    );
  }
}
