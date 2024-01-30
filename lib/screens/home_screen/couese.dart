import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utils/colors/colors.dart';
import '../../utils/responsive.dart';
import '../../widgets/long_button.dart';
import '../../widgets/longarrow/long_arrow.dart';
import '../../widgets/longarrow/long_arrow1.dart';
import '../../widgets/longarrow/long_arrow2.dart';
import '../../widgets/longarrow/long_arrow3.dart';
import '../../widgets/longarrow/long_arrow4.dart';
import '../../widgets/tver_modal.dart';

class coursesTab extends StatefulWidget {
  @override
  _coursesTabState createState() => _coursesTabState();
}

class _coursesTabState extends State<coursesTab> {
  TextEditingController timeinput = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    timeinput.text = "";
    dateinput.text = "";
    super.initState();
  }

  late int activeMeterIndex;
  final StreamController activeMeterIndexStreamControl =
      StreamController.broadcast();
  Stream get onUpdateActiveIndex => activeMeterIndexStreamControl.stream;
  void updateExpansionTile() =>
      activeMeterIndexStreamControl.sink.add(activeMeterIndex);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color3,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 18, right: 18, bottom: 5, top: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "M.B.B.S",
                              style: TextStyle(
                                  fontSize: 22,
                                  letterSpacing: 1,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w700,
                                  color: Cprimary),
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
                        hGap(10),
                        Container(
                          height: 70,
                          width: 110,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: primaryColor, // Border color
                              width: 2, // Border width
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '\$20,000',
                                style: TextStyle(
                                    fontSize: 22,
                                    letterSpacing: 1,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w600,
                                    color: secondaryColor),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'Grand Total',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    color: secondaryColor),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 18, right: 18, bottom: 5, top: 5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fee Structure",
                          style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 1,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              color: Cprimary),
                        ),
                        Divider(
                          thickness: 1,
                          color: grey2,
                        ),
                        const LongArrow(),
                        const longarrow1(),
                        const longarrow2(),
                        const longarrow3(),
                        const longarrow4(),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Grand Total",
                                style: TextStyle(
                                   fontFamily: 'Roboto',
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                              hGap(25),
                              Text(
                                "\$4000",
                                style: TextStyle(
                                   fontFamily: 'Roboto',
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: White),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Curriculum",
                      style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 1,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          color: Cprimary),
                    ),
                    Divider(
                      thickness: 1,
                      color: grey2,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int i) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 10.0,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  child: StreamBuilder(
                                      stream: onUpdateActiveIndex,
                                      builder: (context, snapShot) {
                                        return const ExpansionTile(
                                          title: Text(
                                            "1st Year",
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.bold),
                                          ),
                                          children: <Widget>[
                                            Divider(
                                              color: titlecolor,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 25.0,
                                                  top: 10,
                                                  bottom: 10,
                                                  right: 18),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.circle,
                                                        size:
                                                            6, // Adjust the size of the dot as needed
                                                        color: Colors
                                                            .black, // Adjust the color of the dot as needed
                                                      ),
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      Text(
                                                        "Subject  1",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: text5,
                                                            fontFamily:
                                                                'Roboto',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    "10",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: 'Roboto',
                                                        color: text5,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 25.0,
                                                  top: 10,
                                                  bottom: 10,
                                                  right: 18),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.circle,
                                                        size:
                                                            6, // Adjust the size of the dot as needed
                                                        color: Colors
                                                            .black, // Adjust the color of the dot as needed
                                                      ),
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      Text(
                                                        "Subject  2",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: text5,
                                                            fontFamily:
                                                                'Roboto',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    "15",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: text5,
                                                        fontFamily: 'Roboto',
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 25.0,
                                                  top: 10,
                                                  bottom: 10,
                                                  right: 18),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.circle,
                                                        size:
                                                            6, // Adjust the size of the dot as needed
                                                        color: Colors
                                                            .black, // Adjust the color of the dot as needed
                                                      ),
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      Text(
                                                        "Subject  3",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: text5,
                                                            fontFamily:
                                                                'Roboto',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    "20",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: text5,
                                                        fontFamily: 'Roboto',
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 25.0,
                                                  top: 10,
                                                  bottom: 10,
                                                  right: 18),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.circle,
                                                        size:
                                                            6, // Adjust the size of the dot as needed
                                                        color: Colors
                                                            .black, // Adjust the color of the dot as needed
                                                      ),
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      Text(
                                                        "Subject  4",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: text5,
                                                            fontFamily:
                                                                'Roboto',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    "10",
                                                    style: TextStyle(
                                                       fontFamily: 'Roboto',
                                                        fontSize: 16,
                                                        color: text5,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 25.0,
                                                  top: 10,
                                                  bottom: 10,
                                                  right: 18),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.circle,
                                                        size:
                                                            6, // Adjust the size of the dot as needed
                                                        color: Colors
                                                            .black, // Adjust the color of the dot as needed
                                                      ),
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      Text(
                                                        "Subject  5",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: text5,
                                                            fontFamily:
                                                                'Roboto',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    "15",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: 'Roboto',
                                                        color: text5,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                              ],
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 18, right: 18, bottom: 5, top: 5),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: White, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Eligibility",
                      style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 1,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          color: Cprimary),
                    ),
                    Divider(
                      thickness: 1,
                      color: grey2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 18.0, top: 10, bottom: 10, right: 18),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: Cprimary,
                          ),
                          hGap(15),
                          Text("NEET",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  color: text5))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 18, right: 18, bottom: 5, top: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.cancel_outlined,
                            color: Cprimary,
                          ),
                          hGap(15),
                          Text("IELTS",
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: text5))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 18, right: 18, bottom: 5, top: 5),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: White, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Required Documents",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          letterSpacing: 1,
                          fontWeight: FontWeight.w700,
                          color: Cprimary),
                    ),
                    Divider(
                      thickness: 1,
                      color: text5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 18.0, top: 10, bottom: 10, right: 18),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: Cprimary,
                          ),
                          hGap(15),
                          Text("Passport",
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: text5))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 18.0, top: 10, bottom: 10, right: 18),
                      child: Row(
                        children: [
                          Icon(
                            Icons.cancel_outlined,
                            color: Cprimary,
                          ),
                          hGap(15),
                          Text("IELTS",
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: text5))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 18.0, top: 10, bottom: 10, right: 18),
                      child: Row(
                        children: [
                          Icon(
                            Icons.cancel_outlined,
                            color: Cprimary,
                          ),
                          hGap(15),
                          Text("10Th Cart",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  color: text5))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 18.0, top: 10, bottom: 10, right: 18),
                      child: Row(
                        children: [
                          Icon(
                            Icons.cancel_outlined,
                            color: Cprimary,
                          ),
                          hGap(15),
                          Text("12Th Cart",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  color: text5))
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 18.0, top: 10, right: 18),
                      child: Row(
                        children: [
                          Icon(
                            Icons.cancel_outlined,
                            color: Cprimary,
                          ),
                          hGap(15),
                          Text("Visa",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  color: text5))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 18, right: 18, bottom: 15, top: 5),
              child: LongButton(
                text: 'Apply Now',
                action: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) =>
                  //       UniversitHomeScreen(), // Replace with the actual screen you want to navigate to
                  // ));
                  displayModalBottomSheet(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void displayModalBottomSheet(context) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      ),
    ),
    isScrollControlled: true,
    context: context,
    builder: (BuildContext bc) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: whiteColor,
          ),
          height: getHeight(context) / 2,
          child: Column(
            children: [DropDownDemo()],
          ),
        ),
      );
    },
  );
}
