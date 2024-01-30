import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import '../../../../utils/colors/colors.dart';
import '../../../../utils/responsive.dart';
import '../../../_env/env.dart';
import '../../home_screen/CourseDetails.dart';

class profilecourses extends StatefulWidget {
  @override
  _profilecoursesState createState() => _profilecoursesState();
}

class _profilecoursesState extends State<profilecourses> {
  // Replace 'BaseUrl.course' with the actual base URL for your course API.
  static const String apiUrl = BaseUrl.course;

  List<Course> courses = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        courses =
            data.map((courseData) => Course.fromJson(courseData)).toList();
      });
    } else {
      throw Exception('Failed to load courses');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: play,
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final Course course = courses[index];

          return Padding(
            padding: const EdgeInsets.all(12),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
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
                                child: Image.asset(course.logo),
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      course.name,
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 16,
                                        color: Cprimary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      course.university,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Roboto',
                                        color: Cprimary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      course.location,
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 10,
                                        color: grey3,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          vGap(10),
                          Text(
                            "Intake",
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 10,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(""),
                        vGap(25),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CourseDetails(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: secondaryColor,
                            elevation: 2.0,
                            textStyle: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                            ),
                          ),
                          child: const Text('View'),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Course {
  final String name;
  final String university;
  final String location;
  final String logo;

  Course({
    required this.name,
    required this.university,
    required this.location,
    required this.logo,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      name: json['name'],
      university: json['university'],
      location: json['location'],
      logo: json['logo'],
    );
  }
}
