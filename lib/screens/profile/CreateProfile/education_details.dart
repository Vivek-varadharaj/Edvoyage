import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/_env/env.dart';
import 'package:frontend/utils/Toasty.dart';
import 'package:http/http.dart' as http;
import '../../../utils/colors/colors.dart';
import '../../../utils/responsive.dart';
import '../../../widgets/long_button.dart';

class EducationDetails extends StatefulWidget {
  @override
  _EducationDetailsState createState() => _EducationDetailsState();
}

class _EducationDetailsState extends State<EducationDetails> {
  Measurements? size;
  String? dropdownValueStartYearHigher;
  String? dropdownValueEndYearHigher;
  TextEditingController gradeControllerHigher = TextEditingController();

  String? dropdownValueStartYearSecondary;
  String? dropdownValueEndYearSecondary;
  TextEditingController gradeControllerSecondary = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _checkbox = false;
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
    1999,
    2000,
    2001,
    2002,
    2003,
    2004,
    2005,
    2006,
    2007,
    2008,
    2009,
    2010,
    2011,
    2012,
    2013,
    2014,
    2015,
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

  Future<void> sendDataToBackend() async {
    final url = BaseUrl.profileEducation;

    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'higher_education_start_year': dropdownValueStartYearHigher ?? '',
          'higher_education_end_year': dropdownValueEndYearHigher ?? '',
          'higher_education_grade': gradeControllerHigher.text,
          'secondary_education_start_year':
              dropdownValueStartYearSecondary ?? '',
          'secondary_education_end_year': dropdownValueEndYearSecondary ?? '',
          'secondary_education_grade': gradeControllerSecondary.text,
        },
      );

      if (response.statusCode == 200) {
        print('Data sent successfully!');
        Toasty.showtoast('Data sent successfully!');
      } else {
        print('Failed to send data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error sending data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    size = Measurements(MediaQuery.of(context).size);

    final labelTextStyle = Theme.of(context).textTheme.titleSmall!.copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'Roboto',
          color: titlecolor,
        );

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          "Educational Details",
          style: labelTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0, left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vGap(10),
            Text(
              "Higher Education",
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  color: secondaryColor),
            ),
            vGap(10),
            Padding(
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
                    value: dropdownValueStartYearHigher,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValueStartYearHigher = newValue!;
                      });
                    },
                    items: years.map<DropdownMenuItem<String>>((int value) {
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
            vGap(20),
            Padding(
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
                    hint: Text("--End Year--"),
                    value: dropdownValueEndYearHigher,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValueEndYearHigher = newValue!;
                      });
                    },
                    items: <String>['Drop1', 'Drop2', 'Drop3', 'Drop4']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: White,
                      ),
                      child: TextField(
                        controller: gradeControllerHigher,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Grade(%)',
                          hintText: 'Enter Grade(%)',
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("(Visible only to user)")),
                )
              ],
            ),
            Divider(
              thickness: 1,
            ),
            vGap(10),
            Text(
              "Secondary Education",
              style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  color: secondaryColor),
            ),
            vGap(10),
            Padding(
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
                    value: dropdownValueStartYearSecondary,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValueStartYearSecondary = newValue!;
                      });
                    },
                    items: <String>['Drop1', 'Drop2', 'Drop3', 'Drop4']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            vGap(20),
            Padding(
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
                    hint: Text("--End Year--"),
                    value: dropdownValueEndYearSecondary,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValueEndYearSecondary = newValue!;
                      });
                    },
                    items: <String>['Drop1', 'Drop2', 'Drop3', 'Drop4']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: White,
                      ),
                      child: TextField(
                        controller: gradeControllerSecondary,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Grade(%)',
                          hintText: 'Enter Grade(%)',
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("(Visible only to user)")),
                )
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    vGap(20),
                    Container(
                      width: size?.wp(87),
                      height: size?.hp(5),
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                        onPressed: () {
                          // Access the values using the controllers
                          print(
                              'Higher Education Start Year: $dropdownValueStartYearHigher');
                          print(
                              'Higher Education End Year: $dropdownValueEndYearHigher');
                          print(
                              'Higher Education Grade: ${gradeControllerHigher.text}');

                          print(
                              'Secondary Education Start Year: $dropdownValueStartYearSecondary');
                          print(
                              'Secondary Education End Year: $dropdownValueEndYearSecondary');
                          print(
                              'Secondary Education Grade: ${gradeControllerSecondary.text}');
                          sendDataToBackend();
                        },
                        child: Text(
                          'Submit',
                          textScaleFactor: 1.25,
                          style: TextStyle(
                            color: thirdColor,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
