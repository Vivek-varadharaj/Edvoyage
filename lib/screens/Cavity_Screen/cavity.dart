import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math' as math;
import '../../utils/avatar.dart';
import '../../utils/colors/colors.dart';
import '../../utils/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class Cavity_screen extends StatefulWidget {
  @override
  State<Cavity_screen> createState() => _Cavity_screenState();
}

class _Cavity_screenState extends State<Cavity_screen> {
  var isPressed = false;
  var isbookmark = false;
  var selectedIndex;
  Color color2 = Color.fromARGB(255, 97, 75, 75);
  Color color1 = Color.fromARGB(255, 34, 163, 29);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.3, // You can adjust the elevation as needed
          centerTitle: true,
          title: Container(
            width: 200, // Set the width of the container
            height: 200, // Set the height of the container
            child: Image.asset(
                edvoyagelogo1), // Replace with the actual image path
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(soon),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'COMING  SOON!!!!...',
              style: GoogleFonts.jost(
                  letterSpacing: 3,
                  fontSize: 27,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                Fluttertoast.showToast(
                  msg: 'You will be notify through SMS', // Your message here
                  toastLength: Toast.LENGTH_SHORT, // Duration of the message
                  gravity: ToastGravity
                      .BOTTOM, // Location of the message on the screen
                  backgroundColor:
                      Colors.black.withOpacity(0.7), // Background color
                  textColor: Colors.white, // Text color
                );
              },
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Button's border radius
                ),
                textStyle: TextStyle(
                  fontSize: 16, // Text font size
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto" // Text font weight
                ),
              ),
              child: Text('NOTIFY ME'), // Text displayed on the button
            )
          ],
        ),
      ),
    );
  }

  void displayModalBottomSheet(context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        context: context,
        builder: (BuildContext bc) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: whiteColor,
            ),
            height: getHeight(context) / 5,
            child: Column(
              children: [
                Container(
                  height: 8,
                  width: 60,
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: cblack10,
                  ),
                ),
                vGap(25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: getHeight(context) / 8,
                      width: getWidth(context) / 4,
                      margin: EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: cblack10,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.book_online,
                                size: 20,
                              ),
                            ),
                            Text(
                              "Save",
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: titlecolor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: getHeight(context) / 8,
                      width: getWidth(context) / 4,
                      margin: EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: cblack10,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.rotate(
                              angle: -math.pi / 2,
                              child: IconButton(
                                icon: Icon(
                                  Icons.logout,
                                  color: titlecolor,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Text(
                              "Share",
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: titlecolor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: getHeight(context) / 8,
                      width: getWidth(context) / 4,
                      margin: EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: cblack10,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.report_outlined,
                                color: secondaryColor,
                                size: 20,
                              ),
                            ),
                            Text(
                              "Report",
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: secondaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
