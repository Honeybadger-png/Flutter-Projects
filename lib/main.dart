import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parsley/controllers/food_controller.dart';
import 'package:parsley/data/repository/authentication_repository/authentication_repository.dart';
import 'package:parsley/routes/route_helper.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthenticationRepository()));
  await dep.init();
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Timer? timer;
  Timer? timer2;
  Timer? timer3;
  Timer? timer4;
  Timer? timer5;
  Random random = Random();
  int randomNumber = 2;
  final _db = FirebaseFirestore.instance.collection("Users");
  final _authRepo = Get.put(AuthenticationRepository());
  String id="";
  String apiSearch="";
  int dummynumber = 1;
  String email="";

  var max=5;
  var min = 1;
  getId(){
    final usersRef = _db.where("Email",isEqualTo: _authRepo.firebaseUser?.value?.email);
    usersRef.get().then((QuerySnapshot snapshot){
      snapshot.docs.forEach((DocumentSnapshot element) {
        id = element.id ?? '1';
      });
    });
  }
  Future<void> getApi()async{
    getId();
    DocumentSnapshot snap = await _db.doc(id).get();
    setState(() {
      apiSearch = snap["apiSearch"];
      email = snap["Email"];
    });

  }
  Future<void> _loadResource()async{
    await Get.find<FoodController>().getFoodList(apiSearch,randomNumber);
  }




  @override
  void initState() {
    timer2 = Timer.periodic(Duration(seconds: 2), (Timer timer2) {
      getId();
      print("merhaba ıd "+id);
      timer2.cancel();
    });
    timer4 = Timer.periodic(Duration(seconds: 5), (Timer timer4) {
      getApi();
      print("merhaba api:"+apiSearch);
      print(email);
      timer4.cancel();
    });
    timer3 = Timer.periodic(Duration(hours: 12), (timer) {setState(() {
      randomNumber = random.nextInt(max - 1);
    }); });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _loadResource();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      //home: SignInPage(),
      initialRoute: RouteHelper.getInitial(),
      getPages: RouteHelper.routes,
    );
  }
}


