import 'package:flutter/material.dart';

import 'package:get/get.dart';
// Import necessary packages
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../_env/env.dart';
import '../../utils/avatar.dart';
import '../University_tabs/FeedTab.dart';
import '../University_tabs/GalleryTab.dart';
import '../University_tabs/aboutTab.dart';
import '../University_tabs/courses_screenTab.dart';
import '../../utils/BottomNavigation/controller.dart';
import '../../utils/colors/colors.dart';
import '../../utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../WebPage/webpage.dart';

BottomNavigationController controller = Get.put(BottomNavigationController());

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

class UniversitHomeScreen extends StatefulWidget {
  final int? id;

  UniversitHomeScreen({
    Key? key,
    required this.id, // Change here to make id required
  }) : super(key: key);

  @override
  State<UniversitHomeScreen> createState() => _UniversitHomeScreenState();
}

class _UniversitHomeScreenState extends State<UniversitHomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  late University university;
  bool isLoading = true;

  // Wrap your asynchronous operation in a separate function
  _loadUniversityData() async {
    try {
      final universityData = await _followUniversity(widget.id);
      setState(() {
        isLoading = false;
        university = University.fromJson(jsonDecode(universityData));
      });
    } catch (e) {
      print('Error loading university data: $e');
      isLoading = false;
    }
  }

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);
    _loadUniversityData();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  @override
  Widget build(BuildContext context) {
    final labelTextStyle = Theme.of(context)
        .textTheme
        .titleSmall!
        .copyWith(fontFamily: 'Roboto', fontSize: 8.0);
    return Obx(() {
      int index = controller.tabIndex.toInt();

      return Scaffold(
        backgroundColor: White,
        appBar: AppBar(
          backgroundColor: White,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios, color: Cprimary)),
          title: Container(
            width: 200, // Set the width of the container
            height: 200, // Set the height of the container
            child: Image.asset(
                edvoyagelogo1), // Replace with the actual image path
          ),
        ),
        body: SafeArea(
          child: isLoading ? Center(
            child:CircularProgressIndicator() ,
          ):
           Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150.0,
                    decoration: BoxDecoration(
                        color: White,
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: AssetImage("assets/Rectangle_1008.png"),
                            fit: BoxFit.cover)),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 2.3,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      width: 100,
                      height: 90.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/logo_2.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(university!.name),
                      hGap(5),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WebPageLoad()));
                        },
                        child: Image.asset(
                          "assets/external-link-alt.png",
                          width: 10,
                          height: 10,
                        ),
                      ),
                    ],
                  ),
                  vGap(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on),
                      hGap(5),
                      Text(university!.location + ' , ' + university!.country),
                    ],
                  ),
                  vGap(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Ctext2),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(color: grey2),
                              ),
                            )),
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: ((context) => chatHome())));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Follow',
                              style: TextStyle(
                                  fontFamily: 'Roboto', color: fourthColor),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                      hGap(25),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Ctext2),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(color: grey2),
                                ),
                              )),
                          onPressed: () {},
                          child: Icon(
                            Icons.download,
                            color: fourthColor,
                          )),
                      hGap(25),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Ctext2),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(color: grey2),
                              ),
                            )),
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Cavity_screen()));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Apply',
                              style: TextStyle(
                                  fontFamily: 'Roboto', color: fourthColor),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              vGap(5),
              Container(
                color: White,
                child: TabBar(
                  unselectedLabelColor: Colors.grey,
                  labelColor: Cprimary,
                  controller: _tabController,
                  indicatorColor: Cprimary,
                  labelStyle: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontSize: 15.0, color: Colors.orange),
                  unselectedLabelStyle:
                      Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontSize: 14.0,
                            color: Colors.grey[200],
                          ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: const [
                    Tab(child: Text('About')),
                    Tab(child: Text('Feed')),
                    Tab(child: Text('Courses')),
                    Tab(child: Text('Gallery')),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    AboutTab(id: widget.id!),
                    FeedTab(),
                    CoursesScreenTab(),
                    GalleryTab(id: widget.id!),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  _launchURL() async {
    const url = 'https://www.google.com';
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }
}

Future<String> _followUniversity(int? universityId) async {
  print('${BaseUrl.universityDetails}?id=$universityId');
  final response = await http.get(
    Uri.parse('${BaseUrl.universityDetails}?id=$universityId'),
  );

  if (response.statusCode == 200) {
    // Handle success
    print('Successfully followed university');
    // You can parse and use the response data here if needed
    return response.body;
  } else {
    // Handle failure
    print('Failed to follow university');
    throw Exception(
        'Failed to follow university'); // You can customize the exception message
  }
}
