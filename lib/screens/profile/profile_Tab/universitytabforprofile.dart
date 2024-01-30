import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import '../../../../utils/colors/colors.dart';
import '../../../../utils/responsive.dart';

class profileuniversity extends StatefulWidget {
  @override
  _profileuniversityState createState() => _profileuniversityState();
}

class _profileuniversityState extends State<profileuniversity> {
  double? _rating;
  IconData? _selectedIcon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color3,
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    semanticContainer: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  alignment: Alignment.topLeft,
                                  width: getWidth(context) / 6,
                                  height: getHeight(context) / 15,
                                  child: Image.asset(
                                      "assets/tver-state-medical-university-logo 1.png")),
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Tver State Medical University",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Roboto',
                                            color: Cprimary,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "Tver, Russia",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Roboto',
                                            color: grey3,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      vGap(20),
                                      Text(
                                        "Estd : 1990",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Roboto',
                                            color: grey3,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "DV Rank",
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 14,
                                                color: grey3,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          hGap(10),
                                          RatingBar.builder(
                                            initialRating: _rating ?? 0.0,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 10,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 0),
                                            itemBuilder: (context, _) => Icon(
                                              _selectedIcon ?? Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              _rating = rating;
                                              setState(() {});
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(""),
                              vGap(25),
                              ElevatedButton(
                                onPressed: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             UniversitHomeScreen()));
                                },
                                // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),CourseDetails
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: secondaryColor,
                                    elevation: 2.0,
                                    textStyle: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: Colors.white)),
                                child: const Text('View'),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
