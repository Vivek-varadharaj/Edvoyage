import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:http/http.dart' as http;
import '../../_env/env.dart';
import '../../utils/Toasty.dart';
import '../../utils/avatar.dart';
import '../../utils/colors/colors.dart';
import '../../utils/responsive.dart';
import 'package:logger/logger.dart';
import 'package:get/get.dart';
import '../../widgets/back_arrow_button.dart';
import '../../widgets/long_button.dart';
import '../home_screen/homeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Otp extends StatefulWidget {
  String complete = "";
  Otp({Key? key, required this.complete}) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  OtpFieldController otpController = OtpFieldController();
  String otps = "";

  Measurements? size;

  @override
  Widget build(BuildContext context) {
    size = Measurements(MediaQuery.of(context).size);
    return Scaffold(
      backgroundColor: thirdColor,
      body: SingleChildScrollView(
        child: Container(
            color: thirdColor,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                height: size?.hp(5),
              ),
              const Row(
                children: [
                  BackArrow(),
                ],
              ),
              SizedBox(
                height: size?.hp(30),
                width: size?.wp(60),
                child: Image.asset(
                  otp,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: size?.hp(1),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Stack(
                  children: [
                    Container(
                      height: size?.hp(5),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Enter OTP',
                        textScaleFactor: 2.2,
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: size?.hp(4.5),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 1.5),
                          height: size?.hp(.4),
                          width: size?.wp(9),
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size?.hp(3),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "A 6 digit code has been sent to\n your mobile number",
                        textScaleFactor: 1.4,
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color.fromARGB(255, 67, 56, 56),
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size?.hp(5),
              ),
              OTPTextField(
                controller: otpController,
                length: 6,
                width:
                    300, // Replace with a suitable width or define getWidth function
                textFieldAlignment: MainAxisAlignment.spaceBetween,
                fieldWidth: 40,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 10,
                style: const TextStyle(fontSize: 17, fontFamily: 'Roboto',),
                onChanged: (value) {
                  otps = value;
                  print("-----");
                  print(otps);
                },
              ),
              SizedBox(
                height: size?.hp(6),
              ),
              LongButton(
                action: () async {
                  if (otps.isNotEmpty) {
                    try {
                      final response = await http.post(
                        Uri.parse(BaseUrl.verifyotp),
                        body: {
                          "otp": otps,
                          "username": widget.complete,
                        },
                      );

                      if (response.statusCode == 200) {
                        final Map<String, dynamic> data =
                            json.decode(response.body);

                        if (data['status'] == true) {
                          // Set isLoggedIn in SharedPreferences
                          await setLoggedInStatus(true);

                          // Update GetX controller
                          Get.find<MyController>().setIsLoggedIn(true);

                          // Navigate to HomeScreen
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        } else {
                          Logger().d("OTP not verified");
                          Toasty.showtoast(
                              "OTP not verified: ${data['message']}");
                        }
                      } else {
                        Logger().d(
                            "Error during OTP verification: ${response.body}");
                        Toasty.showtoast("Error during OTP verification");
                      }
                    } catch (error) {
                      Logger().e("Exception during OTP verification: $error");
                      Toasty.showtoast("Exception during OTP verification");
                    }
                  } else {
                    Toasty.showtoast("Enter Otp");
                  }
                },
                text: 'Verify',
              ),
            ])),
      ),
    );
  }
}

class MyController extends GetxController {
  var isLoggedIn = false.obs;

  void setIsLoggedIn(bool value) {
    isLoggedIn.value = value;
  }
}

// Function to set isLoggedIn status in SharedPreferences
Future<void> setLoggedInStatus(bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', value);
}
