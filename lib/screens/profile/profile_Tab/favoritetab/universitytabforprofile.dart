import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import '../../../../utils/colors/colors.dart';
import '../../../../utils/responsive.dart';
import '../../../home_screen/CourseDetails.dart';

class profileuniversity extends StatefulWidget {
  @override
  State<profileuniversity> createState() => _profileuniversityState();
}

class _profileuniversityState extends State<profileuniversity> {
  Measurements? size;

  // List<University> favoriteItems = [];

  // void addToFavorites(University item) {
  //   setState(() {
  //     favoriteItems.add(item);
  //   });
  // }

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
                                          "Tver State Medical University",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'Roboto',
                                              color: Cprimary,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        vGap(4),
                                        Text(
                                          "Tver, Russia",
                                          style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 12,
                                              color: grey3,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        vGap(15),
                                        Row(
                                          children: [
                                            Text(
                                              "ESTD : ",
                                              style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 12,
                                                  color: grey3,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              "1990",
                                              style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 12,
                                                  color: grey3,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        vGap(3),
                                        Row(
                                          children: [
                                            Text(
                                              "DV Rank",
                                              style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 12,
                                                  color: grey3,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            RatingBar.builder(
                                              initialRating:
                                                  3.5, // Set the initial rating value
                                              minRating: 1, // Minimum rating
                                              direction: Axis.horizontal,
                                              allowHalfRating:
                                                  true, // Allow half-star ratings
                                              itemCount: 5, // Number of stars
                                              itemSize: 17, // Size of each star
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {
                                                // Handle when the rating is updated
                                                print(rating);
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              vGap(10),
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
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             UniversitHomeScreen()));
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => CourseDetails()));
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
