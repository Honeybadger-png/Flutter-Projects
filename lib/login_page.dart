import 'package:flutter/material.dart';
import 'package:parsley/constants/colors.dart';
import 'customMethods/loginMethods.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/parsley.png"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Merhaba \n Hoşgeldin",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    customSizedBox(),
                    TextField(
                      decoration: customInputDecoration("Kullanıcı Adı"),
                    ),
                    customSizedBox(),
                    TextField(
                      decoration: customInputDecoration("Şifre"),
                    ),
                    customSizedBox(),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Şifremi Unuttum",
                          style: TextStyle(
                            color: Colors.pink[200],
                          ),
                        ),
                      ),
                    ),
                    customSizedBox(),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Container(
                          height: 50,
                          width: 150,
                          margin: EdgeInsets.symmetric(horizontal: 60),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.mainBlackColor,
                          ),
                          child: Center(
                            child: Text(
                              "Giriş Yap",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    customSizedBox(),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Hesap Oluştur",
                          style: TextStyle(
                            color: Colors.pink[200],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget customSizedBox() => SizedBox(
        height: 20,
      );


}
