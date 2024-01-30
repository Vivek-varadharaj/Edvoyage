import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../_env/env.dart';
import '../../../utils/colors/colors.dart';
import '../../Study_abroad-Screen/studyabroadscreen.dart';

class ProfileApplication extends StatefulWidget {
  @override
  _ProfileApplicationState createState() => _ProfileApplicationState();
}

class _ProfileApplicationState extends State<ProfileApplication> {
  late Future<List<Application>> futureApplications;

  @override
  void initState() {
    super.initState();
    futureApplications = fetchApplications();
  }

  Future<List<Application>> fetchApplications() async {
    try {
      final response =
          await http.get(Uri.parse(BaseUrl.viewallapplicationsubmit));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body)['data'];
        print("API Response: $responseData"); // Add this line

        List<Application> applications =
            responseData.map((data) => Application.fromJson(data)).toList();

        return applications;
      }

      throw Exception('Failed to load applications');
    } catch (error) {
      print("Error during fetchApplications: $error");
      throw Exception('Unexpected error occurred!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cblack10,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: FutureBuilder<List<Application>>(
              future: futureApplications,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('No data available.');
                } else {
                  List<Application> applications = snapshot.data!;
                  return Column(
                    children: applications
                        .map(
                          (application) => Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 4,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255)),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        _buildColumn(
                                          application.name,
                                        ),
                                        _buildColumn(
                                          application.year,
                                        ),
                                      ],
                                    ),
                                    _buildColumn(
                                      application.month,
                                    ),
                                    SizedBox(height: 8.0),
                                    Align(
                                      alignment: Alignment.center,
                                      child: ElevatedButton(
                                        // Give red color to the button,make little wider more and little less height

                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.red,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          textStyle: TextStyle(
                                             fontFamily: 'Roboto',
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () {
                                          // navigate to another screen on button click
                                          // also with passing the id to that screen
                                          // i am passing the screen class name

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UniversitHomeScreen(
                                                        id: application
                                                            .university_id)),
                                          );
                                        },
                                        child: Text("View"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColumn(String value) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto',),
          ),
        ),
        SizedBox(height: 8.0),
      ],
    );
  }
}

class Application {
  final int id;
  final String month;
  final String year;
  final String name;
  final String emailId;
  final int user;
  final int university_id;
  final String createdBy;
  final String universityName;

  Application({
    required this.id,
    // university_id
    required this.university_id,
    required this.month,
    required this.year,
    required this.name,
    required this.emailId,
    required this.user,
    required this.createdBy,
    required this.universityName,
  });

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      id: json['id'] ?? 0,
      month: json['month'] ?? '',
      year: json['year'] ?? '',
      name: json['name'] ?? '',
      emailId: json['email_id'] ?? '',
      user: json['user'] ?? 0,
      university_id: json['university_id'] ?? 0,
      createdBy: json['created_by'] ?? '',
      universityName: json['university'] != null
          ? json['university']['University_name'] ?? ''
          : '',
    );
  }
}
