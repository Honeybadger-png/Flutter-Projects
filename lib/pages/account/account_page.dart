import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:parsley/constants/dimensions.dart';
import 'package:parsley/constants/colors.dart';
import 'package:parsley/data/repository/authentication_repository/authentication_repository.dart';
import 'package:parsley/pages/account/update_profile_page.dart';
import 'package:parsley/widgets/account_widget.dart';
import 'package:parsley/widgets/app_icon.dart';
import 'package:parsley/widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: "Profile",
          size: Dimensions.font12 * 2,
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            //profile icon
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
            SizedBox(height: Dimensions.height30,),
            SizedBox(
              width: Dimensions.width20*10,
              child: ElevatedButton(
                onPressed: () => Get.to(() => UpdateProfilePage()),
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainColor,side: BorderSide.none,shape: StadiumBorder()),
                child: const Text("See Profile",style: TextStyle(color: kDefaultIconDarkColor),),

                ),
              ),
            SizedBox(height: Dimensions.height30,),
            const Divider(),
            SizedBox(height: Dimensions.height10,),
            ProfileMenuWidget(title: "Logout",icon: LineAwesomeIcons.alternate_sign_out,onPress: (){
              AuthenticationRepository.instance.logout();
            },)
          ],
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onPress,
    this.endicon = true,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endicon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: Dimensions.width30,
        height: Dimensions.height30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius20*5),
          color: AppColors.mainColor.withOpacity(0.1),
        ),
        child: Icon(icon,color: AppColors.mainColor,),
      ),
      title: BigText(text: title),
      trailing: Container(
        width: Dimensions.width30,
        height: Dimensions.height30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius20*5),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: Icon(LineAwesomeIcons.angle_right,size: Dimensions.font16,color: Colors.grey,),
      ),
    );
  }
}
