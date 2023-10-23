import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parsley/auth/sign_up_page.dart';
import 'package:parsley/constants/colors.dart';
import 'package:parsley/constants/dimensions.dart';
import 'package:parsley/controllers/auth_controller.dart';
import 'package:parsley/widgets/app_text_field.dart';
import 'package:parsley/widgets/big_text.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
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
            Container(
              margin: EdgeInsets.only(left: Dimensions.width20),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello",style: TextStyle(
                    fontSize: Dimensions.font20*3,
                    fontWeight: FontWeight.bold
                  ),),
                  Text("Sign into your account",style: TextStyle(
                      fontSize: Dimensions.font20,
                  ),),
                ],
              ) ,
            ),
            SizedBox(
              height: Dimensions.height20,
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
            Row(
              children: [
                Expanded(child: Container()),
                RichText(text: TextSpan(
                    recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                    text: "Sign into your account",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimensions.font20
                    )
                )),
                SizedBox(width: Dimensions.width20,)
              ],
            ),
            SizedBox(height: Dimensions.screenHeight*0.05,),
            GestureDetector(
              onTap: (){
                controller.login(emailController.text.trim(), passwordController.text.trim());
              },
              child: Container(
                width: Dimensions.screenWidth / 2,
                height: Dimensions.screenHeight / 13,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: AppColors.mainColor),
                child: Center(
                    child: BigText(
                      text: "Sign In",
                      size: Dimensions.font20 + Dimensions.font20 / 2,
                      color: Colors.white,
                    )),
              ),
            ),
            SizedBox(height: Dimensions.screenHeight*0.05,),
            // sign up option
            RichText(text: TextSpan(

                text: "Don\'t have an account ?",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.font20
                ),
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage(),transition: Transition.fade),
                  text: "Create",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: Dimensions.font20
                  )
                )
              ]
            ),),
          ],
        ),
      ),
    );
  }
}
