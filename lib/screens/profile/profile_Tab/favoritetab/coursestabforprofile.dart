import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import '../../../../utils/colors/colors.dart';
import '../../../../utils/responsive.dart';
import '../../../home_screen/CourseDetails.dart';

class profilecourses extends StatefulWidget {
  @override
  _profilecoursesState createState() => _profilecoursesState();
}

class _profilecoursesState extends State<profilecourses> {
  Measurements? size;

  @override
  Widget build(BuildContext context) {
    size = Measurements(MediaQuery.of(context).size);
    return Scaffold(
        backgroundColor: play,
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                      alignment: Alignment.topLeft,
                                      width: getWidth(context) / 6,
                                      height: getHeight(context) / 15,
                                      child: Image.asset(
                                          "assets/tver-state-medical-university-logo 1.png")),
                                  Flexible(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "M.B.B.S",
                                          style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 16,
                                              color: Cprimary,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "Tver State Medical University",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Roboto',
                                              color: Cprimary,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "Tver, Russia",
                                          style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 10,
                                              color: grey3,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              vGap(10),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time_outlined,
                                        size: 25,
                                        color: Cprimary,
                                      ),
                                      hGap(10),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "60 Months",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'Roboto',
                                                color: Cprimary,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          vGap(5),
                                          Text(
                                            "Duration",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  hGap(15),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        size: 25,
                                        color: Cprimary,
                                      ),
                                      hGap(10),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Fall / Spring",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'Roboto',
                                                color: Cprimary,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          vGap(5),
                                          Text(
                                            "Intake",
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Bookmark"),
                            vGap(25),
                            Container(
                              height: size?.hp(3.7),
                              width: size?.wp(16.5),
                              decoration: BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CourseDetails()));
                                },
                                child: const Text('View',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: Colors.white)),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
