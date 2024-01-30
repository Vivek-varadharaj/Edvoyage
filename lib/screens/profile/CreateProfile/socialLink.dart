import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../../../_env/env.dart';
import '../../../utils/colors/colors.dart';
import '../../../utils/responsive.dart';
import '../../../widgets/long_button.dart';

class SocialLink extends StatefulWidget {
  @override
  _SocialLinkState createState() => _SocialLinkState();
}

class _SocialLinkState extends State<SocialLink> {
  Measurements? size;

  TextEditingController facebookController = TextEditingController();
  TextEditingController linkedInController = TextEditingController();

  Future<void> sendSocialLinks() async {
    final url =
        BaseUrl.profileSocial; // Replace with your Django backend API URL

    final response = await http.post(
      Uri.parse(url),
      body: {
        'facebook_link': facebookController.text,
        'linkedin_link': linkedInController.text,
      },
    );

    if (response.statusCode == 200) {
      print('Data sent successfully!');
    } else {
      print('Failed to send data. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    size = Measurements(MediaQuery.of(context).size);

    final labelTextStyle = Theme.of(context).textTheme.titleSmall!.copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'Roboto',
          // Assuming titlecolor is defined somewhere
          color: titlecolor,
        );

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
                    sendSocialLinks(); // Call the function to send data
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
                  color: Colors.white, // Use Colors.white instead of White
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
        backgroundColor: Colors.white, // Use Colors.white instead of whiteColor
        title: Text(
          "Social Links",
          style: labelTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0, left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Facebook",
              style: labelTextStyle,
            ),
            vGap(10),
            TextField(
              controller: facebookController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Your Link',
                hintText: 'Enter your link',
              ),
            ),
            vGap(20),
            Text(
              "LinkedIn",
              style: labelTextStyle,
            ),
            vGap(10),
            TextField(
              controller: linkedInController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Your Link',
                hintText: 'Enter your link',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
