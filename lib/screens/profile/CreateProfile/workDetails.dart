import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../../_env/env.dart';
import '../../../utils/colors/colors.dart';
import '../../../utils/responsive.dart';
import '../../../widgets/long_button.dart';

class WorkDetails extends StatefulWidget {
  @override
  _WorkDetailsState createState() => _WorkDetailsState();
}

class _WorkDetailsState extends State<WorkDetails> {
  Measurements? size;
  TextEditingController positionController = TextEditingController();
  String? startYearDropdownValue;
  String? endYearDropdownValue;
  bool pursuingCheckbox = false;
  List<int> years = [
    1990,
    1991,
    1992,
    1993,
    1994,
    1995,
    1996,
    1997,
    1998,
    2000,
    2001,
    2002,
    2003,
    2004,
    2005,
    2006,
    2007,
    2009,
    2010,
    2011,
    2012,
    2013,
    2014,
    2016,
    2017,
    2018,
    2019,
    2020,
    2021,
    2022,
    2023,
    2024,
    2025,
    2026,
    2027
  ];

  @override
  Widget build(BuildContext context) {
    size = Measurements(MediaQuery.of(context).size);
    Future<void> postData() async {
      const url = BaseUrl.profileWork; // Replace with your Django API URL

      try {
        final response = await http.post(
          Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'position': positionController.text,
            'startYear': startYearDropdownValue,
            'endYear': endYearDropdownValue,
            'pursuing': pursuingCheckbox,
          }),
        );

        if (response.statusCode == 200) {
          print('Data sent successfully!');
        } else {
          print('Failed to send data. Status code: ${response.statusCode}');
        }
      } catch (e) {
        print('Error sending data: $e');
      }
    }

    final labelTextStyle = Theme.of(context).textTheme.titleSmall!.copyWith(
        fontSize: 16.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        color: titlecolor);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: size?.hp(15),
        margin: const EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              Container(
                width: size?.wp(87),
                height: size?.hp(5),
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {
                    // print the controller values full

                    print(positionController.text);
                    print(startYearDropdownValue);
                    print(endYearDropdownValue);
                    print(pursuingCheckbox);
                    postData();
                  },
                  child: Text(
                    'Save',
                    textScaleFactor: 1.25,
                    style: TextStyle(
                       fontFamily: 'Roboto',
                      color: thirdColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              vGap(20),
              Container(
                width: size?.wp(87),
                height: size?.hp(5),
                decoration: BoxDecoration(
                  color: White,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Cancel',
                    textScaleFactor: 1.25,
                    style: TextStyle(
                       fontFamily: 'Roboto',
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: cblack10,
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: whiteColor,
        title: Text(
          "Work Details",
          style: labelTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0, left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vGap(10),
            TextField(
              controller: positionController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Work Position ',
                hintText: 'Work Position ',
              ),
            ),
            vGap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.black),
                        color: White,
                      ),
                      child: Center(
                        child: DropdownButton<String>(
                          underline: SizedBox(),
                          hint: Text("--Start Year--"),
                          value: startYearDropdownValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              startYearDropdownValue = newValue!;
                            });
                          },
                          items:
                              years.map<DropdownMenuItem<String>>((int value) {
                            return DropdownMenuItem<String>(
                              value: value.toString(),
                              child: Text(
                                value.toString(),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text('Pursuing'),
                      value: pursuingCheckbox,
                      onChanged: (value) {
                        setState(() {
                          pursuingCheckbox = !pursuingCheckbox;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: White,
                      ),
                      child: Center(
                        child: DropdownButton<String>(
                          underline: SizedBox(),
                          hint: Text("--End Year--"),
                          value: endYearDropdownValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              endYearDropdownValue = newValue!;
                            });
                          },
                          items:
                              years.map<DropdownMenuItem<String>>((int value) {
                            return DropdownMenuItem<String>(
                              value: value.toString(),
                              child: Text(value.toString()),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
