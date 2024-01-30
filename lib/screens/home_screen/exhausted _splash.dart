import 'dart:async';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../utils/avatar.dart';
import '../../utils/colors/colors.dart';
import '../../utils/responsive.dart';
import '../../widgets/long_button.dart';
import '../exploreUniversity_screen/exploreCoursesTab.dart';
import '../notification/notification.dart';
import 'exhuasted_bottom.dart';
import 'happy_splash.dart';
import 'sad_splash.dart';

class ExhuastedSplash extends StatefulWidget {
  const ExhuastedSplash({Key? key}) : super(key: key);

  @override
  State<ExhuastedSplash> createState() => _ExhuastedSplashState();
}

class _ExhuastedSplashState extends State<ExhuastedSplash> {
  Measurements? size;

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
        () => Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.bottomToTop,
                child: ExhaustedBottom())));
  }

  @override
  Widget build(BuildContext context) {
    size = Measurements(MediaQuery.of(context).size);
    return Scaffold(
        backgroundColor: vBarBgcolor,
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
                          builder: (context) => NotificationScreen()));
                })
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Center(
                child: Container(
                  alignment: Alignment.center,
                  height: size?.hp(6),
                  width: size?.wp(95),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(192, 235, 231, 1),
                      borderRadius: BorderRadius.circular(25)),
                  child: Text(
                    '\"Focus on the outcome, not the obstacle\"',
                    textScaleFactor: 1.2,
                    style: TextStyle( fontFamily: 'Roboto',
                        color: primaryColor, fontWeight: FontWeight.bold),
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
                            spreadRadius: 2)
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Explore Courses & Universities',
                        textScaleFactor: 1.8,
                        style: TextStyle( fontFamily: 'Roboto',
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
                                      color: grey2)
                                ]),
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
                                  '300+',
                                  textScaleFactor: 1.5,
                                  style: TextStyle( fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  'Universiteis',
                                  style: TextStyle( fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w800,
                                  ),
                                )
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
                                      color: grey2)
                                ]),
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
                                  style: TextStyle( fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  'Courses',
                                  style: TextStyle( fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w800,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      LongButton(
                          action: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ExploreCourses()));
                          },
                          text: 'Explore Now'),
                    ],
                  ),
                ),
              ),
              Center(
                  child: CircularProgressIndicator(
                color: Cprimary,
                backgroundColor: secondaryColor,
              ))
            ])));
  }
}
