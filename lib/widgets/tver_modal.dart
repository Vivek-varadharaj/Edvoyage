import 'package:flutter/material.dart';
import '../_env/env.dart';
import '../utils/colors/colors.dart';
import '../utils/responsive.dart';
import 'package:http/http.dart' as http;

class DropDownDemo extends StatefulWidget {
  @override
  _DropDownDemoState createState() => _DropDownDemoState();
}

class _DropDownDemoState extends State<DropDownDemo> {
  String dropdownValue = 'January';
  String yearvalue = "2023";
  String Email = "";
  Measurements? size;

  @override
  Widget build(BuildContext context) {
    size = Measurements(MediaQuery.of(context).size);
    Future<void> ApplicationSubmit() async {
      var url = Uri.parse(BaseUrl.applicationSubmit);
      var response = await http.post(url, body: {
        'year': yearvalue,
        'month': dropdownValue,
        'email_id': Email,
      });
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size?.hp(2)),
          Center(
            child: Text(
              "Apply university",
              style: TextStyle(
                 fontFamily: 'Roboto',fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: size?.hp(2)),
          Container(
            height: 50,
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: grey4),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: grey4),
                ),
                filled: true,
                fillColor: grey4,
                contentPadding: EdgeInsets.only(left: 10, right: 10),
              ),
              dropdownColor: grey4,
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>[
                'January',
                'February',
                'March',
                'May',
                'June',
                'July',
                'August',
                'September',
                'October',
                'November',
                'December',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 20, fontFamily: 'Roboto',),
                  ),
                );
              }).toList(),
            ),
          ),
          Text(
            "Choose Intake year",
            style: TextStyle( fontFamily: 'Roboto',fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Container(
            height: 50,
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: grey4),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: grey4),
                ),
                filled: true,
                fillColor: grey4,
                contentPadding: EdgeInsets.only(left: 10, right: 10),
              ),
              dropdownColor: grey4,
              value: yearvalue,
              onChanged: (String? newsValue) {
                setState(() {
                  yearvalue = newsValue!;
                });
              },
              items: <String>[
                '2023',
                '2024',
                '2025',
                '2026',
                '2027',
                '2028',
                '2029',
              ].map<DropdownMenuItem<String>>((String values) {
                return DropdownMenuItem<String>(
                  value: values,
                  child: Text(
                    values,
                    style: TextStyle(fontSize: 20, fontFamily: 'Roboto',),
                  ),
                );
              }).toList(),
            ),
          ),
          Text(
            "Choose Intake Month",
            style: TextStyle(fontSize: 20, fontFamily: 'Roboto', fontWeight: FontWeight.w600),
          ),
          Container(
            height: 50,
            child: TextFormField(
              onFieldSubmitted: (value) {
                // Email = value;
                // wrap in setState and update the value of email and print it
                setState(() {
                  Email = value;
                  print(Email);
                });
              },
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                fillColor: grey4,
                labelText: 'Email id',
                isDense: true,
                filled: true,
                hintText: " ",
                hintStyle: TextStyle(fontFamily: 'Roboto', color: textColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: grey4),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: grey4),
                ),
              ),
            ),
          ),
          SizedBox(height: size?.hp(3)),
          Container(
            height: size?.hp(5),
            width: getWidth(context),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () {
                ApplicationSubmit();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ), // Adjust the border radius as needed
                      ),
                      title: Text(
                        "Application has been submitted successfully",
                        style: TextStyle(
                          letterSpacing: 2,
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          color: primaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      content: Text(
                        "Your Academic Councillor will be in touch with you shortly",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 15,
                          color: primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  },
                );
                // now when this button is pressed, the values in the DropdownButtonFormField and the TextFormField will be sent to the backend server
                // using http.post method

                Future.delayed(Duration(seconds: 3), () {
                  Navigator.of(context).pop(); // Close the modal sheet
                });
              },
              child: Text(
                "Submit",
                style: TextStyle(
                  letterSpacing: 2,
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  color: thirdColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
