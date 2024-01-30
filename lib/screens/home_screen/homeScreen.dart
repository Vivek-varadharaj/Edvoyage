import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/_env/env.dart';
import 'package:frontend/screens/home_screen/homescreenreplaceable/homeScreen_happysplash.dart';
import 'package:frontend/screens/home_screen/homescreenreplaceable/homeScreen_sadsplash.dart';
import 'package:frontend/utils/Toasty.dart';
import 'package:frontend/utils/responsive.dart';
import 'package:frontend/widgets/botttom_nav.dart';
import '../../utils/avatar.dart';
import '../../utils/colors/colors.dart';
import '../../widgets/long_button.dart';
import '../exploreUniversity_screen/exploreCoursesTab.dart';
import '../notification/notification.dart';

import 'MCQQuestionWidget.dart';
import 'happy_splash.dart';
import 'homescreenreplaceable/homeScreen_exhaustedmood.dart';
import 'sad_splash.dart';
import 'package:http/http.dart' as http;

enum OptionTitles { one, two, three, four, five, unanswered }

class HomeData {
  final List<dynamic> questionOfTheDayData;

  HomeData({
    required this.questionOfTheDayData,
  });
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Measurements? size;
  int universityLength = 0;
  String? selectedOption;
  late HomeData homeData = HomeData(questionOfTheDayData: []);

  static const unanswered = "";

  @override
  void initState() {
    super.initState();
    fetchData();
    getLengthOfAllUniversities();
  }

  Future<void> getLengthOfAllUniversities() async {
    try {
      var response = await http.get(Uri.parse(BaseUrl.universityList));
      if (response.statusCode == 200) {
        List<dynamic> responseData = json.decode(response.body);

        setState(() {
          universityLength = responseData.length;
        });
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchData() async {
    try {
      var response = await http.get(Uri.parse(BaseUrl.home));

      if (response.statusCode == 200) {
        List<dynamic> responseData = json.decode(response.body);

        if (responseData.isNotEmpty) {
          setState(() {
            homeData = HomeData(
              questionOfTheDayData: responseData,
            );
          });
        } else {
          print('Question data is empty.');
        }
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  DateTime? previousBackPressedTime;

  doubleBackToExit(BuildContext context) async {
    DateTime? currentBackPressedTime;

    currentBackPressedTime = DateTime.now();

    if (previousBackPressedTime != null &&
        currentBackPressedTime.difference(previousBackPressedTime!) <
            Duration(seconds: 2)) {
      exit(0);
    } else {
      previousBackPressedTime = currentBackPressedTime;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Press back again to exit.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    size = Measurements(MediaQuery.of(context).size);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        doubleBackToExit(context);
      },
      child: Scaffold(
        bottomNavigationBar: BottomButton(onTap: () {}, selectedIndex: 2),
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.2,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Container(
            width: 200,
            height: 200,
            child: Image.asset(edvoyagelogo1),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: primaryColor,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 5),
                    height: size?.hp(26),
                    width: size?.wp(95),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromRGBO(192, 235, 231, 1),
                      border: Border.all(color: thirdColor, width: 1.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'How are you feeling today?',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              height: size?.hp(15),
                              width: size?.wp(95),
                              child: Image.asset(
                                'assets/curving.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: size?.hp(10),
                                    width: size?.wp(17.5),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                HomeScreenexhaustedmood(),
                                          ),
                                        );
                                      },
                                      child: Image.asset(
                                        'assets/exhaustedB.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: size?.hp(11),
                                    width: size?.wp(25),
                                    decoration: BoxDecoration(
                                      color: thirdColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Container(
                                      height: size?.hp(10),
                                      width: size?.wp(22),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            PageRouteBuilder(
                                              pageBuilder: (_, __, ___) =>
                                                  HomeScreenhappysplash(),
                                            ),
                                          );
                                        },
                                        child: Image.asset(
                                          'assets/happy.png',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: size?.hp(10),
                                    width: size?.wp(17.5),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                HomeScreensadsplash(),
                                          ),
                                        );
                                      },
                                      child: Image.asset(
                                        'assets/sadB.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 2),
                              height: 10,
                              width: 2,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(.25),
                              ),
                            ),
                            Container(
                              height: 15,
                              width: 3,
                              decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(.25),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 2),
                              height: 10,
                              width: 2,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(.25),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Happy',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: size?.hp(30),
                    width: size?.wp(95),
                    decoration: BoxDecoration(
                      color: thirdColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(1, 1),
                          blurRadius: 2,
                          color: grey2,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Explore Courses & Universities',
                          textScaleFactor: 1.6,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: primaryColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: size?.hp(14),
                              width: size?.wp(42),
                              decoration: BoxDecoration(
                                color: thirdColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    spreadRadius: 1,
                                    color: grey2,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: size?.hp(4.5),
                                    width: size?.wp(9.6),
                                    child: Image.asset(
                                      universityimage,
                                    ),
                                  ),
                                  Text(
                                    universityLength.toString(),
                                    textScaleFactor: 1.5,
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(
                                    'Universities',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: size?.hp(14),
                              width: size?.wp(42),
                              decoration: BoxDecoration(
                                color: thirdColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    spreadRadius: 1,
                                    color: grey2,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: size?.hp(4.5),
                                    width: size?.wp(9.6),
                                    child: Image.asset(
                                      coursesimage,
                                    ),
                                  ),
                                  Text(
                                    '30,000+',
                                    textScaleFactor: 1.5,
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(
                                    'Courses',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        LongButton(
                          action: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ExploreCourses(),
                              ),
                            );
                          },
                          text: 'Explore Now',
                        ),
                      ],
                    ),
                  ),
                ),
                MCQQuestionWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
