import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../../../../utils/colors/colors.dart';
import '../../../../utils/responsive.dart';
import '../../_env/env.dart';
import '../home_screen/CourseDetails.dart';

class CoursesScreenTab extends StatefulWidget {
  @override
  State<CoursesScreenTab> createState() => _CoursesScreenTabState();
}

class _CoursesScreenTabState extends State<CoursesScreenTab> {
  Measurements? size;
  static const String apiUrl = BaseUrl.course;
  List<Course> courses = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      print('Fetching data from: $apiUrl');
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        print('Raw JSON data: $data'); // Add this line to print raw JSON data
        setState(() {
          isLoading = false;
          courses =
              data.map((courseData) => Course.fromJson(courseData)).toList();
        });
        print('Data fetched successfully');
      } else {
        setState(() {
          isLoading = false;
        });
        print('Failed to load courses. Status code: ${response.statusCode}');
        throw Exception('Failed to load courses');
      }
    } catch (e, stackTrace) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching data: $e');
      print('StackTrace: $stackTrace');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color3,
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: courses.length, // Number of sample courses
              itemBuilder: (context, index) {
                final Course course = courses[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                    top: 8.0,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
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
                                          "assets/tver-state-medical-university-logo 1.png"),
                                    ),
                                    Flexible(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                course
                                                    .name, // Sample course name
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 16,
                                                  color: Cprimary,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),

                                              // IconButton(
                                              //     onPressed: (){},
                                              //     icon: Icon(
                                              //       Icons.bookmark_border,)),
                                            ],
                                          ),
                                          vGap(5),
                                          Text(
                                            course.UniversityName,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'Roboto',
                                                color: Cprimary,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          vGap(4),
                                          Text(
                                            course.location,
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
                                              course.duration.toString(),
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
                                              course.season,
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
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.bookmark_border,
                                    color: Colors.grey,
                                    size: 30.0,
                                  )),
                              vGap(25),
                              Container(
                                height: size?.hp(5),
                                width: size?.wp(28.5),
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
  final String season;
  final int duration;
  final bool bookmark;
  final String UniversityName;
  Course(
      {required this.name,
      required this.university,
      required this.location,
      required this.logo,
      required this.duration,
      required this.season,
      required this.bookmark,
      required this.UniversityName});

  factory Course.fromJson(Map<String, dynamic> json) {
    try {
      final university = json['University'];
      final duration = json['Duration'];

      if (university is! String && university is! int) {
        throw FormatException('Invalid University type: $university');
      }

      if (duration is! String && duration is! int) {
        throw FormatException('Invalid Duration type: $duration');
      }

      return Course(
          name: json['Name'] ?? '',
          university:
              university.toString(), // Convert to String if it's not already
          location: json['Place'] ?? '',
          logo: json['logo'] ?? '',
          duration: int.tryParse(duration.toString()) ??
              0, // Convert to int if possible
          season: json['Season'] ?? '',
          bookmark: json['bookmark'] ?? false,
          UniversityName: json['UniversityName'] ?? '');
    } catch (e) {
      print('Error parsing JSON: $e');
      print('JSON data: $json');
      rethrow;
    }
  }
}
