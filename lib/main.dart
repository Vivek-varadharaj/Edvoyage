import 'package:flutter/material.dart';
import 'package:frontend/screens/home_screen/homeScreen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/splash/splash_screen.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Call the method to check login status when the controller is initialized
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    // Example: Check if the user is already logged in using SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isUserLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    print("--------------");
    print("--------------");
    print("--------------");
    print("--------------");
    print("--------------");
    print("--------------");
    print("--------------");
    print("--------------");

    print(isUserLoggedIn);
    print("--------------");
    print("--------------");
    print("--------------");
    print("--------------");
    print("--------------");

    // Update the isLoggedIn variable based on the authentication logic
    isLoggedIn.value = isUserLoggedIn;
  }
}

class MyApp extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Obx(
      //   () => authController.isLoggedIn.value ? HomeScreen() : SplashScreen(),
      // ),
      home: HomeScreen(),
    );
  }
}

void main() => runApp(MyApp());
