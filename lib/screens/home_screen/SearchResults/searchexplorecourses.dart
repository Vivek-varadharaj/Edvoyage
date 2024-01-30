import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;

import '../../../_env/env.dart';
import '../../../utils/colors/colors.dart';
import '../../../utils/responsive.dart';
import '../../Study_abroad-Screen/studyabroadscreen.dart';

import '../../sort_screens/sort_home.dart';

class University {
  int id;
  String name;
  String location;
  String country;
  String logo;

  University({
    required this.id,
    required this.name,
    required this.location,
    required this.country,
    required this.logo,
  });

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      name: json['name'] ?? 'Default Name',
      location: json['location'] ?? 'Default Location',
      country: json['country'] ?? 'Default Description',
      logo: json['logo'] ?? 'Default Logo',
      id: json['id'] ?? 0,
    );
  }
}

class SearchExploreCourses extends StatefulWidget {
  String query = '';

  SearchExploreCourses({required this.query});

  @override
  _ExploreCoursesState createState() => _ExploreCoursesState();
}

class _ExploreCoursesState extends State<SearchExploreCourses> {
  late Future<List<University>> universitiesFuture;

  @override
  void initState() {
    super.initState();
    universitiesFuture = searchUniversities();
  }

  Future<List<University>> searchUniversities() async {
    try {
      final query = widget.query;
      final response = await http.get(
        Uri.parse(
          BaseUrl.univSearch + '?query=$query',
        ),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        if (responseData["success"] == true) {
          setState(() {
            universities = List<Map<String, dynamic>>.from(
                responseData['data'] as Iterable);
          });
          return universities
              .map((university) => University.fromJson(university))
              .toList();
        } else {
          // Handle the case when success is false
          print('Request failed with success: false');
          return [];
        }
      } else {
        // Handle other HTTP status codes
        print('Request failed with status: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      // Handle other errors
      print('Error: $e');
      return [];
    }
  }

  @override
  Measurements? size;

  Widget build(BuildContext context) {
    size = Measurements(MediaQuery.of(context).size);
    return SafeArea(
      child: Scaffold(
        backgroundColor: color3,
        appBar: AppBar(
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(150.0),
              bottomRight:
                  Radius.circular(150.0), // Adjust the border radius as needed
            ),
          ),
          toolbarHeight: 70.0,
          primary: false,
          backgroundColor: Colors.white,
          title: Container(
            height: 30,
            child: TextFormField(
              onFieldSubmitted: (query) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchExploreCourses(query: query)),
                );
              },
              decoration: InputDecoration(
                fillColor: Colors.black12,
                filled: true,
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                hintText: "Search University",
                hintStyle: TextStyle( fontFamily: 'Roboto', color: textColor),
                prefixIcon: Icon(Icons.search, color: iconcolor, size: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                  borderSide: BorderSide(color: grey2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                  borderSide: BorderSide(color: Colors.black12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                  borderSide: BorderSide(color: grey2),
                ),
              ),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Cprimary,
              ),
            ),
          ),
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SortHome()));
                  },
                  icon: Image.asset("assets/filter.png"),
                ),
              ),
            ),
          ],
        ),
        body: FutureBuilder<List<University>>(
            future: universitiesFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Show a loading indicator while data is being fetched
              } else if (snapshot.hasError) {
                print(snapshot.error); // Show an error if something went wrong
                return Text('Error: ${snapshot.error}');
              } else {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      University university = snapshot.data![index];

                      return ListView.builder(
                          itemCount: 1, // Sample university data
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                                top: 8.0,
                              ),
                              child: Card(
                                semanticContainer: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                elevation: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                "assets/tver-state-medical-university-logo 1.png",
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                university.name,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: 'Roboto',
                                                    color: Cprimary,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              vGap(4),
                                              Text(
                                                university.location +
                                                    ", " +
                                                    university.country,
                                                style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 12,
                                                    color: grey3,
                                                    fontWeight:
                                                        FontWeight.w600),
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
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Text(
                                                    "1990",
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 12,
                                                        color: grey3,
                                                        fontWeight:
                                                            FontWeight.w600),
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
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  SizedBox(
                                                    width: 3,
                                                  ),
                                                  RatingBar.builder(
                                                    initialRating:
                                                        3.5, // Set the initial rating value
                                                    minRating:
                                                        1, // Minimum rating
                                                    direction: Axis.horizontal,
                                                    allowHalfRating:
                                                        true, // Allow half-star ratings
                                                    itemCount:
                                                        5, // Number of stars
                                                    itemSize:
                                                        17, // Size of each star
                                                    itemBuilder: (context, _) =>
                                                        Icon(
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
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.bookmark_outline_sharp,
                                              color: Colors.grey,
                                              size: 30,
                                            ),
                                            onPressed: () {},
                                          ),
                                          Container(
                                            height: size?.hp(4),
                                            width: size?.wp(25),
                                            decoration: BoxDecoration(
                                              color: secondaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          UniversitHomeScreen(
                                                              id: university
                                                                  .id)),
                                                );
                                              },
                                              child: const Text(
                                                'View',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Roboto',
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    });
              }
            }),
      ),
    );
  }

  List<Map<String, dynamic>> universities = [];
}
