import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibely/constants.dart';
import 'package:vibely/controller/auth_controller.dart';
import 'package:vibely/view/screens/auth/login_screen.dart';
import 'package:vibely/view/screens/auth/signup_screen.dart';
import 'package:vibely/view/screens/comment_screen.dart';
import 'package:vibely/view/screens/display_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value){
    Get.put(AuthController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}


