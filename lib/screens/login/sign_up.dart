import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import '../../_env/env.dart';
import '../../utils/avatar.dart';
import '../../utils/colors/colors.dart';
import '../../utils/hive_utils.dart';
import '../../utils/responsive.dart';
import '../../utils/session_key.dart';
import '../../widgets/long_button.dart';
import 'otp.dart';
import 'privacy_policy.dart';
import 'terms_n_condition.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Measurements? size;

  @override
  Widget build(BuildContext context) {
    MyController myController = MyController();
    Get.put(myController);
    size = Measurements(MediaQuery.of(context).size);
    return Scaffold(
      backgroundColor: thirdColor,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Container(
            color: thirdColor,
            child: Column(
              children: [
                SizedBox(
                  height: size?.hp(2),
                ),
                Container(
                  height: size?.hp(42),
                  width: size?.wp(80),
                  child: Image.asset(signup),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Sign up',
                          textScaleFactor: 2.275,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: size?.hp(4.3),
                          ),
                          Container(
                            height: size?.hp(.4),
                            width: size?.wp(6),
                            margin: EdgeInsets.only(left: 1.5),
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size?.hp(1),
                ),
                Container(
                  width: size?.wp(87),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: size?.hp(1),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 80,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _countryController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Invalid';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.phone,
                                  color: primaryColor,
                                  size: 25,
                                ),
                                label: Text(
                                  '91',
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: grey2,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _mobile,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Mobile Number & Country code';
                                }
                                return null;
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(13),
                              ],
                              decoration: InputDecoration(
                                label: Text(
                                  '  Mobile',
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: grey2,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size?.hp(4),
                ),
                Container(
                  width: size?.wp(88),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Text(
                            'By signing up, you agree to our',
                            textScaleFactor: 1,
                            style: TextStyle(
                              color: grey2,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => terms_condition(),
                              ));
                            },
                            child: Text(
                              'Terms & Conditions',
                              textScaleFactor: 1.1,
                              style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        child: Row(
                          children: [
                            Text(
                              'and',
                              textScaleFactor: 1,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: grey2,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Container(
                              height: size?.hp(4.75),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (ctx) => privacy(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Privacy Policy',
                                  textScaleFactor: 1.1,
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size?.hp(2.4),
                ),
                LongButton(
                  action: () async {
                    if (formKey.currentState!.validate()) {
                      String country = _countryController.text.trim();
                      String mobile = _mobile.text.trim();
                      String complete = country + mobile;
                      print("-------------------");
                      print("-------------------");
                      print("-------------------");
                      print(complete);
                      print("-------------------");
                      print("-------------------");
                      print("-------------------");
                      print("-------------------");

                      try {
                        var response = await http.post(
                          Uri.parse(BaseUrl.register),
                          body: {
                            'country_code': country,
                            'mobile_number': mobile,
                            'complete': complete,
                          },
                        );

                        print("Response Body: ${response.body}");
                        print("Response Body success: ${response.body[0]}");
                        Map<String, dynamic> responseJson =
                            json.decode(response.body);

                        // Accessing fields in the Dart object
                        bool success = responseJson['success'];
                        String message = responseJson['message'];
                        Map<String, dynamic> data = responseJson['data'];
                        String username = data['username'];
                        String otp = data['otp'];

                        // Print the values
                        print('Success: $success');
                        print('Message: $message');
                        print('Username: $username');
                        print('OTP: $otp');

                        if (success) {
                          print("TRUEEEE BODYYYYY");
                          Fluttertoast.showToast(
                            msg:
                                "OTP sent successfully. Heading to the verification screen.",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                          );

                          Get.find<MyController>().setIsLoggedIn(false);

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => Otp(
                                complete: complete,
                              ),
                            ),
                          );
                        } else {
                          // Display a toast based on the message received
                          Fluttertoast.showToast(
                            msg: message,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                          );
                        }
                      } catch (error) {
                        // Handle errors
                        print(error);
                        // Display an error toast
                        Fluttertoast.showToast(
                          msg: "Error: OTP not sent. Please try again.",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                      }
                    }
                  },
                  text: 'Continue',
                ),
                SizedBox(
                  height: size?.hp(.25),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
