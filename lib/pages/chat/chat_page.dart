import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:parsley/constants/colors.dart';
import 'package:parsley/constants/dimensions.dart';
import 'package:parsley/models/message_model.dart';
import 'package:parsley/pages/chat/chat_messages.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController txtMessage = TextEditingController();
  late OpenAI openAI;
  StreamSubscription? subscription;
  final apiKey = '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';

  final messages =[MessageModel("hi", true)] ;



  @override
  void initState() {
    openAI = OpenAI.instance.build(token: apiKey);
    super.initState();
  }

  @override
  void dispose() {
    openAI.close();
    subscription?.cancel();
    super.dispose();
  }
  void sendMessage(String message) async{
    final request = CompleteText(prompt: message, model: kTranslateModelV3,maxTokens: 2000);
    // subscription=openAI.onCompleteStream(request: request).asBroadcastStream().listen((it) {
    //   setState(() {
    //     messages.add(MessageModel("${it?.choices.last.text}", true));
    //   });
    // });
    final res = await openAI.onCompleteText(request: request);
    setState(() {
      messages.add(MessageModel("${res?.choices.last.text}", true));
    });






    // _subscription = chatGPT.builder("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");
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [_appBar(context), _messageList(),Expanded(child: SizedBox())],
          ),
          _bottomNavigation(),
        ],
      ),
    );
  }

  Expanded _messageList() {
    return Expanded(
        flex: 7,
        child: Container(
          child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return messages[index].isBot
                    ? _botCard(index: index)
                    : _userCard(index: index);
              }),
        ));
  }

  Padding _userCard({required int index}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width10,vertical: Dimensions.height10),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: CircleAvatar(
              child: Icon(
                Icons.person,
                size: 16,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width10,
                    vertical: Dimensions.width10),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                        Radius.circular(Dimensions.radius15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: Offset(.5, .5),
                        blurRadius: Dimensions.radius15,
                      )
                    ]),
                child: Text(messages[index].message)),
          )
        ],
      ),
    );
  }

  Padding _botCard({required int index}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width10,vertical: Dimensions.height10),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              child: Icon(
                Icons.person,
                size: 16,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: Dimensions.width10*4),
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width10,
                  vertical: Dimensions.width10),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                      Radius.circular(Dimensions.radius15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: Offset(.5, .5),
                      blurRadius: Dimensions.radius15,
                    )
                  ]),
              child: Text(messages[index].message.replaceAll('/[a-zA-Z0-9\b\0]/;', '')))
        ],
      ),
    );
  }

  Align _bottomNavigation() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          height: Dimensions.screenHeight * 0.08,
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width20, vertical: Dimensions.width10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(Dimensions.radius20 / 2),
              topLeft: Radius.circular(Dimensions.radius20 / 2),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: Offset(2.5, 5),
                  blurRadius: Dimensions.radius15),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.12),
                borderRadius: BorderRadius.circular(Dimensions.radius20 / 2)),
            child: TextField(
              controller: txtMessage,
              decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: (){
                      FocusScope.of(context).unfocus();
                      sendMessage(txtMessage.text.toString());
                      setState(() {
                        messages.add(MessageModel(txtMessage.text.toString(), false));
                        txtMessage.text = '';
                      });
                    },
                    child: const Icon(
                      Icons.send,
                      size: 25,
                      color: Colors.blue,
                    ),
                  ),
                  hintText: "    ...A",
                  isDense: true,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none),
            ),
          )),
    );
  }

  Expanded _appBar(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(Dimensions.radius20),
                bottomLeft: Radius.circular(Dimensions.radius20),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: Offset(2.5, 5),
                    blurRadius: Dimensions.radius15),
              ]),
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_rounded,
                color: AppColors.mainBlackColor,
                size: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width15),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/parsley.png"),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ChatGPT",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: Colors.black),
                  ),
                  Text(
                    "online",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: Colors.green),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
